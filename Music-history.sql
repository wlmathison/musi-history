INSERT INTO Genre (Label) VALUES ('Techno');

SELECT * FROM Genre;

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('the xx', 2005);

SELECT * FROM Artist;

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId) VALUES ('xx', '08/14/2009', 2314, 'Young Turks', 28 );

SELECT * FROM Album;
SELECT * FROM Song;

DELETE FROM Song WHERE Title = 'Intro';

INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, AlbumId) VALUES('Intro', 127, '08/14/2009', 28, 25);
INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, AlbumId) VALUES('VCR', 179, '01/24/2010', 28, 25);
INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, AlbumId) VALUES('Crystalised', 201, '04/27/2009', 28, 25);

SELECT s.Title AS 'Song Title', a.Title AS 'Album Title'
FROM Album a 
LEFT JOIN Song s ON s.AlbumId = a.Id 
WHERE a.Title = 'xx';

SELECT COUNT(s.Id) AS '# Songs', a.Title AS 'Album'
FROM Song s
LEFT JOIN Album a ON a.id = s.AlbumId
GROUP BY a.Title;

SELECT COUNT(s.Id) AS '# Songs', ar.ArtistName AS 'Artist'
FROM Song s
LEFT JOIN Artist ar ON ar.Id = s.ArtistId
GROUP BY ar.ArtistName

SELECT COUNT(s.Id) AS '# Songs', g.Label AS 'Genre'
FROM Song s
LEFT JOIN Genre g ON g.Id = s.GenreId
GROUP BY g.Label

SELECT a.Title AS 'ALbum Title', a.AlbumLength AS 'Album Length'
FROM album a 
WHERE a.AlbumLength = (
  SELECT MAX(a.AlbumLength)
  FROM album a
);

SELECT s.Title AS 'Song Title', s.SongLength AS 'Song Length', a.Title AS 'Album'
FROM song s
LEFT JOIN album a ON a.Id = s.AlbumId
WHERE s.SongLength = (
  SELECT MAX(s.SongLength)
  FROM song s
);


MAX(a.AlbumLength) AS 'Album Length', a.Title
FROM Album a;