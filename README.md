## CFML one-to-one demo
CFML demo with a orm one-to-one relation with lazy="true"

With this option, Lucee (Hibernate) should not join the table, but a simple EntityLoad do this sql:

```
Hibernate:
    select
        this_.id as id8_1_,
        this_.title as title8_1_,
        book_detai2_.id as id9_0_,
        book_detai2_.description as descript2_9_0_,
        book_detai2_.id_book as id3_9_0_
    from
        books this_
    left outer join
        book_detail book_detai2_
            on this_.id=book_detai2_.id_book
```
