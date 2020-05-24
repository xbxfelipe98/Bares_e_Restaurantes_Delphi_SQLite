object dm: Tdm
  OldCreateOrder = False
  Height = 487
  Width = 400
  object con: TSQLConnection
    ConnectionName = 'Limner'
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Sqlite'
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver260.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver260.bpl'
      'FailIfMissing=True'
      
        'Database=C:\Programa'#231#227'o\Limner Bares e  Restaurantes\Bares_e_Res' +
        'taurantes_Delphi_SQLite\Banco\Limner.db'
      'HostName=localhost'
      'User_Name=sa'
      'Password=server@01')
    BeforeConnect = conBeforeConnect
    Connected = True
    Left = 16
    Top = 8
  end
  object QueryLogin: TSQLQuery
    Active = True
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'senha'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT * FROM USUARIOS WHERE USUARIO = :usuario AND SENHA = :sen' +
        'ha')
    SQLConnection = con
    Left = 16
    Top = 72
  end
  object QueryListLogin: TSQLQuery
    Active = True
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    SQLConnection = con
    Left = 80
    Top = 72
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'select ID, NOME, SENHA, USUARIO from USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con
    Left = 280
    Top = 208
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 104
    Top = 208
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = QueryListLogin
    Left = 184
    Top = 208
  end
  object QueryInsertUsuario: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO USUARIOS  (NOME,SENHA,USUARIO)'
      'VALUES( :NOME,:SENHA,:USUARIO);')
    SQLConnection = con
    Left = 16
    Top = 136
  end
  object QueryDeletaUsuario: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftWideMemo
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM USUARIOS'
      'WHERE ID = :ID')
    SQLConnection = con
    Left = 104
    Top = 136
  end
  object QueryUpdateUsuario: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftWideMemo
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftWideMemo
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        DataType = ftWideMemo
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftWideMemo
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE USUARIOS'
      'SET'
      'NOME = :NOME,'
      'SENHA = :SENHA,'
      'USUARIO = :USUARIO'
      ''
      'WHERE'
      'ID = :ID')
    SQLConnection = con
    Left = 192
    Top = 136
  end
  object QueryBuscaUsuario: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftWideMemo
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'Select'
      'Nome,'
      'Senha,'
      'Usuario'
      'from usuarios'
      'where id = :id')
    SQLConnection = con
    Left = 272
    Top = 136
  end
  object QueryListMesas: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM MESAS')
    SQLConnection = con
    Left = 24
    Top = 256
  end
  object cdListMesas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListMesas'
    Left = 16
    Top = 320
  end
  object dspListMesas: TDataSetProvider
    DataSet = QueryListMesas
    Left = 80
    Top = 324
  end
  object dsListMesas: TSQLDataSet
    CommandText = 'select ID, NOME, LIVRE from MESAS'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = con
    Left = 144
    Top = 328
  end
  object cdListMesas2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsListMesas2'
    Left = 24
    Top = 416
  end
  object dsListMesas2: TSQLDataSet
    CommandText = 'select ID, NOME, LIVRE from MESAS'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = con
    Left = 96
    Top = 408
  end
  object dpsListMesas2: TDataSetProvider
    DataSet = QueryListMesas
    Left = 160
    Top = 412
  end
end
