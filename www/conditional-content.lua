-- conditional-content.lua
--

  local function matchAny(str, patternList)
for _, pattern in ipairs(patternList) do
local w = str:match(pattern)
if w then return w end
end
end

local webFormats = {'html','revealjs'}
local printFormats = {'latex','docx','pdf','opendocument','odt','beamer','epub'}


return {
  {
    -- discard the content of a div if the output format doesn't match
  Div = function(div)
    if (div.classes:includes('web-only') and not matchAny(FORMAT,  webFormats) or
      div.classes:includes('print-only') and not matchAny(FORMAT, printFormats)) then
        return {}
    else
      return div
    end
  end,
  }
}
