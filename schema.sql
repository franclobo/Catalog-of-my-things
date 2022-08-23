CREATE TABLE public."Items"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    genre text NOT NULL,
    author text NOT NULL,
    source text NOT NULL,
    label text NOT NULL,
    publish_date date NOT NULL,
    archived boolean NOT NULL,
    PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Items"
    OWNER to postgres;

COMMENT ON TABLE public."Items"
    IS 'Create table Items';


CREATE TABLE public."Genre"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL,
    items integer NOT NULL,
    PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Genre"
    OWNER to postgres;

COMMENT ON TABLE public."Genre"
    IS 'Create table Genre';

CREATE TABLE public."MusicAlbum"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    on_spotify boolean NOT NULL,
    PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."MusicAlbum"
    OWNER to postgres;

COMMENT ON TABLE public."MusicAlbum"
    IS 'Create table MusicAlbum';
