--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    number_of_stars integer,
    brightest_star character varying(255),
    visible_from_earth boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer,
    age_in_millions_of_years numeric,
    description text,
    has_black_hole boolean,
    has_life boolean,
    distance_from_earth numeric,
    galaxy_type character varying(255)
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
    name character varying(255) NOT NULL,
    size integer,
    age_in_millions_of_years numeric,
    description text,
    is_inhabited boolean,
    planet_id integer,
    distance_from_planet numeric,
    moon_radius numeric
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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    planet_type character varying(255),
    has_life boolean,
    star_id integer,
    distance_from_star numeric,
    planet_radius numeric
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    temperature integer,
    mass numeric,
    luminosity numeric,
    age_in_millions_of_years integer,
    galaxy_id integer,
    has_planets boolean,
    radius numeric,
    is_supernova boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'A prominent constellation named after a hunter in Greek mythology', 7, 'Betelgeuse', true);
INSERT INTO public.constellation VALUES (2, 'Hydra', 'The largest of the modern constellations', 16, 'Alphard', true);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Named after a queen in Greek mythology', 5, 'Alpha Cassiopeiae', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13000, 'Our home galaxy', true, true, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 14000, 'Neighboring galaxy', false, false, 2530000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 15000, 15000, 'Another neighbor', false, false, 2800000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 250000, 13000, 'Massive elliptical galaxy', true, false, 55000000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 15000, 10000, 'Unusual-looking galaxy', false, false, 29000000, 'Lenticular');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 30000, 14000, 'Known for its spiral arms', false, true, 2300000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 4500, 'Earth''s natural satellite', false, 1, 384400, 1737);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 4000, 'Largest moon of Mars', false, 2, 9377, 11);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 4000, 'Smaller moon of Mars', false, 2, 23460, 6.2);
INSERT INTO public.moon VALUES (4, 'Io', 3636, 4600, 'Most volcanically active moon', false, 4, 421800, 1821);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, 4600, 'Potential subsurface ocean', false, 4, 671100, 1560);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, 4600, 'Largest moon in the solar system', false, 4, 1070400, 2634);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, 4600, 'Heavily cratered moon', false, 4, 1882700, 2410);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 4800, 'Has a thick atmosphere', false, 5, 1221860, 2576);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, 4800, 'Contains subsurface oceans', false, 5, 237948, 252);
INSERT INTO public.moon VALUES (10, 'Mimas', 198, 4800, 'Known for its large Herschel Crater', false, 5, 185539, 198);
INSERT INTO public.moon VALUES (11, 'Tethys', 531, 4800, 'Has a prominent feature called Odysseus', false, 5, 294619, 531);
INSERT INTO public.moon VALUES (12, 'Miranda', 236, 4700, 'One of Uranus'' five major moons', false, 6, 129390, 235.8);
INSERT INTO public.moon VALUES (13, 'Ariel', 579, 4700, 'Known for its faulted terrain', false, 6, 191020, 578.9);
INSERT INTO public.moon VALUES (14, 'Umbriel', 585, 4700, 'Has a dark, heavily cratered surface', false, 6, 266300, 584.7);
INSERT INTO public.moon VALUES (15, 'Titania', 789, 4700, 'Largest moon of Uranus', false, 6, 435910, 788.9);
INSERT INTO public.moon VALUES (16, 'Oberon', 761, 4700, 'Second-largest moon of Uranus', false, 6, 583520, 761.4);
INSERT INTO public.moon VALUES (17, 'Triton', 1353, 4700, 'Only large moon with a retrograde orbit', false, 7, 354759, 1353.4);
INSERT INTO public.moon VALUES (18, 'Nereid', 170, 4700, 'Known for its highly eccentric orbit', false, 7, 5513400, 170);
INSERT INTO public.moon VALUES (19, 'Charon', 606, 4500, 'Dwarf planet Pluto''s largest moon', false, 8, 19571, 606);
INSERT INTO public.moon VALUES (20, 'Ceres', 473, 5000, 'Dwarf planet in the asteroid belt', false, 9, 413767, 473);
INSERT INTO public.moon VALUES (21, 'Eres', 1163, 5000, 'Dwarf planet in the Kuiper belt', false, 10, 96587, 1163);
INSERT INTO public.moon VALUES (22, 'Haumea', 816, 5000, 'Dwarf planet in the Kuiper belt', false, 11, 62000, 816);
INSERT INTO public.moon VALUES (23, 'Makemake', 1500, 5000, 'Dwarf planet in the Kuiper belt', false, 12, 6850, 1500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Home to humans', 4500, 'Terrestrial', true, 1, 0.983, 6371);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet', 4000, 'Terrestrial', false, 1, 1.524, 3389);
INSERT INTO public.planet VALUES (3, 'Venus', 'Named after the Roman goddess of love', 5000, 'Terrestrial', false, 1, 0.723, 6052);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in our solar system', 4600, 'Gas Giant', false, 1, 5.203, 69911);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Famous for its rings', 4800, 'Gas Giant', false, 1, 9.582, 58232);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Rotates on its side', 4700, 'Ice Giant', false, 1, 19.22, 25362);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Named after the Roman god of the sea', 4700, 'Ice Giant', false, 1, 30.05, 24622);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Closest planet to the Sun', 4600, 'Terrestrial', false, 1, 0.39, 2439);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet at the edge of our solar system', 5000, 'Dwarf Planet', false, 1, 39.48, 1187);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri', 100, 'Exoplanet', false, 3, 0.05, 12200);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'First exoplanet wiht an atmosphere detected', 110, 'Exoplanet', false, 2, 0.0475, 151800);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 'First Earth-sized exoplanet discovered in a habitable zone', 500, 'Exoplanet', false, 1, 0.356, 11923);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 1, 3.846, 4500, 1, true, 696340, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 5790, 1.1, 1.519, 6000, 1, true, 1441880, false);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 3042, 0.12, 0.0015, 8000, 1, false, 198934, false);
INSERT INTO public.star VALUES (4, 'Sirius', 9940, 2.1, 25.4, 200, 1, true, 1568820, false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3650, 20, 98000, 8000, 1, true, 8873800, false);
INSERT INTO public.star VALUES (6, 'Vega', 9602, 2.1, 37, 455, 1, true, 2172400, false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

