Class sql.ddl Extends %RegisteredObject
{

/// Import DDL
ClassMethod import(infile As %String = "/code/ddl/supply.sql", logfile As %String = "", DDLMode As %Library.String = "Oracle") As %Status
{
    set sc = $$$OK
    do $system.SQL.Schema.ImportDDL(infile, logfile, DDLMode)
    return sc
}

}
