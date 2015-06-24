; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define AppName "Freenet"
#define AppVersion "0.7.5 build 1459"
#define AppPublisher "freenetproject.org"
#define AppURL "https://freenetproject.org/"
#define AppExeName "FreenetTray.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3196C62F-9C7B-4392-88B4-05C037D05518}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={localappdata}\{#AppName}
DefaultGroupName={#AppName}
OutputBaseFilename=FreenetInstaller
SetupIconFile=FreenetInstaller_InnoSetup.ico
SolidCompression=yes
PrivilegesRequired=lowest
WizardImageFile=Wizard_FreenetInstall.bmp
WizardSmallImageFile=blue_bunny_package.bmp
;Space needed 650 Mo
ExtraDiskSpaceRequired=681574400
Compression=lzma2/ultra
InternalCompressLevel=ultra
RestartIfNeededByRun=False
AllowUNCPath=False
AllowNoIcons=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl,.\translations\Messages_en.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl,.\translations\Messages_fr.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl,.\translations\Messages_es.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl,.\translations\Messages_nl.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl,.\translations\Messages_ru.isl"
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl,.\translations\Messages_hu.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl,.\translations\Messages_fi.isl"

[Files]
Source: "FreenetInstaller_InnoSetup_library\FreenetInstaller_InnoSetup_library.dll"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy
Source: "install_bundle\jxpiinstall.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "install_node\bcprov-jdk15on-151.jar"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\FreenetTray.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\freenet.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\freenet-ext.jar"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\freenetoffline.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\README.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\seednodes.fref"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\freenet.jar"; DestDir: "{app}"; Flags: ignoreversion; AfterInstall: FreenetJarDoAfterInstall
Source: "install_node\installid.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\installlayout.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_node\licenses\LICENSE.Freenet"; DestDir: "{app}\licenses"; Flags: ignoreversion
Source: "install_node\licenses\LICENSE.Mantissa"; DestDir: "{app}\licenses"; Flags: ignoreversion
Source: "install_node\plugins\JSTUN.jar"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "install_node\plugins\KeyUtils.jar"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "install_node\plugins\Library.jar"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "install_node\plugins\ThawIndexBrowser.jar"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "install_node\plugins\UPnP.jar"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "install_node\updater\sha1test.jar"; DestDir: "{app}\updater"; Flags: ignoreversion
Source: "install_node\updater\startssl.pem"; DestDir: "{app}\updater"; Flags: ignoreversion
Source: "install_node\updater\update.cmd"; DestDir: "{app}\updater"; Flags: ignoreversion
Source: "install_node\updater\wget.exe"; DestDir: "{app}\updater"; Flags: ignoreversion
Source: "install_node\wrapper\freenetwrapper.exe"; DestDir: "{app}\wrapper"; Flags: ignoreversion
Source: "install_node\wrapper\wrapper.jar"; DestDir: "{app}\wrapper"; Flags: ignoreversion
Source: "install_node\wrapper\wrapper-windows-x86-32.dll"; DestDir: "{app}\wrapper"; Flags: ignoreversion
Source: "install_node\wrapper\wrapper.conf"; DestDir: "{app}\wrapper"; Flags: ignoreversion onlyifdoesntexist; AfterInstall: WrapperConfDoAfterInstall

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "startwithwindows"; Description: "{cm:StartFreenetWithWindows}"; GroupDescription: "{cm:AdditionalOptions}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#AppExeName}"; Parameters: "-welcome"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"

[UninstallDelete]
; TODO: See http://www.jrsoftware.org/ishelp/index.php?topic=uninstalldeletesection - this should enumerate expected files instead of complete wildcard.
Type: filesandordirs; Name: "{app}\*"
Type: filesandordirs; Name: "{localappdata}\FreenetTray"

[Registry]
Root: "HKCU"; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "Freenet"; ValueData: """{app}\{#AppExeName}"""; Flags: uninsdeletevalue; Tasks: startwithwindows

[ThirdParty]
UseRelativePaths=True

[Code]
var
  JavaMissingPage: TWizardPage;
  bIsJavaInstalled: boolean;
  TextJavaMissing: TNewStaticText;

  sWrapperJavaMaxMemory, sFproxyPort, sFcpPort :string;

function IsPortAvailable(sIpAddress: ansistring; wPort: word): boolean;
external 'fIsPortAvailable@files:FreenetInstaller_InnoSetup_library.dll stdcall setuponly';

function MemoryTotalPhys(var NodeMaxMem: integer): boolean;
external 'fMemoryTotalPhys@files:FreenetInstaller_InnoSetup_library.dll stdcall setuponly';

function fCheckJavaInstall():boolean;
var
  JavaVersion : string;
begin
  bIsJavaInstalled := False;
  if RegQueryStringValue(HKLM, 'SOFTWARE\JavaSoft\Java Runtime Environment', 'CurrentVersion', JavaVersion) = true then
    if CompareStr(JavaVersion,'1.7') >= 0  then
      bIsJavaInstalled := True;

  Result := bIsJavaInstalled;
end;

procedure ButtonInstallJavaOnClick(Sender: TObject);
var
  ErrorCode : Integer;
  sErrorCode: string;
  ButtonInstallJava: TNewButton;
begin
  ButtonInstallJava := TNewButton (Sender);
  ButtonInstallJava.Enabled := False;
  ExtractTemporaryFiles('{tmp}\jxpiinstall.exe');
  if not ShellExec('runas',ExpandConstant('{tmp}\jxpiinstall.exe'),'SPONSORS=0','',SW_SHOW,ewWaitUntilTerminated,ErrorCode) then begin
    sErrorCode := inttostr(ErrorCode);
    MsgBox(FmtMessage(CustomMessage('ErrorLaunchDependencyInstaller'), ['Java', sErrorCode,SysErrorMessage(ErrorCode)]), mbError, MB_OK)
    ButtonInstallJava.Enabled := True;
  end else begin
    ButtonInstallJava.Enabled := True;
    if fCheckJavaInstall() then begin
      ButtonInstallJava.Visible := False;
      TextJavaMissing.Caption := FmtMessage(CustomMessage('DependencyInstalled'), ['Java']);
      WizardForm.NextButton.Enabled :=  True;
    end;
  end;
end;

procedure FreenetJarDoAfterInstall();
var
  sConfigLines : array[0..5] of string;
begin
  if not FileExists(ExpandConstant('{app}\freenet.ini')) then begin
    sConfigLines[0] := 'fproxy.port=' + sFproxyPort;
    sConfigLines[1] := 'fcp.port=' + sFcpPort;
    sConfigLines[2] := 'pluginmanager.loadplugin=JSTUN;KeyUtils;ThawIndexBrowser;UPnP;Library';
    sConfigLines[3] := 'node.updater.autoupdate=true';
    sConfigLines[4] := 'node.downloadsDir=.\downloads';
    sConfigLines[5] := 'End';
    SaveStringsToUTF8File(ExpandConstant('{app}\freenet.ini'), sConfigLines, False);
  end;
end;

procedure WrapperConfDoAfterInstall();
begin
  SaveStringToFile(ExpandConstant('{app}\wrapper\wrapper.conf'), '# Memory limit for the node' + #13#10 , True);
  SaveStringToFile(ExpandConstant('{app}\wrapper\wrapper.conf'), 'wrapper.java.maxmemory=' + sWrapperJavaMaxMemory + #13#10 , True);
end;

procedure InitializeWizard;
var
  iMemTotalPhys, iWrapperJavaMaxMemory, iFproxyPort, iFcpPort : integer;
  ButtonInstallJava: TNewButton;
begin
  bIsJavaInstalled := False;
  JavaMissingPage := CreateCustomPage(wpWelcome, CustomMessage('DependencyMissingPageCaption'), FmtMessage(CustomMessage('DependencyMissingPageDescription'), ['Java']));

  TextJavaMissing := TNewStaticText.Create(JavaMissingPage);
  TextJavaMissing.Top := 10;
  TextJavaMissing.AutoSize := True;
  TextJavaMissing.WordWrap := True;
  TextJavaMissing.Parent := JavaMissingPage.Surface;
  TextJavaMissing.Caption :=  CustomMessage('JavaMissingText');
  TextJavaMissing.Width := ScaleX(400);

  ButtonInstallJava := TNewButton.Create(JavaMissingPage);
  ButtonInstallJava.Width := ScaleX(280);
  ButtonInstallJava.Height := ScaleY(30);
  ButtonInstallJava.Top := 100;
  ButtonInstallJava.Left := 60;
  ButtonInstallJava.Caption := FmtMessage(CustomMessage('ButtonInstallDependency'), ['Java']);
  ButtonInstallJava.OnClick := @ButtonInstallJavaOnClick;
  ButtonInstallJava.Parent := JavaMissingPage.Surface;


  iFproxyPort := 8888;
  repeat
    if IsPortAvailable('127.0.0.1', iFproxyPort) then
      Break
    else begin
      iFproxyPort := iFproxyPort + 1;
      Continue;
    end;
  until iFproxyPort = 8888 + 256;
  sFproxyPort := IntToStr(iFproxyPort);

  iFcpPort := 9481;
  repeat
    if IsPortAvailable('127.0.0.1', iFcpPort) then
      Break
    else begin
      iFcpPort := iFcpPort + 1;
      Continue;
    end;
  until iFcpPort = 9481 + 256;
  sFcpPort := IntToStr(iFcpPort);

  MemoryTotalPhys(iMemTotalPhys);
  if iMemTotalPhys >= 2048 then
    iWrapperJavaMaxMemory := 512
  else if iMemTotalPhys >= 1024 then
    iWrapperJavaMaxMemory := 256
  else if iMemTotalPhys >= 512 then
    iWrapperJavaMaxMemory := 192
  else
    iWrapperJavaMaxMemory := 128;

  sWrapperJavaMaxMemory := InttoStr(iWrapperJavaMaxMemory);
 
  fCheckJavaInstall();
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if (CurPageID = JavaMissingPage.ID) then begin
    WizardForm.NextButton.Enabled := False;
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if (PageID = JavaMissingPage.ID) And (bIsJavaInstalled = True) then Result := True;
end;
