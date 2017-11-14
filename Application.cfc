component {
  this.name = 'test';
  this.sessionManagement  = false;
  this.datasources[ "one-to-one" ] = {
         class: 'org.h2.Driver',
         connectionString: 'jdbc:h2:./db/one-to-one;MODE=MySQL'
  };

  this.datasource = this.datasources[ "one-to-one" ];
  this.ormEnabled = true;
  this.ormSettings = {
    cfclocation = Expandpath('models'),
    logsql = true,
    flushatrequestend = false,
    automanagesession = false,
    useDBforMapping = false
  }

  public boolean function onApplicationStart() {
    queryExecute("
              CREATE TABLE IF NOT EXISTS books (
                id integer IDENTITY(1,1),
                title varchar(50),
                PRIMARY key(id)
              );
          ");

    queryExecute("
              CREATE TABLE IF NOT EXISTS book_detail (
                id integer IDENTITY(1,1),
                id_book integer,
                description varchar(200),
                PRIMARY key(id)
                );
    ");

    queryExecute("DELETE FROM books;");
    queryExecute("DELETE FROM book_detail;");
    queryExecute("INSERT INTO books(title) VALUES('Quixote')");
    r = queryExecute("Select * from books limit 1");
    queryExecute("INSERT INTO book_detail(id_book, description) values(#r.id#, 'My description')");
    return true;
  }

}
