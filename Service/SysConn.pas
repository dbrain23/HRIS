unit SysConn;

interface

uses SysUtils, IniFiles, AppConstant;

type
  TSysConn = class
    private
      fProvider: string;
      fDbServer: string;
      fDataSource: string;
      fDbUser: string;
      fDbPassword: string;
      fDbName: string;
      fConnString: string;
    public
      property Provider: string read fProvider;
      property DbServer: string read fDbServer;
      property DataSource: string read fDataSource;
      property DbUser: string read fDbUser;
      property DbPassword: string read fDbPassword ;
      property DbName: string read fDbName;
      property ConnString: string read fConnString;
      constructor Create(const applicationPath: string = '';
        const username: string = ''; const password: string = '');
  end;

implementation

constructor TSysConn.Create(const applicationPath: string = '';
        const username: string = ''; const password: string = '');
var
  inifile: string;
  Ini: TInifile;
  dir: string;
begin
  // application path parameter is only used by the windows service
  if applicationPath = '' then
    dir := GetCurrentDir
  else
    dir := applicationPath;

  inifile := dir + '\' + TAppConstant.TConfig.IniFile;

  Ini := TIniFile.Create(inifile);

  fProvider := Ini.ReadString('CONNECTION','Provider','');
  fDbUser := Ini.ReadString('CONNECTION','User','');
  fDbPassword := Ini.ReadString('CONNECTION','Password','');
  fDbServer := Ini.ReadString('CONNECTION','Server','BRYAN-PC\SQLEXPRESS');
  fDbName := Ini.ReadString('CONNECTION','Dbase','');
  fDataSource := Ini.ReadString('CONNECTION','DataSource','');

  // overwrite the username and password with the parameters
  if username <> '' then
    fDbUser := username;

  if password <> '' then
    fDbPassword := password;

  fConnString := 'Provider=' + fProvider + ';Password=' + fDbPassword + ';' +
                'Persist Security Info=False;' +
                'User ID=' + fDbUser + ';Initial Catalog=' + fDbName +
                ';Data Source=' + fDataSource +
                ';Use Procedure for Prepare=1;' +
                'Auto Translate=True;Packet Size=4096;' +
                'Workstation ID=' + fDbServer +
                ';Use Encryption for Data=False;' +
                'Tag with column collation when possible=False;' +
                'MARS Connection=False;DataTypeCompatibility=0;' +
                'Trust Server Certificate=False';
end;


end.


