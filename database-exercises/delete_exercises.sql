USE codeup_test_db;

# DESCRIBE albums;
DELETE FROM albums
WHERE release_date > 1991;

DELETE FROM albums
WHERE genre = 'Disco';

DELETE FROM albums
WHERE artist = 'Michael Jackson';

SELECT * FROM albums;