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
	string targetPattern = @"^(\d+(?:,\d+)?)([ac]\n(.*?)^\.$|d)";
	MatchCollection matches = Regex.Matches(patches.Replace("\r\n", "\n"), targetPattern, RegexOptions.Multiline | RegexOptions.Singleline);
	
	UndertaleCode entry = Data.Code.ByName(codeEntryName);
	if (entry == null) {
		importGroup.QueueReplace(codeEntryName, "");
		entry = Data.Code.ByName(codeEntryName);
	}
	
	string code = GetDecompiledText(entry);
	var lines = new List<string>(String.Copy(code).Split('\n'));
	
	foreach (Match match in matches.Reverse()) {
		int i = 0;
		int[] range = {0,1};
		foreach (string n in match.Groups[1].Value.Split(',')) {
			range[i++] = Int32.Parse(n) - 1;
		}
		if (i == 2) range[1] -= range[0] - 1;
		char command = match.Groups[2].Value[0];
		string body = match.Groups[3].Value;
		
		switch (command) {
			case 'a':
				lines.Insert(range[0] + 1, body);
				break;
			case 'd':
				lines.RemoveRange(range[0], range[1]);
				break;
			case 'c':
				lines.RemoveRange(range[0], range[1]);
				lines.Insert(range[0], body);
				break;
		}
	}
	string finalResult = string.Join("\n", lines);
	importGroup.QueueReplace(entry, finalResult);
}

ScriptMessage("Done! Game patched!");