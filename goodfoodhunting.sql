CREATE DATABASE goodfoodhunting;
/c goodfoodhunting

CREATE TABLE dishes (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(50),
  image_url VARCHAR(300)
);

SELECT * FROM dishes;

INSERT INTO dishes (name, image_url)
  VALUES ('lamb rack', 'https://s.yimg.com/ea/img/-/121101/cutlets_1893t3g-1893t4a.jpg');


INSERT INTO dishes (name, image_url)
VALUES ('Tuna Sandwich', 'https://www.greenbiz.com/sites/default/files/styles/gbz_article_primary_breakpoints_kalapicture_screen-md_1x/public/images/articles/featured/050714tuna.jpg?itok=eOO-P_xV');

INSERT INTO dishes (name, image_url)
VALUES ('Spam', 'http://www.tastyislandhawaii.com/images/spam_musubi/spam_can_open.jpg');

--
-- to select all from TABLE for display
--
--   select * from dishes      {the table name is dishes and this shows all the table}
