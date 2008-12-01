" Vim syntax file
" Language:	medpc
" Version: 2.8
" Last Change:	2004/10/17 17:47:30
" Maintainer:  Xavier Crégut <xavier.cregut@enseeiht.fr>
" Previous Maintainer:	Mario Eusebio <bio@dq.fct.unl.pt>

" Contributors: Tim Chase <tchase@csc.com>,
"	Stas Grabois <stsi@vtrails.com>,
"	Mazen NEIFER <mazen.neifer.2001@supaero.fr>,
"	Klaus Hast <Klaus.Hast@arcor.net>,
"	Austin Ziegler <austin@halostatue.ca>,
"	Markus Koenig <markus@stber-koenig.de>

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn case ignore
syn sync lines=250

syn match medpcStatesetMarker "^[ \t]*S\.S\.\d\+,"
syn match medpcStateMarker "^ *S\d\+,"

syn match medpcOutputZ "[: ;\t]Z\(\d\{1,2\}\|\^[A-Za-z0-9_]\+\|[A-Za-z]\{1\}\((\([0-9]\{1,2\}\|\^[A-Za-z0-9_]\))\)\?\)"

syn match medpcInputZ "^[ \t]*#Z\(\d\{1,2\}\|\^[A-Za-z0-9_]\+\)[ \t]*:"
syn match medpcInputR "^[ \t]*#\d\?R\(\d\{1,2\}\|\^[A-Za-z0-9_]\+\)[ \t]*:"
syn match medpcInputR "^[ \t]*#\d\?R[A-Za-z]\+\((\(\d\+\|\^[A-Za-z0-9_]\+\))\)\?[ \t]*:"
syn match medpcInputStart "^[ \t]*#START[ \t]*:"
syn match medpcInputTime "^[ \t]*\d\+\(\.\d\+\)\?['\"][ \t]*:"

syn match medpcOutputArrow "--->"
syn match medpcOutputStateTrans "S[0-9]\{1,2\}$"
syn keyword medpcOutputNullTrans SX

syn match medpcConstantDeclaration "^[ \t]*\^[A-Za-z0-9_]\+"
syn match medpcConstantInline "\^[A-Za-z0-9_]\+"

"syn match medpcOperator "[ 0-9"'\^]*"
syn keyword medpcOperator	ADD SUB ON OFF CLEAR SET SHOW LIMIT Y2KCOMPLIANT DIM
syn keyword medpcConditional	IF

syn keyword medpcType		Var_Alias

syn match medpcLabel		"@[^,:\]]\+"

"syn keyword medpcBoolean	true false
"syn keyword medpcConditional	if else then
"syn keyword medpcConstant	nil maxint
"syn keyword medpcLabel		case goto label
"syn keyword medpcOperator	and div downto in mod not of or packed with
"syn keyword medpcRepeat	do for do repeat while to until
"syn keyword medpcStatement	procedure function
"syn keyword medpcStatement	program begin end const var type
"syn keyword medpcStruct	record
"syn keyword medpcType		array boolean char integer file pointer real set
"syn keyword medpcType		string text variant
"
"
"    " 20011222az: Added new items.
"syn keyword medpcTodo contained	TODO FIXME XXX DEBUG NOTE
"
"    " 20010723az: When wanted, highlight the trailing whitespace -- this is
"    " based on c_space_errors; to enable, use "medpc_space_errors".
"if exists("medpc_space_errors")
"    if !exists("medpc_no_trail_space_error")
"        syn match medpcSpaceError "\s\+$"
"    endif
"    if !exists("medpc_no_tab_space_error")
"        syn match medpcSpaceError " \+\t"me=e-1
"    endif
"endif
"
"" syn match   medpcIdentifier		"\<[a-zA-Z_][a-zA-Z0-9_]*\>"
"
if exists("medpc_symbol_operator")
  syn match   medpcSymbolOperator      "[+\-/*=]"
  syn match   medpcSymbolOperator      "[<>]=\="
  syn match   medpcSymbolOperator      "<>"
  syn match   medpcSymbolOperator      "[()]"
endif

"syn match  medpcNumber		"-\=\<\d\+\>"
"syn match  medpcFloat		"-\=\<\d\+\.\d\+\>"

syn region medpcComment		start="^\\\|\s\\"  end="$" contains=medpcTodo,medpcSpaceError

"if !exists("medpc_no_functions")
"  " array functions
"  syn keyword medpcFunction	pack unpack
"
"  " memory function
"  syn keyword medpcFunction	Dispose New
"
"  " math functions
"  syn keyword medpcFunction	Abs Arctan Cos Exp Ln Sin Sqr Sqrt
"
"  " file functions
"  syn keyword medpcFunction	Eof Eoln Write Writeln
"  syn keyword medpcPredefined	Input Output
"
"  if exists("medpc_traditional")
"    " These functions do not seem to be defined in Turbo medpc
"    syn keyword medpcFunction	Get Page Put 
"  endif
"
"  " ordinal functions
"  syn keyword medpcFunction	Odd Pred Succ
"
"  " transfert functions
"  syn keyword medpcFunction	Chr Ord Round Trunc
"endif
"
"
"if !exists("medpc_traditional")
"
"  syn keyword medpcStatement	constructor destructor implementation inherited
"  syn keyword medpcStatement	interface unit uses
"  syn keyword medpcModifier	absolute assembler external far forward inline
"  syn keyword medpcModifier	interrupt near virtual 
"  syn keyword medpcAcces	private public 
"  syn keyword medpcStruct	object 
"  syn keyword medpcOperator	shl shr xor
"
"  syn region medpcPreProc	start="(\*\$"  end="\*)" contains=medpcTodo
"  syn region medpcPreProc	start="{\$"  end="}"
"
"  syn region  medpcAsm		matchgroup=medpcAsmKey start="\<asm\>" end="\<end\>" contains=medpcComment,medpcPreProc
"
"  syn keyword medpcType	ShortInt LongInt Byte Word
"  syn keyword medpcType	ByteBool WordBool LongBool
"  syn keyword medpcType	Cardinal LongWord
"  syn keyword medpcType	Single Double Extended Comp
"  syn keyword medpcType	PChar
"
"
"  if !exists ("medpc_fpc")
"    syn keyword medpcPredefined	Result
"  endif
"
"  if exists("medpc_fpc")
"    syn region medpcComment        start="//" end="$" contains=medpcTodo,medpcSpaceError
"    syn keyword medpcStatement	fail otherwise operator
"    syn keyword medpcDirective	popstack
"    syn keyword medpcPredefined self
"    syn keyword medpcType	ShortString AnsiString WideString
"  endif
"
"  if exists("medpc_gpc")
"    syn keyword medpcType	SmallInt
"    syn keyword medpcType	AnsiChar
"    syn keyword medpcType	PAnsiChar
"  endif
"
"  if exists("medpc_delphi")
"    syn region medpcComment	start="//"  end="$" contains=medpcTodo,medpcSpaceError
"    syn keyword medpcType	SmallInt Int64
"    syn keyword medpcType	Real48 Currency
"    syn keyword medpcType	AnsiChar WideChar
"    syn keyword medpcType	ShortString AnsiString WideString
"    syn keyword medpcType	PAnsiChar PWideChar
"    syn match  medpcFloat	"-\=\<\d\+\.\d\+[dD]-\=\d\+\>"
"    syn match  medpcStringEscape	contained "#[12]\d\=\d\="
"    syn keyword medpcStruct	class dispinterface
"    syn keyword medpcException	try except raise at on finally
"    syn keyword medpcStatement	out
"    syn keyword medpcStatement	library package 
"    syn keyword medpcStatement	initialization finalization uses exports
"    syn keyword medpcStatement	property out resourcestring threadvar
"    syn keyword medpcModifier	contains
"    syn keyword medpcModifier	overridden reintroduce abstract
"    syn keyword medpcModifier	override export dynamic name message
"    syn keyword medpcModifier	dispid index stored default nodefault readonly
"    syn keyword medpcModifier	writeonly implements overload requires resident
"    syn keyword medpcAcces	protected published automated
"    syn keyword medpcDirective	register medpc cvar cdecl stdcall safecall
"    syn keyword medpcOperator	as is
"  endif
"
"  if exists("medpc_no_functions")
"    "syn keyword medpcModifier	read write
"    "may confuse with Read and Write functions.  Not easy to handle.
"  else
"    " control flow functions
"    syn keyword medpcFunction	Break Continue Exit Halt RunError
"
"    " ordinal functions
"    syn keyword medpcFunction	Dec Inc High Low
"
"    " math functions
"    syn keyword medpcFunction	Frac Int Pi
"
"    " string functions
"    syn keyword medpcFunction	Concat Copy Delete Insert Length Pos Str Val
"
"    " memory function
"    syn keyword medpcFunction	FreeMem GetMem MaxAvail MemAvail
"
"    " pointer and address functions
"    syn keyword medpcFunction	Addr Assigned CSeg DSeg Ofs Ptr Seg SPtr SSeg
"
"    " misc functions
"    syn keyword medpcFunction	Exclude FillChar Hi Include Lo Move ParamCount
"    syn keyword medpcFunction	ParamStr Random Randomize SizeOf Swap TypeOf
"    syn keyword medpcFunction	UpCase
"
"    " predefined variables
"    syn keyword medpcPredefined ErrorAddr ExitCode ExitProc FileMode FreeList
"    syn keyword medpcPredefined FreeZero HeapEnd HeapError HeapOrg HeapPtr
"    syn keyword medpcPredefined InOutRes OvrCodeList OvrDebugPtr OvrDosHandle
"    syn keyword medpcPredefined OvrEmsHandle OvrHeapEnd OvrHeapOrg OvrHeapPtr
"    syn keyword medpcPredefined OvrHeapSize OvrLoadList PrefixSeg RandSeed
"    syn keyword medpcPredefined SaveInt00 SaveInt02 SaveInt1B SaveInt21
"    syn keyword medpcPredefined SaveInt23 SaveInt24 SaveInt34 SaveInt35
"    syn keyword medpcPredefined SaveInt36 SaveInt37 SaveInt38 SaveInt39
"    syn keyword medpcPredefined SaveInt3A SaveInt3B SaveInt3C SaveInt3D
"    syn keyword medpcPredefined SaveInt3E SaveInt3F SaveInt75 SegA000 SegB000
"    syn keyword medpcPredefined SegB800 SelectorInc StackLimit Test8087
"
"    " file functions
"    syn keyword medpcFunction	Append Assign BlockRead BlockWrite ChDir Close
"    syn keyword medpcFunction	Erase FilePos FileSize Flush GetDir IOResult
"    syn keyword medpcFunction	MkDir Read Readln Rename Reset Rewrite RmDir
"    syn keyword medpcFunction	Seek SeekEof SeekEoln SetTextBuf Truncate
"
"    " crt unit
"    syn keyword medpcFunction	AssignCrt ClrEol ClrScr Delay DelLine GotoXY
"    syn keyword medpcFunction	HighVideo InsLine KeyPressed LowVideo NormVideo
"    syn keyword medpcFunction	NoSound ReadKey Sound TextBackground TextColor
"    syn keyword medpcFunction	TextMode WhereX WhereY Window
"    syn keyword medpcPredefined CheckBreak CheckEOF CheckSnow DirectVideo
"    syn keyword medpcPredefined LastMode TextAttr WindMin WindMax
"    syn keyword medpcFunction BigCursor CursorOff CursorOn
"    syn keyword medpcConstant Black Blue Green Cyan Red Magenta Brown
"    syn keyword medpcConstant LightGray DarkGray LightBlue LightGreen
"    syn keyword medpcConstant LightCyan LightRed LightMagenta Yellow White
"    syn keyword medpcConstant Blink ScreenWidth ScreenHeight bw40
"    syn keyword medpcConstant co40 bw80 co80 mono
"    syn keyword medpcPredefined TextChar 
"
"    " DOS unit
"    syn keyword medpcFunction	AddDisk DiskFree DiskSize DosExitCode DosVersion
"    syn keyword medpcFunction	EnvCount EnvStr Exec Expand FindClose FindFirst
"    syn keyword medpcFunction	FindNext FSearch FSplit GetCBreak GetDate
"    syn keyword medpcFunction	GetEnv GetFAttr GetFTime GetIntVec GetTime
"    syn keyword medpcFunction	GetVerify Intr Keep MSDos PackTime SetCBreak
"    syn keyword medpcFunction	SetDate SetFAttr SetFTime SetIntVec SetTime
"    syn keyword medpcFunction	SetVerify SwapVectors UnPackTime
"    syn keyword medpcConstant	FCarry FParity FAuxiliary FZero FSign FOverflow
"    syn keyword medpcConstant	Hidden Sysfile VolumeId Directory Archive
"    syn keyword medpcConstant	AnyFile fmClosed fmInput fmOutput fmInout
"    syn keyword medpcConstant	TextRecNameLength TextRecBufSize
"    syn keyword medpcType	ComStr PathStr DirStr NameStr ExtStr SearchRec
"    syn keyword medpcType	FileRec TextBuf TextRec Registers DateTime
"    syn keyword medpcPredefined DosError
"
"    "Graph Unit
"    syn keyword medpcFunction	Arc Bar Bar3D Circle ClearDevice ClearViewPort
"    syn keyword medpcFunction	CloseGraph DetectGraph DrawPoly Ellipse
"    syn keyword medpcFunction	FillEllipse FillPoly FloodFill GetArcCoords
"    syn keyword medpcFunction	GetAspectRatio GetBkColor GetColor
"    syn keyword medpcFunction	GetDefaultPalette GetDriverName GetFillPattern
"    syn keyword medpcFunction	GetFillSettings GetGraphMode GetImage
"    syn keyword medpcFunction	GetLineSettings GetMaxColor GetMaxMode GetMaxX
"    syn keyword medpcFunction	GetMaxY GetModeName GetModeRange GetPalette
"    syn keyword medpcFunction	GetPaletteSize GetPixel GetTextSettings
"    syn keyword medpcFunction	GetViewSettings GetX GetY GraphDefaults
"    syn keyword medpcFunction	GraphErrorMsg GraphResult ImageSize InitGraph
"    syn keyword medpcFunction	InstallUserDriver InstallUserFont Line LineRel
"    syn keyword medpcFunction	LineTo MoveRel MoveTo OutText OutTextXY
"    syn keyword medpcFunction	PieSlice PutImage PutPixel Rectangle
"    syn keyword medpcFunction	RegisterBGIDriver RegisterBGIFont
"    syn keyword medpcFunction	RestoreCRTMode Sector SetActivePage
"    syn keyword medpcFunction	SetAllPallette SetAspectRatio SetBkColor
"    syn keyword medpcFunction	SetColor SetFillPattern SetFillStyle
"    syn keyword medpcFunction	SetGraphBufSize SetGraphMode SetLineStyle
"    syn keyword medpcFunction	SetPalette SetRGBPalette SetTextJustify
"    syn keyword medpcFunction	SetTextStyle SetUserCharSize SetViewPort
"    syn keyword medpcFunction	SetVisualPage SetWriteMode TextHeight TextWidth
"    syn keyword medpcType	ArcCoordsType FillPatternType FillSettingsType
"    syn keyword medpcType	LineSettingsType PaletteType PointType
"    syn keyword medpcType	TextSettingsType ViewPortType
"
"    " string functions
"    syn keyword medpcFunction	StrAlloc StrBufSize StrCat StrComp StrCopy
"    syn keyword medpcFunction	StrDispose StrECopy StrEnd StrFmt StrIComp
"    syn keyword medpcFunction	StrLCat StrLComp StrLCopy StrLen StrLFmt
"    syn keyword medpcFunction	StrLIComp StrLower StrMove StrNew StrPas
"    syn keyword medpcFunction	StrPCopy StrPLCopy StrPos StrRScan StrScan
"    syn keyword medpcFunction	StrUpper
"  endif
"
"endif
"
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_medpc_syn_inits")
  if version < 508
    let did_medpc_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

"  HiLink medpcAcces		medpcStatement
"  HiLink medpcBoolean		Boolean
  HiLink medpcComment		Comment
  HiLink medpcLabel		Comment

  HiLink medpcConditional	Conditional

  HiLink medpcOutputZ		Identifier

  HiLink medpcInputZ		Identifier
  HiLink medpcInputR		Identifier
  HiLink medpcInputTime		Identifier
  HiLink medpcInputStart	Identifier

  HiLink medpcOutputArrow	Label
  HiLink medpcOutputStateTrans	Identifier
  HiLink medpcOutputNullTrans	Identifier
  
  HiLink medpcConstant		Constant
  HiLink medpcConstantInline	Constant

  HiLink medpcStatesetMarker	Function
  HiLink medpcStateMarker	Function

"  HiLink medpcDelimiter	Identifier
"  HiLink medpcDirective	medpcStatement
"  HiLink medpcException	Exception
  HiLink medpcFloat		Float
  HiLink medpcType		Label
"  HiLink medpcFunction		Function
"  HiLink medpcLabel		Label
"  HiLink medpcMatrixDelimiter	Identifier
"  HiLink medpcModifier		Type
"  HiLink medpcNumber		Number
  HiLink medpcOperator		Operator
"  HiLink medpcPredefined	medpcStatement
"  HiLink medpcPreProc		PreProc
"  HiLink medpcRepeat		Repeat
"  HiLink medpcSpaceError	Error
"  HiLink medpcStatement	Statement
"  HiLink medpcString		String
"  HiLink medpcStringEscape	Special
"  HiLink medpcStringEscapeGPC	Special
"  HiLink medpcStringError	Error
"  HiLink medpcStruct		medpcStatement
  HiLink medpcSymbolOperator	medpcOperator
"  HiLink medpcTodo		Todo
"  HiLink medpcType		Type
"  HiLink medpcUnclassified	medpcStatement
"  "  HiLink medpcAsm		Assembler
"  HiLink medpcError		Error
"  HiLink medpcAsmKey		medpcStatement
"  HiLink medpcShowTab		Error
"
  delcommand HiLink
endif
"
"
let b:current_syntax = "medpc"

" vim: ts=8 sw=2
