; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Sagittarius"
#define MyAppVersion "0.2.4"
#define MyAppPublisher "Takashi Kato"
#define MyAppURL "http://code.google.com/p/sagittarius-scheme/"
#define MyAppExeName "sash.exe"
#define BoehmGCVersion "7.2alpha6"


[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8413617A-84F7-45B0-8CA1-5B9C46DA2217}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=..\Copyright
OutputBaseFilename=setup_sagittarius_{#MyAppVersion}
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "..\build\sash.exe"; DestDir: "{app}"; DestName: "{#MyAppExeName}"; Flags: ignoreversion
Source: "..\build\sagittarius.dll"; DestDir: "{app}"; DestName: "sagittarius.dll"; Flags: ignoreversion
Source: "..\build\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\src\*.h"; DestDir: "{app}\include"; Excludes: "os*"; Flags: ignoreversion recursesubdirs createallsubdirs
; Well Boehm GC header also need to be installed.
Source: "..\gc-{#BoehmGCVersion}\include\*.h"; DestDir: "{app}\include"; Excludes: "private,extra,cord.h,ec.h,javaxfc.h"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\build\gc\gcmt-dll.lib"; DestDir: "{app}"; Flags: ignoreversion

Source: "..\lib\*"; DestDir: "{app}\lib"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\sitelib\*"; DestDir: "{app}\sitelib"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\build\modules\*.dll"; DestDir: "{app}\modules"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\doc\sagittarius-ref.html"; DestDir: "{app}\doc"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\doc\lib\*"; DestDir: "{app}\doc\lib"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
; TODO: I don't want to write install script every time when I added ext/* module
Source: "..\ext\socket\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\threads\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\time\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\regex\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\process\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\ffi\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm,libffi*"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\crypto\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm,libtom*"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\odbc\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\ext\zlib\*.scm"; DestDir: "{app}\lib"; Excludes: "test.scm,zlib-*"; Flags: ignoreversion recursesubdirs createallsubdirs
[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\reference.html"; Filename: "{app}\doc\sagittarius-ref.html"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Registry]
Root: HKCR; Subkey: ".scm"; ValueType: string; ValueName: ""; ValueData: "{#MyAppName}"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "{#MyAppName}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppName} {#MyAppVersion}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "{#MyAppName}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKCR; Subkey: "{#MyAppName}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""    

;[Run]
;Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall skipifsilent

