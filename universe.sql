--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    galaxy_type character varying(50)
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean,
    diameter_km integer,
    distance_from_planet numeric,
    orbital_period_days numeric
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    diameter_km integer,
    distance_from_star numeric,
    orbital_period_days numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    average_temperature integer
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    has_planets boolean NOT NULL,
    age_in_millions_of_years numeric,
    temperature integer,
    mass numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', true, true, 13600, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way', false, true, 10000, 2.537, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy in the Local Group', false, true, 12000, 2.73, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unusual galaxy with a bright nucleus', false, true, 13000, 29.3, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Classic spiral galaxy with prominent arms', false, true, 4000, 23.5, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral galaxy with a dark band of dust', false, true, 13000, 24.4, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earths only natural satellite', true, 3474, 384400, 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Larger moon of Mars', false, 22, 9377, 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Smaller moon of Mars', false, 12, 23460, 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Most volcanically active body in solar system', true, 3643, 421800, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Has subsurface ocean', true, 3122, 671100, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in solar system', true, 5268, 1070400, 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered moon', true, 4821, 1882700, 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Has thick atmosphere', true, 5150, 1221870, 15.95);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Has water plumes', true, 504, 238020, 1.37);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 'Mid-sized moon of Saturn', true, 1060, 294619, 1.89);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Mid-sized moon of Saturn', true, 1123, 377396, 2.74);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'Second largest moon of Saturn', true, 1528, 527108, 4.52);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 'Smallest of the major Uranian moons', true, 472, 129390, 1.41);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'Brightest moon of Uranus', true, 1158, 191020, 2.52);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 'Largest moon of Uranus', true, 1578, 435910, 8.71);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 'Outermost major moon of Uranus', true, 1523, 583520, 13.46);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 'Largest moon of Neptune', true, 2707, 354759, 5.88);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 'Irregular moon of Neptune', false, 340, 5514000, 360.13);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 'Irregular shaped moon of Neptune', false, 420, 117647, 1.12);
INSERT INTO public.moon VALUES (20, 'Larissa', 8, 'Irregular moon of Neptune', false, 200, 73548, 0.55);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Smallest planet in our solar system', false, true, 4879, 57900000, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hottest planet in our solar system', false, true, 12104, 108200000, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Only known planet with life', true, true, 12756, 149600000, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The Red Planet', false, true, 6792, 227900000, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet in our solar system', false, true, 142984, 778600000, 4333);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Planet with prominent ring system', false, true, 120536, 1433500000, 10759);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant with tilted axis', false, true, 51118, 2871000000, 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Windiest planet in our solar system', false, true, 49528, 4498000000, 60190);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet orbiting Proxima Centauri', false, true, 14000, 7000000, 11.2);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 3, 'Exoplanet orbiting Alpha Centauri B', false, true, 12000, 6000000, 3.2);
INSERT INTO public.planet VALUES (11, 'Barnards Star b', 5, 'Exoplanet candidate orbiting Barnards Star', false, true, 8000, 3000000, 233);
INSERT INTO public.planet VALUES (12, 'Wolf 359 b', 6, 'Exoplanet candidate orbiting Wolf 359', false, true, 9000, 4500000, 45);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces', 0);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets with thick atmospheres', -150);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Cold planets with ice and gas', -200);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our solar systems star', true, 4600, 5778, 1.0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Closest star to Earth', true, 4850, 3042, 0.122);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'Brightest star in the Alpha Centauri system', true, 6000, 5790, 1.1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 'Second star in the Alpha Centauri system', true, 6000, 5260, 0.9);
INSERT INTO public.star VALUES (5, 'Barnards Star', 1, 'Red dwarf star with high proper motion', false, 10000, 3138, 0.14);
INSERT INTO public.star VALUES (6, 'Wolf 359', 1, 'Red dwarf star near the Sun', false, 5000, 2800, 0.09);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

