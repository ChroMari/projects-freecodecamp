--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: mari
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';


ALTER DATABASE universe OWNER TO mari;

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
-- Name: collapsar; Type: TABLE; Schema: public; Owner: mari
--

CREATE TABLE public.collapsar (
    collapsar_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    disk_type character varying(30)
);


ALTER TABLE public.collapsar OWNER TO mari;

--
-- Name: collapsar_collapsar_id_seq; Type: SEQUENCE; Schema: public; Owner: mari
--

CREATE SEQUENCE public.collapsar_collapsar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collapsar_collapsar_id_seq OWNER TO mari;

--
-- Name: collapsar_collapsar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mari
--

ALTER SEQUENCE public.collapsar_collapsar_id_seq OWNED BY public.collapsar.collapsar_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: mari
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_types character varying(30),
    disk_type character varying(30)
);


ALTER TABLE public.galaxy OWNER TO mari;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: mari
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO mari;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mari
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: mari
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    color character varying(30),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO mari;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: mari
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO mari;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mari
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: mari
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    has_life boolean,
    planet_types character varying(30),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO mari;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: mari
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO mari;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mari
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: mari
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km integer,
    is_spherical boolean,
    weight_in_kg integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO mari;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: mari
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO mari;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mari
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: collapsar collapsar_id; Type: DEFAULT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.collapsar ALTER COLUMN collapsar_id SET DEFAULT nextval('public.collapsar_collapsar_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: collapsar; Type: TABLE DATA; Schema: public; Owner: mari
--

INSERT INTO public.collapsar VALUES (1, 'col1', 123, 'weight');
INSERT INTO public.collapsar VALUES (2, 'col2', 234, 'height');
INSERT INTO public.collapsar VALUES (3, 'col3', 345, 'weight');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: mari
--

INSERT INTO public.galaxy VALUES (1, 'gal1', 'text text text', 'typeOn', 'weight');
INSERT INTO public.galaxy VALUES (2, 'gal2', 'text text text', 'typeOn', 'weight');
INSERT INTO public.galaxy VALUES (3, 'gal3', 'text text text', 'typeOff', 'height');
INSERT INTO public.galaxy VALUES (4, 'gal4', 'text text text', 'typeOff', 'height');
INSERT INTO public.galaxy VALUES (5, 'gal5', 'text text text', 'typeOn', 'height');
INSERT INTO public.galaxy VALUES (6, 'gal6', 'text text text', 'typeOn', 'height');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: mari
--

INSERT INTO public.moon VALUES (1, 'mo1', 123, 'black', 4);
INSERT INTO public.moon VALUES (2, 'mo2', 123, 'black', 6);
INSERT INTO public.moon VALUES (3, 'mo3', 123, 'black', 2);
INSERT INTO public.moon VALUES (4, 'mo4', 123, 'black', 6);
INSERT INTO public.moon VALUES (5, 'mo5', 123, 'black', 1);
INSERT INTO public.moon VALUES (6, 'mo6', 123, 'black', 12);
INSERT INTO public.moon VALUES (7, 'mo7', 123, 'black', 8);
INSERT INTO public.moon VALUES (8, 'mo8', 123, 'black', 9);
INSERT INTO public.moon VALUES (9, 'mo9', 123, 'black', 4);
INSERT INTO public.moon VALUES (10, 'mo10', 123, 'black', 2);
INSERT INTO public.moon VALUES (11, 'mo11', 123, 'black', 7);
INSERT INTO public.moon VALUES (12, 'mo12', 123, 'black', 5);
INSERT INTO public.moon VALUES (13, 'mo13', 123, 'black', 3);
INSERT INTO public.moon VALUES (14, 'mo14', 123, 'black', 6);
INSERT INTO public.moon VALUES (15, 'mo15', 123, 'black', 9);
INSERT INTO public.moon VALUES (16, 'mo16', 123, 'black', 10);
INSERT INTO public.moon VALUES (17, 'mo17', 123, 'black', 2);
INSERT INTO public.moon VALUES (18, 'mo18', 123, 'black', 7);
INSERT INTO public.moon VALUES (19, 'mo19', 123, 'black', 10);
INSERT INTO public.moon VALUES (20, 'mo20', 123, 'black', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: mari
--

INSERT INTO public.planet VALUES (1, 'plan1', 123, false, 'old', 2);
INSERT INTO public.planet VALUES (2, 'plan2', 123, false, 'old', 1);
INSERT INTO public.planet VALUES (3, 'plan3', 123, false, 'old', 4);
INSERT INTO public.planet VALUES (4, 'plan4', 123, false, 'old', 2);
INSERT INTO public.planet VALUES (5, 'plan5', 123, false, 'old', 4);
INSERT INTO public.planet VALUES (6, 'plan6', 123, false, 'old', 5);
INSERT INTO public.planet VALUES (7, 'plan7', 123, false, 'old', 4);
INSERT INTO public.planet VALUES (8, 'plan8', 123, false, 'old', 6);
INSERT INTO public.planet VALUES (9, 'plan9', 123, false, 'old', 1);
INSERT INTO public.planet VALUES (10, 'plan10', 123, false, 'old', 4);
INSERT INTO public.planet VALUES (11, 'plan11', 123, false, 'old', 5);
INSERT INTO public.planet VALUES (12, 'plan12', 123, false, 'old', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: mari
--

INSERT INTO public.star VALUES (1, 'pla1', 123, true, 234, 4);
INSERT INTO public.star VALUES (2, 'pla2', 123, true, 234, 1);
INSERT INTO public.star VALUES (3, 'pla3', 123, true, 234, 3);
INSERT INTO public.star VALUES (4, 'pla4', 123, true, 234, 5);
INSERT INTO public.star VALUES (5, 'pla5', 123, true, 234, 6);
INSERT INTO public.star VALUES (6, 'pla6', 123, true, 234, 2);


--
-- Name: collapsar_collapsar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mari
--

SELECT pg_catalog.setval('public.collapsar_collapsar_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mari
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mari
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mari
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mari
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: collapsar collapsar_name_key; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.collapsar
    ADD CONSTRAINT collapsar_name_key UNIQUE (name);


--
-- Name: collapsar collapsar_pkey; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.collapsar
    ADD CONSTRAINT collapsar_pkey PRIMARY KEY (collapsar_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mari
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

