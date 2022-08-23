--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_in_light_years integer,
    size_in_light_years integer,
    age_in_million_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_in_km integer,
    has_life boolean DEFAULT false,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_in_km integer,
    has_ring boolean,
    number_of_moons integer,
    galaxy_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(100) DEFAULT 'milky way'::character varying,
    planet_moon_id integer NOT NULL
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_in_light_years numeric(1000,4),
    type character(100),
    smaller_than_sun boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_start_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_start_id_seq OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_start_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_start_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 0, 52850, 13610);
INSERT INTO public.galaxy VALUES (2, 'large magellanic cloud', 158200, 7000, 1101);
INSERT INTO public.galaxy VALUES (3, 'andromeda galaxy', 2, 110000, 10010);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 2, 60000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 13, 48500, 13270);
INSERT INTO public.galaxy VALUES (6, 'Bodes galaxy', 12, 45000, 13310);
INSERT INTO public.galaxy VALUES (7, 'Sculptor Galaxy', 11, 45000, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, false, 'Moon is the natural satellite of earth , and is the largest in the solar system');
INSERT INTO public.moon VALUES (2, 'Phobos', 11, false, 'Phobos means fear in greek and it is natural satellite of mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 6, false, 'Deimos means dread in greek and it is a natural satellite of mars');
INSERT INTO public.moon VALUES (4, 'Europa', 1560, false, 'It is the second moon of jupiter and the smallest among all four gallilean moons.');
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, false, 'It is the largest moon in solar system');
INSERT INTO public.moon VALUES (6, 'Callisto', 2410, false, 'It is the second largest moon of jupiter');
INSERT INTO public.moon VALUES (7, 'Amalthea', 84, false, 'It is the fifth largest moon of jupiter');
INSERT INTO public.moon VALUES (8, 'Himalia', 70, false, 'It is the sixth largest jovian satellite');
INSERT INTO public.moon VALUES (9, 'Elara', 43, false, 'It is a prograde irregular satellite of jupiter');
INSERT INTO public.moon VALUES (10, 'Pasiphae', 30, false, 'It is a retrograde irregular satellite');
INSERT INTO public.moon VALUES (11, 'Sinope', 19, false, 'It is a retrograde irregular satellite discovered by Nicholson');
INSERT INTO public.moon VALUES (12, 'Lysithea', 18, false, 'It is prograde irregular satellite discovered by nicholson');
INSERT INTO public.moon VALUES (13, 'Carme', 23, false, 'It is a retrograde satellite discovered by barnes');
INSERT INTO public.moon VALUES (14, 'Ananke', 14, false, 'It is a retrograde irregular moon discovered by nicholson');
INSERT INTO public.moon VALUES (15, 'Leda', 10, false, 'It is a prograde irregular satellite discovered by Kowal');
INSERT INTO public.moon VALUES (16, 'Thebe', 50, false, 'It is the fourth moon by distance from planet');
INSERT INTO public.moon VALUES (17, 'Adrastea', 8, false, 'It is the smallest inner moon');
INSERT INTO public.moon VALUES (18, 'Metis', 22, false, 'It is the innermost moon of jupiter');
INSERT INTO public.moon VALUES (19, 'Callirhoe', 5, false, 'It is a retrograde irregular moon');
INSERT INTO public.moon VALUES (20, 'Themisto', 4, false, 'It is a prograde satellite of jupiter');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3895, false, 2, 1);
INSERT INTO public.planet VALUES (9, 'pluto', 1188, false, 5, 1);
INSERT INTO public.planet VALUES (10, 'Kepler 186f', 7454, false, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', 476, false, 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, true, 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58322, true, 82, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, true, 14, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 2287, true, 2, 1);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (3, 1, NULL, 1);
INSERT INTO public.planet_moon VALUES (4, 2, NULL, 2);
INSERT INTO public.planet_moon VALUES (4, 3, NULL, 3);
INSERT INTO public.planet_moon VALUES (5, 4, NULL, 4);
INSERT INTO public.planet_moon VALUES (5, 5, NULL, 5);
INSERT INTO public.planet_moon VALUES (5, 6, NULL, 6);
INSERT INTO public.planet_moon VALUES (5, 7, NULL, 7);
INSERT INTO public.planet_moon VALUES (5, 8, NULL, 8);
INSERT INTO public.planet_moon VALUES (5, 9, NULL, 9);
INSERT INTO public.planet_moon VALUES (5, 10, NULL, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4.2400, 'M-Type                                                                                              ', true);
INSERT INTO public.star VALUES (2, 'Rigil Kentaurus', 4.3600, 'Spectral type g2v                                                                                   ', false);
INSERT INTO public.star VALUES (3, 'Toliman', 4.3600, 'Spectral type k1-v                                                                                  ', true);
INSERT INTO public.star VALUES (4, 'Barnards Star', 6.0000, 'red dwarf                                                                                           ', true);
INSERT INTO public.star VALUES (5, 'WISE 0855-0714', 7.2500, 'brown dwarf                                                                                         ', true);
INSERT INTO public.star VALUES (6, 'Wolf 359', 7.9000, 'Spectral type M6.5 Ve                                                                               ', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_start_id_seq', 38, true);


--
-- Name: galaxy galaxy_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unq UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unq UNIQUE (name);


--
-- Name: planet_moon planet_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_id PRIMARY KEY (planet_moon_id);


--
-- Name: planet_moon planet_moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_unq UNIQUE (planet_id, moon_id);


--
-- Name: planet planet_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unq UNIQUE (name);


--
-- Name: planet galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


