using UndertaleModLib.Models;
using UndertaleModLib.Util;
using UndertaleModLib.Decompiler;
using System.Linq;


// Used Endless Void merger.csx as reference

EnsureDataLoaded();

string runningDirectory = Path.GetDirectoryName(ScriptPath);

string PatchesPath = Path.GetFullPath(Path.Combine(runningDirectory, "..", "patches"));

Data.GeneralInfo.Info |= UndertaleGeneralInfo.InfoFlags.ShowCursor;
Data.Options.Info |= UndertaleOptions.OptionsFlags.ShowCursor;

//FONTS

int lastTextPage = Data.EmbeddedTextures.Count - 1;
int lastTextPageItem = Data.TexturePageItems.Count - 1;

string FontsPath = Path.GetFullPath(Path.Combine(runningDirectory, "..", "fonts"));
string[] FontFiles = Directory.GetFiles(FontsPath);

foreach (string file in FontFiles) {
	if (Path.GetExtension(file) == ".png") {
		UndertaleEmbeddedTexture texture = new UndertaleEmbeddedTexture();
		texture.Name = new UndertaleString($"Texture {++lastTextPage}");
		texture.TextureData.Image = GMImage.FromPng(File.ReadAllBytes(file));
		Data.EmbeddedTextures.Add(texture);
		
		UndertaleTexturePageItem texturePageItem = new UndertaleTexturePageItem();
		texturePageItem.Name = new UndertaleString($"PageItem {++lastTextPageItem}");
		texturePageItem.SourceX = 0;
		texturePageItem.SourceY = 0;
		texturePageItem.SourceWidth = (ushort)texture.TextureData.Image.Width;
		texturePageItem.SourceHeight = (ushort)texture.TextureData.Image.Height;
		texturePageItem.TargetX = 0;
		texturePageItem.TargetY = 0;
		texturePageItem.TargetWidth = (ushort)texture.TextureData.Image.Width;
		texturePageItem.TargetHeight = (ushort)texture.TextureData.Image.Height;
		texturePageItem.BoundingWidth = (ushort)texture.TextureData.Image.Width;
		texturePageItem.BoundingHeight = (ushort)texture.TextureData.Image.Height;
		texturePageItem.TexturePage = texture;
		Data.TexturePageItems.Add(texturePageItem);
		
		string fontName = Path.GetFileNameWithoutExtension(file);
		UndertaleString fontUTString = Data.Strings.MakeString(fontName);
		UndertaleFont newFont = new UndertaleFont();
		newFont.Name = fontUTString;
		fontUpdate(newFont);
		newFont.Texture = texturePageItem;
		Data.Fonts.Add(newFont);
	}
}


// From ImportFonts.csx
public void fontUpdate(UndertaleFont newFont)
{
    using (StreamReader reader = new StreamReader(Path.Combine(FontsPath, $"glyphs_{newFont.Name.Content}.csv")))
    {
        newFont.Glyphs.Clear();
        string line;
        int head = 0;
        bool hadError = false;
        while ((line = reader.ReadLine()) != null)
        {
            string[] s = line.Split(';');

            // Skip blank lines like ";;;;;;;"
            if (s.All(x => x.Length == 0))
                continue;

            try
            {
                if (head == 1)
                {
                    newFont.RangeStart = UInt16.Parse(s[0]);
                    head++;
                }

                if (head == 0)
                {
                    String namae = s[0].Replace("\"", "");
                    newFont.DisplayName = Data.Strings.MakeString(namae);
                    newFont.EmSize = UInt16.Parse(s[1]);
                    newFont.Bold = Boolean.Parse(s[2]);
                    newFont.Italic = Boolean.Parse(s[3]);
                    newFont.Charset = Byte.Parse(s[4]);
                    newFont.AntiAliasing = Byte.Parse(s[5]);
                    newFont.ScaleX = UInt16.Parse(s[6]);
                    newFont.ScaleY = UInt16.Parse(s[7]);
                    head++;
                }

                if (head > 1)
                {
                    newFont.Glyphs.Add(new UndertaleFont.Glyph()
                    {
                        Character = UInt16.Parse(s[0]),
                        SourceX = UInt16.Parse(s[1]),
                        SourceY = UInt16.Parse(s[2]),
                        SourceWidth = UInt16.Parse(s[3]),
                        SourceHeight = UInt16.Parse(s[4]),
                        Shift = Int16.Parse(s[5]),
                        Offset = Int16.Parse(s[6]),
                    });
                    newFont.RangeEnd = UInt32.Parse(s[0]);
                }
            }
            catch
            {
                hadError = true;
            }
        }

        if (hadError)
        {
            ScriptError($"File \"glyphs_{newFont.Name.Content}.csv\" contained some invalid data.", "Format error", false);
            hadError = false;
        }
    }
}

/**********************/

// Apply the patches

string[] files = Directory.GetFiles(PatchesPath);

bool doParse = true;
UndertaleModLib.Compiler.CodeImportGroup importGroup = new(Data) {
	AutoCreateAssets = doParse
};
foreach (string file in files) {
	if (Path.GetExtension(file) == ".pat") {
		string codeEntryName = Path.GetFileNameWithoutExtension(file);
		string patches = File.ReadAllText(file);
		applyPatches(codeEntryName, patches);
	}
}
importGroup.Import();

void applyPatches(string codeEntryName, string patches) {
	UndertaleCode entry = Data.Code.ByName(codeEntryName);
        if (entry != null) {
		string targetPattern = @"// TARGET: ([^\n]+)";
		string[] sections = Regex.Split(patches.Replace("\r\n", "\n"), targetPattern);
		
		string code = GetDecompiledText(entry);
		string finalResult = String.Copy(code);
		
		for (int i = 1; i < sections.Length; i += 2) {
			string[] target = sections[i].Trim('\n').Split('_');
			string patch = sections[i + 1].Trim('\n');
			switch (target[0]) {
				case "LINENUMBER":
					string[] lines = finalResult.Split('\n');
					var lines2 = new List<string>(lines);
					
					int firstNewline = (patch+"\n").IndexOf("\n");
					int[] args = Array.ConvertAll(patch.Substring(2, firstNewline - 2).Split(':'), int.Parse);
					for (int _i = 0; _i < args.Length; _i++)
						if (args[_i] < 0) args[_i] += lines.Length + 1;
					int[] ends = [args[0] - 1, 1];
					if (args.Length > 1) ends[1] = args[1] - args[0];
					
					if (target.Length == 1) 
						lines2.Insert(ends[0], patch.Substring(firstNewline + 1));
					else if (target[1] == "REPLACE") {
						lines2[ends[0]] = patch.Substring(firstNewline + 1);
						lines2.RemoveRange(ends[0] + 1, ends[1] - 1);
					}
					else if (target[1] == "REMOVE") {
						lines2.RemoveRange(ends[0], ends[1]);
					}
					
					finalResult = string.Join("\n", lines2);
					break;
				case "REPLACE":
					finalResult = patch;
					break;
				case "STRING":
					string[] parts = patch.Split('>');
					finalResult = finalResult.Replace(parts[0], parts[1]);
					break;
				default:
					ScriptMessage("Error!");
					break;
			}
		}
		importGroup.QueueReplace(entry, finalResult);
	} else {
		importGroup.QueueReplace(codeEntryName, patches);
	}
}

ScriptMessage("Done! Game patched!");