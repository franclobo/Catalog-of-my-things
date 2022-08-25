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

CREATE TABLE public."Game"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    multiplayer text NOT NULL,
    last_played_at date NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Game"
    OWNER to postgres;

COMMENT ON TABLE public."Game"
    IS 'Create table Game';

CREATE TABLE public."Author"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    first_name text NOT NULL,
    last_name text NOT NULL,
    items integer NOT NULL,
    PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Author"
    OWNER to postgres;

COMMENT ON TABLE public."Author"
    IS 'Create table Author';

CREATE TABLE public."Book"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    publisher text NOT NULL,
    cover_state boolean NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Book"
    OWNER to postgres;

COMMENT ON TABLE public."Book"
    IS 'Create table Book';

CREATE TABLE public."Label"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    title text NOT NULL,
    color text NOT NULL,
    items integer NOT NULL,
    PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Label"
    OWNER to postgres;

COMMENT ON TABLE public."Label"
    IS 'Create table Label';
