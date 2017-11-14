component accessors="true" persistent="true" table="books" {
  property name="id" fieldtype="id" generator="native" setter="false";
  property name="title";

  property name="book_detail" fieldtype="one-to-one" cfc="book_detail" mappedby="book" lazy="true";
}
