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
    name character varying(20) NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    description text,
    age_in_millions integer NOT NULL,
    diameter_in_kpc numeric,
    has_life boolean
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
    name character varying(20) NOT NULL,
    age_in_millions integer NOT NULL,
    description text,
    radius numeric,
    has_life boolean,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    age_in_millions integer NOT NULL,
    description text,
    radius_km numeric,
    has_life boolean,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions integer NOT NULL,
    radius numeric,
    has_life boolean,
    galaxy_id integer NOT NULL,
    star_cluster_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_cluster (
    star_cluster_id integer NOT NULL,
    name character varying(20) NOT NULL,
    dist_earth_ly integer
);


ALTER TABLE public.star_cluster OWNER TO freecodecamp;

--
-- Name: star_cluster_star_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_cluster_star_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_cluster_star_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: star_cluster_star_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_cluster_star_cluster_id_seq OWNED BY public.star_cluster.star_cluster_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_cluster star_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_cluster ALTER COLUMN star_cluster_id SET DEFAULT nextval('public.star_cluster_star_cluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Early Type Spiral', NULL, 10000, 46.56, NULL);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'Early Type Spiral', NULL, 13280, 16.51, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Early Type Spiral', NULL, 13310, 27.59, NULL);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'Spiral', NULL, 200, 44.23, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'I0', NULL, 13300, 11.34, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Looser Spiral', 'Our galaxy. Composed of 8 planets.', 13600, 26.8, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Europa', 4503, NULL, 1560.8, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 4503, NULL, 2634.1, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 4503, NULL, 2410.3, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (5, 'Titan', 4003, NULL, 2574.7, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (1, 'Moon', 4530, NULL, 1737.4, NULL, 2, 1, 1);
INSERT INTO public.moon VALUES (6, 'Io', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (7, 'Adrastea', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (8, 'Aitne', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (9, 'Amalthea', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (10, 'Ananke', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (11, 'Aoede', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (12, 'Arche', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (13, 'Autonoe', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (14, 'Callirrhoe', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (15, 'Carme', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (16, 'Carpo', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (17, 'Chaldene', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (18, 'Cyllene', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (19, 'Eirene', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (20, 'Elara', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (21, 'Erionme', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (22, 'Ersa', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (23, 'Euanthe', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (24, 'Eukelade', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (25, 'Eupheme', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (26, 'Euporie', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (27, 'Eurydome', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (28, 'Harpalyke', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (29, 'Hegemone', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (30, 'Helike', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (31, 'Hermippe', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (32, 'Herse', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (33, 'Himalia', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (34, 'Iocaste', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (35, 'Isonoe', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (36, 'Jupiter Li', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (37, 'Kale', 4500, NULL, NULL, NULL, 2, 1, 5);
INSERT INTO public.moon VALUES (38, 'Kallichore', 4500, NULL, NULL, NULL, 2, 1, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4543, NULL, 6371, true, 1, 2);
INSERT INTO public.planet VALUES (3, 'Mercury', 4503, NULL, 2439.7, NULL, 1, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 4503, NULL, 6051.8, NULL, 1, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 4603, NULL, 3389.5, NULL, 1, 2);
INSERT INTO public.planet VALUES (13, 'Kepler-11e', 3200, NULL, 28797, NULL, 5, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-11d', 3200, NULL, 21877, NULL, 5, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-11b', 3200, NULL, 11672, NULL, 5, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-11c', 3200, NULL, 20091, NULL, 5, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 4603, NULL, 1188, NULL, 1, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 4603, NULL, 24622, NULL, 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 4603, NULL, 25362, NULL, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 4603, NULL, 58232, NULL, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4603, NULL, 69911, NULL, 1, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 4600, NULL, NULL, 2, 1);
INSERT INTO public.star VALUES (2, 'Alcyone', NULL, 100, NULL, NULL, 2, 4);
INSERT INTO public.star VALUES (3, 'Atlas', NULL, 115, NULL, NULL, 2, 4);
INSERT INTO public.star VALUES (4, 'Merope', NULL, 150, NULL, NULL, 2, 4);
INSERT INTO public.star VALUES (5, 'Kepler-11', NULL, 3200, NULL, NULL, 2, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', NULL, 4853, NULL, NULL, 2, 1);


--
-- Data for Name: star_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_cluster VALUES (1, 'Pismis 24', 8000);
INSERT INTO public.star_cluster VALUES (5, 'Coma Star Cluster', 280);
INSERT INTO public.star_cluster VALUES (4, 'Pleiades', 444);
INSERT INTO public.star_cluster VALUES (3, 'Alpha Persei', 510);
INSERT INTO public.star_cluster VALUES (2, 'Hyades', 153);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 38, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_cluster_star_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_cluster_star_cluster_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star_cluster star_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_cluster
    ADD CONSTRAINT star_cluster_pkey PRIMARY KEY (star_cluster_id);


--
-- Name: star_cluster star_cluster_star_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_cluster
    ADD CONSTRAINT star_cluster_star_cluster_id_key UNIQUE (star_cluster_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_star_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_cluster_id_fkey FOREIGN KEY (star_cluster_id) REFERENCES public.star_cluster(star_cluster_id);


--
-- PostgreSQL database dump complete
--

