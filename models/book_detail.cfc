component accessors="true" persistent="true" table="book_detail" {
  property name="id" fieldtype="id" generator="native" setter="false";
  property name="description";

  property name="book" fieldtype="one-to-one" cfc="book" fkcolumn="id_book";
}
