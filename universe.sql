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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30),
    meaning character varying(30) NOT NULL,
    brightest_star character varying(30)
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
    name character varying(30) NOT NULL,
    distance_in_mly numeric(10,3),
    diameter_in_ly integer,
    is_human_here boolean,
    description text
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
    name character varying(30),
    diameter_in_km numeric(10,2),
    planet_id integer NOT NULL,
    semi_major_axis_in_km integer
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
    name character varying(30),
    mass_in_earth_mass numeric(10,2),
    is_human_here boolean,
    star_id integer NOT NULL,
    number_of_moon_detected integer
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
    name character varying(30),
    distance_in_ly numeric(10,2),
    mass_in_solar_mass numeric(10,2),
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

INSERT INTO public.constellation VALUES (1, 'Aquarius', 'Water-bearer', 'Sadalsuud');
INSERT INTO public.constellation VALUES (2, 'Aries', 'Ram', 'Hamal');
INSERT INTO public.constellation VALUES (3, 'Cancer', 'Crab', 'Tarf');
INSERT INTO public.constellation VALUES (4, 'Capricornus', 'Sea goat', 'Deneb Algedi');
INSERT INTO public.constellation VALUES (5, 'Gemini', 'Twins', 'Pollux');
INSERT INTO public.constellation VALUES (6, 'Leo', 'Lion', 'Regulus');
INSERT INTO public.constellation VALUES (7, 'Libra', 'Balance/Scale', 'Zubeneschamali');
INSERT INTO public.constellation VALUES (8, 'Pisces', 'Fishes', 'Alpherg');
INSERT INTO public.constellation VALUES (9, 'Sagittarius', 'Archer', 'Kaus Australis');
INSERT INTO public.constellation VALUES (10, 'Scorpius', 'Scorpion', 'Antares');
INSERT INTO public.constellation VALUES (11, 'Taurus', 'Bull', 'Aldebaran');
INSERT INTO public.constellation VALUES (12, 'Virgo', 'Virgin/Maiden', 'Spica');
INSERT INTO public.constellation VALUES (13, 'Ophiuchus', 'Serpent-bearer', 'Rasalhague');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.026, 87400, true, 'Earth is here.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2.500, 152000, false, 'Also known as M31 or NGC 224');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 3.200, 61120, false, 'Also known as M33 or NGC 598');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 31.000, 76900, false, 'Also known as M51a or NGC 5194');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 31.100, 49000, false, 'Also known as M104 or NGC 4594');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 20.900, 169300, false, 'Also known as M101 or NGC 5457');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474.80, 3, 384399);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.20, 4, 9377);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.60, 4, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 3643.20, 5, 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 3121.60, 5, 671100);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268.20, 5, 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820.60, 5, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 5149.46, 6, 1221930);
INSERT INTO public.moon VALUES (9, 'Iapetus', 1468.60, 6, 3560820);
INSERT INTO public.moon VALUES (10, 'Rhea', 1527.60, 6, 527108);
INSERT INTO public.moon VALUES (11, 'Tethys', 1062.20, 6, 294619);
INSERT INTO public.moon VALUES (12, 'Dione', 1122.80, 6, 377396);
INSERT INTO public.moon VALUES (13, 'Ariel', 1157.80, 7, 191020);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1169.40, 7, 266300);
INSERT INTO public.moon VALUES (15, 'Titania', 1576.80, 7, 435910);
INSERT INTO public.moon VALUES (16, 'Oberon', 1522.80, 7, 583520);
INSERT INTO public.moon VALUES (17, 'Miranda', 471.60, 7, 129390);
INSERT INTO public.moon VALUES (18, 'Triton', 2705.20, 8, 354759);
INSERT INTO public.moon VALUES (19, 'Proteus', 420.00, 8, 117646);
INSERT INTO public.moon VALUES (20, 'Nereid', 357.00, 8, 5504000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.06, false, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 0.82, false, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.11, false, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.80, false, 1, 92);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.20, false, 1, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.50, false, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.10, false, 1, 14);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 1.07, false, 3, 0);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 0.26, false, 3, 0);
INSERT INTO public.planet VALUES (11, 'Tau Ceti e', 3.93, false, 10, 0);
INSERT INTO public.planet VALUES (12, 'Tau Ceti f', 3.93, false, 10, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.00, 1.00, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 548.00, 16.50, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4.25, 0.12, 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 8.60, 2.06, 1);
INSERT INTO public.star VALUES (5, 'Sirius B', 8.71, 1.02, 1);
INSERT INTO public.star VALUES (6, 'Altair', 16.73, 1.86, 1);
INSERT INTO public.star VALUES (7, 'Vega', 25.04, 2.14, 1);
INSERT INTO public.star VALUES (8, 'Aldebaran', 65.30, 1.16, 1);
INSERT INTO public.star VALUES (9, 'Rigel', 863.00, 21.00, 1);
INSERT INTO public.star VALUES (10, 'Tau Ceti', 11.91, 0.78, 1);
INSERT INTO public.star VALUES (11, 'Lalande 21185', 8.30, 0.39, 1);
INSERT INTO public.star VALUES (12, 'Alpheratz', 97.00, 3.80, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: constellation constellation_brightest_star_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_brightest_star_key UNIQUE (brightest_star);


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

