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
    galaxy_type_id integer,
    number_of_planets integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_spherical boolean,
    planet_id integer
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
    description text,
    is_spherical boolean,
    has_life boolean,
    distance_from_earth numeric,
    planet_type_id integer,
    age_in_millions_of_years integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer,
    distance_from_earth numeric
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy; contains the Solar System and hundreds of billions of stars', 1, 5500);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 'Nearest large galaxy to the Milky Way', 1, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', 'Third-largest galaxy in the Local Group', 1, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud (LMC)', 'A satellite galaxy of the Milky Way, visible from the Southern Hemisphere', 1, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud (SMC)', 'Smaller satellite galaxy of the Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero (M104)', 'Known for its large central bulge and dark dust lane, giving it a sombrero-like shape', 3, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'They look like giant rotating pinwheels with a flat disk and a bright central core');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'They look like stretched-out circles or smooth, glowing ovals without any distince arms');
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', 'They are a middle stage between spirals and ellipticals');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite. It is the fifth largest moon in the Solar System and the largest relative to its parent planet. Its gravitational pull drives Earth''s tides.', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and inner of Mars'' two moons. It is a small, irregularly shaped body, heavily cratered, and is slowly spiraling inward toward Mars.', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outer of Mars'' two moons. It is a tiny, irregular, cratered body, likely a captured asteroid.', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The innermost of Jupiter''s four Galilean moons. It is the most volcanically active body in the Solar System, with a surface of sulfur and molten silicate.', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'A Galilean moon of Jupiter with a smooth, icy surface. Beneath its crust lies a global ocean, making it a prime target in the search for extraterrestrial life.', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System and a Galilean moon of Jupiter. It is larger than Mercury and is the only moon known to generate its own magnetic field.', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The outermost of Jupiter''s Galilean moons. It has the most heavily cratered surface in the Solar System and is composed of roughly equal rock and ice.', true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'A small, irregular inner moon of Jupiter. It is reddish in color and orbits closer to Jupiter than the Galilean moons.', false, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 'Saturn''s largest moon and the second largest in the Solar System. It is the only moon with a dense atmosphere and has lakes and rivers of liquid methane.', true, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'A small icy moon of Saturn. It vents water vapor and ice from a subsurface ocean through cryovolcanic plumes at its south pole.', true, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 'A small, heavily cratered moon of Saturn, dominated by the giant Herschel crater, which gives it a resemblance to the Death Star.', true, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'The second largest moon of Saturn. It is an icy, heavily cratered body and may have a tenuous ring system of its own.', true, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'A moon of Saturn with a striking two-tone surface: one hemisphere is bright, the other dark. It also has a prominent equatorial ridge.', true, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus. It is an icy, rocky body with a surface scarred by huge canyons and fault valleys.', true, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'The outermost of Uranus'' five major moons. It is icy and heavily cratered, with dark patches on its surface.', true, 7);
INSERT INTO public.moon VALUES (16, 'Miranda', 'A small moon of Uranus with one of the most varied and bizarre terrains in the Solar System, including the giant Verona Rupes cliff.', true, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 'Neptune''s largest moon. It is the only large moon with a retrograde orbit, suggesting it was captured, and has nitrogen geysers on its surface.', true, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 'The third largest moon of Neptune. It is small and irregular, with one of the most eccentric orbits of any moon in the Solar System.', false, 8);
INSERT INTO public.moon VALUES (19, 'Charon', 'The largest moon of Pluto. It is so large relative to Pluto that the two are sometimes considered a binary system, mutually tidally locked.', true, 9);
INSERT INTO public.moon VALUES (20, 'Hydra', 'The second largest moon of Pluto, discovered in 2005. It is a small, irregularly shaped icy body orbiting beyond Charon.', false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System and the closest to the Sun. It has a heavily cratered, rocky surface and experiences extreme temperature swings.', true, false, 77000000, 1, 4503, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun, often called Earth "sister planet" due to its similar size. It has a thick, toxic atmosphere that creates a runaway greenhouse effect, making it the hottest planet.', true, false, 41000000, 1, 4600, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun and the only astronomical object known to harbor life. It has a diverse surface with liquid water, mountains, and a protective atmosphere.', true, true, NULL, 1, 4570, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun, known as the "Red Planet" due to its reddish appearance from iron oxide. It is a cold, desert world with a very thin atmosphere.', true, NULL, 78000000, 1, 4503, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, a gas giant with a Great Red Spot (a giant storm). It has a strong magnetic field and dozens of moons.', true, false, 629000000, 2, 4600, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun, famous for its spectacular ring system. It is a gas giant composed mostly of hydrogen and helium.', true, false, 1200000000, 2, 4503, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun, an ice giant with a unique sideways rotation. It has a pale blue color due to methane in its atmosphere.', true, false, 2600000000, 3, 4503, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth and farthest known planet from the Sun. It is an ice giant with a deep blue color and the strongest winds in the Solar System.', true, false, 4300000000, 3, 4503, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper belt. It was considered the ninth planet until 2006. It has a complex surface with mountains and glaciers.', true, false, 5800000000, NULL, 4500, 1);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'A rocky, Earth-sized exoplanet orbiting in the habitable zone of an ultracool dwarf star. It is one of seven planets in the TRAPPIST-1 system.', true, NULL, NULL, 1, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 'A "super-Earth" exoplanet orbiting in the habitable zone of a Sun-like star. It is one of the most Earth-like planets discovered.', true, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'An exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri. It is a potentially rocky, Earth-like planet.', true, NULL, 40000000000000, NULL, NULL, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestial (Rocky) Planets', 'These have solid, rocky surfaces and metallic cores. They are more closer to the Sun');
INSERT INTO public.planet_type VALUES (2, 'Gas Giants', 'These are massive planets made mostly of hydrogen and helium gas with no hard surface');
INSERT INTO public.planet_type VALUES (3, 'Ice Giants', 'These are large planets made of heavier elements like water, ammonia, and methane, often called ices');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System', 1, 0.0000158);
INSERT INTO public.star VALUES (2, 'Sirius (Alpha Canis Majoris)', 'The brightest star in the night sky, known as the "Dog Star."', 1, 8.6);
INSERT INTO public.star VALUES (3, 'Canopus (Alpha Carinae)', 'The second-brightest star in the night sky', 1, 310);
INSERT INTO public.star VALUES (4, 'Alpha Centauri (Rigil Kentaurus)', 'The closest star system to the Sun. It consists of three stars', 1, 4.4);
INSERT INTO public.star VALUES (5, 'Arcturus (Alpha Boötis)', 'A red giant star and the brightest star in the constellation Boötes', 1, 25);
INSERT INTO public.star VALUES (6, 'Vega (Alpha Lyrae)', 'A bright blue-white star in the constellation Lyra', 1, 25);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 3, true);


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
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_galaxy_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_type_id FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type_id FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

