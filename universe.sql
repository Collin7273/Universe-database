--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: dwarves; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarves (
    name character varying(255) NOT NULL,
    age_billion_years numeric(10,2) NOT NULL,
    dwarves_id integer NOT NULL
);


ALTER TABLE public.dwarves OWNER TO freecodecamp;

--
-- Name: dwarves_dwarves_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarves_dwarves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarves_dwarves_id_seq OWNER TO freecodecamp;

--
-- Name: dwarves_dwarves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarves_dwarves_id_seq OWNED BY public.dwarves.dwarves_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_billion_years numeric(10,2) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    has_spiral_arm boolean DEFAULT false,
    has_spiral_arms boolean DEFAULT false
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
    diameter_km integer NOT NULL,
    orbital_period_days integer,
    description text,
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
    name character varying(255) NOT NULL,
    diameter_km integer NOT NULL,
    averge_temp_celsius integer,
    is_gas_giant boolean DEFAULT false,
    star_id integer NOT NULL
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
    spectral_type character varying(10) NOT NULL,
    mass_solar_masses numeric(10,2) NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: dwarves dwarves_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarves ALTER COLUMN dwarves_id SET DEFAULT nextval('public.dwarves_dwarves_id_seq'::regclass);


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
-- Data for Name: dwarves; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarves VALUES ('Pluto', 12376.00, 1);
INSERT INTO public.dwarves VALUES ('Eris', 1234.00, 2);
INSERT INTO public.dwarves VALUES ('Ceres', 54.00, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.80, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2.56, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 11.00, 'Spiral', false, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 16.50, 'Irregular', false, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 2.00, 'Irregular', false, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6.00, 'Elliptical', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 3643, 2, 'Volcanic moon with active eruptions', 1);
INSERT INTO public.moon VALUES (2, 'Europa', 3138, 4, 'Ice moon with possible subsurface ocean', 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5268, 7, 'Largest moon in our solar system', 1);
INSERT INTO public.moon VALUES (4, 'Callisto', 4879, 17, 'Heavily cratered moon with possible internal ocean', 1);
INSERT INTO public.moon VALUES (5, 'Titan', 5150, 16, 'Largest moon of Saturn with a thick atmosphere', 6);
INSERT INTO public.moon VALUES (6, 'Rhea', 1529, 5, 'Second-largest moon of Saturn with a ring system', 6);
INSERT INTO public.moon VALUES (7, 'Dione', 1118, 3, 'Icy moon of Saturn with a reflective surface', 6);
INSERT INTO public.moon VALUES (8, 'Tethys', 1071, 2, 'Icy moon of Saturn with a large canyon system', 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 396, 1, 'Smallest major moon of Saturn with a crater resembling the Death Star', 6);
INSERT INTO public.moon VALUES (11, 'Titania', 1577, 9, 'Largest moon of Uranus with a complex surface geology', 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 1523, 13, 'Second-largest moon of Uranus with a dark surface', 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1169, 4, 'Darkest moon of Uranus with a smooth, cratered surface', 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 1191, 3, 'Brightest moon of Uranus with a smooth, cratered surface', 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 478, 1, 'Smallest major moon of Uranus with an irregular shape and unusual tilt', 7);
INSERT INTO public.moon VALUES (16, 'Proteus', 434, 1, 'Irregularly shaped moon of Neptune with a dark surface', 8);
INSERT INTO public.moon VALUES (17, 'Triton', 2709, -6, 'Largest moon of Neptune with a retrograde orbit and a geologically active surface', 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 348, 359, 'Irregularly shaped moon of Neptune with a highly elliptical orbit', 8);
INSERT INTO public.moon VALUES (19, 'Hyperion', 270, 21, 'Sponge-like moon of Saturn with a chaotic rotation', 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', 1492, 79, 'Two-toned moon of Saturn with a bright leading hemisphere and a dark trailing hemisphere', 6);
INSERT INTO public.moon VALUES (21, 'Enceladus', 504, 1, 'Icy moon of Saturn with active geysers erupting water vapor', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 430, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 462, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 15, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, -63, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139822, -100, true, 2);
INSERT INTO public.planet VALUES (6, 'Uranus', 12264, -163, true, 1);
INSERT INTO public.planet VALUES (7, 'Pluto', 9104, -221839, false, 3);
INSERT INTO public.planet VALUES (8, 'Earth 2', 12673, 15, false, 1);
INSERT INTO public.planet VALUES (9, 'Earth 3', 12673, 17, false, 2);
INSERT INTO public.planet VALUES (10, 'Earth 4', 12673, 16, false, 2);
INSERT INTO public.planet VALUES (11, 'Venus 2', 12104, 463, true, 1);
INSERT INTO public.planet VALUES (12, 'Mars 2', 6779, -62, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.00, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'MSV', 0.12, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'A1V', 2.02, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'G8V', 1.10, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 'K1V', 0.90, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'M2Iab', 20.00, 4);


--
-- Name: dwarves_dwarves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarves_dwarves_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarves dwarves_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarves
    ADD CONSTRAINT dwarves_name_key UNIQUE (name);


--
-- Name: dwarves dwarves_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarves
    ADD CONSTRAINT dwarves_pkey PRIMARY KEY (dwarves_id);


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

