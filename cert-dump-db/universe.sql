--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
    name character varying(30) NOT NULL,
    description text
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
    description text,
    is_spherical boolean,
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    mean_radius_in_kms numeric(7,1)
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
    name character varying(30) NOT NULL,
    confirmed_moons integer,
    rings boolean,
    orbital_period_in_years numeric(10,2),
    rotation_period_in_days numeric(10,2),
    description text,
    number_of_rings integer,
    major_planet boolean,
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    classification character(1),
    constellation_id integer
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

INSERT INTO public.constellation VALUES (1, 'Centaurus', 'The constellation Centaurus, the centaur, is located in the southern hemisphere of the sky. It is visible at latitudes between 25 degrees and -90 degrees. It is a large constellation that covers an area of 1,060 square degrees. This makes it the ninth largest constellation in the night sky. It is bordered by the constellations Antlia, Carina, Circinus, Crux, Hydra, Libra, Lupus, Musca, and Vela.');
INSERT INTO public.constellation VALUES (2, 'Aquila', 'The constellation Aquila, the eagle, is visible in the northern hemisphere from July through October. It can be seen between latitudes 90 degrees and -75 degrees. It is a mid-sized constellation, spanning 652 square degrees of the sky. This makes it the 22nd largest constellation in the night sky. It is bordered by the constellations Aquarius, Capricornus, Delphinus, Hercules, Ophiuchus, Sagitta, Sagittarius, Scutum, and Serpens Cauda. Aquila’s brightest star Altair forms part of the famous Summer Triangle, along with Deneb in Cygnus and Vega in Lyra.');
INSERT INTO public.constellation VALUES (3, 'Virgo', 'The constellation Virgo, the maiden, can be seen in spring and summer in the northern hemisphere and in autumn and winter in the southern hemisphere. It is a very large constellation covering a total area of 1,294 square degrees. This makes it the second largest constellation in the night sky. It is located between Leo to the west and Libra to the east and can be easily found through its brightest star, Spica.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Milky Way Galaxy, large spiral system consisting of several hundred billion stars, one of which is the Sun. It takes its name from the Milky Way, the irregular luminous band of stars and gas clouds that stretches across the sky as seen from Earth', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda Galaxy, also called Andromeda Nebula, (catalog numbers NGC 224 and M31), great spiral galaxy in the constellation Andromeda, the nearest large galaxy. The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur. It is located about 2,480,000 light-years from Earth; its diameter is approximately 200,000 light-years; and it shares various characteristics with the Milky Way system.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Hercules', 'Hercules, or Her, is a dwarf spheroidal galaxy situated in the Hercules constellation and discovered in 2006 in data obtained by the Sloan Digital Sky Survey. The galaxy is located at a distance of about 140 kpc from the Sun and moves away from the Sun with a velocity of about 45 km/s. It is classified as a dwarf spheroidal galaxy.', true, true);
INSERT INTO public.galaxy VALUES (4, 'Comet Galaxy', 'The Comet Galaxy is a spiral galaxy with a little more mass than our Milky Way galaxy, located 3.2 billion light-years away from Earth, within the galaxy cluster Abell 2667, in the small southern constellation of Sculptor. It was detected on 2 March 2007 with the Hubble Space Telescope.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Messier 51 (M51), better known as the Whirlpool Galaxy, is a famous grand-design spiral galaxy located in the constellation Canes Venatici. The Whirlpool Galaxy has an apparent magnitude of 8.4 and lies at an approximate distance of 23 million light years from Earth.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Centaurus A is a peculiar galaxy located in the southern constellation Centaurus. It is the fifth brightest galaxy in the night sky, the nearest giant galaxy to the Milky Way, and one of the nearest radio galaxies to Earth.', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4, 'The Moon is Earth''s only natural satellite. It is the fifth largest satellite in the Solar System and the largest and most massive relative to its parent planet, with a diameter about one-quarter that of Earth (comparable to the width of Australia).', 1738.0);
INSERT INTO public.moon VALUES (2, 'Phobos', 5, 'Phobos is the innermost and larger of the two natural satellites of Mars, the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. It is named after Phobos, the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', 11.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 5, 'Deimos is the smaller and outermost of the two natural satellites of Mars, the other being Phobos. Of similar composition to C and D-type asteroids, Deimos has a mean radius of 6.2 km (3.9 mi) and takes 30.3 hours to orbit Mars. Deimos is 23,460 km (14,580 mi) from Mars, much farther than Mars''s other moon, Phobos. It is named after Deimos, the Ancient Greek god and personification of dread and terror.', 6.2);
INSERT INTO public.moon VALUES (4, 'Io', 6, 'Io, or Jupiter I, is the innermost and third-largest of the four Galilean moons of the planet Jupiter. Slightly larger than Earth''s moon, Io is the fourth-largest moon in the Solar System, has the highest density of any moon, the strongest surface gravity of any moon, and the lowest amount of water (by atomic ratio) of any known astronomical object in the Solar System.', 1821.6);
INSERT INTO public.moon VALUES (5, 'Europa', 6, 'Europa, or Jupiter II, is the smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet of all the 92 known moons of Jupiter. It is also the sixth-largest moon in the Solar System. Europa was discovered in 1610 by Galileo Galilei and was named after Europa, the Phoenician mother of King Minos of Crete and lover of Zeus (the Greek equivalent of the Roman god Jupiter).', 1560.8);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 'Ganymede, a satellite of Jupiter (Jupiter III), is the largest and most massive of the Solar System''s moons. The ninth-largest object (including the Sun) of the Solar System, it is the largest without a substantial atmosphere (albeit not the most massive one, which is Mercury). It has a diameter of 5,268 km (3,273 mi), making it 26 percent larger than the planet Mercury by volume, although it is only 45 percent as massive. Possessing a metallic core, it has the lowest moment of inertia factor of any solid body in the Solar System and is the only moon known to have a magnetic field.', 2634.1);
INSERT INTO public.moon VALUES (7, 'Callisto', 6, 'Callisto, or Jupiter IV, is the second-largest moon of Jupiter, after Ganymede. It is the third-largest moon in the Solar System after Ganymede and Saturn''s largest moon Titan, and the largest object in the Solar System that may not be properly differentiated. Callisto was discovered in 1610 by Galileo Galilei. With a diameter of 4821 km, Callisto is about 99% the diameter of the planet Mercury, but only about a third of its mass. It is the fourth Galilean moon of Jupiter by distance, with an orbital radius of about 1883000 km.', 2410.3);
INSERT INTO public.moon VALUES (8, 'Amalthea', 6, 'Amalthea is a moon of Jupiter. It has the third closest orbit around Jupiter among known moons and was the fifth moon of Jupiter to be discovered, so it is also known as Jupiter V. It is also the fifth largest moon of Jupiter, after the four Galilean Moons. Edward Emerson Barnard discovered the moon on 9 September 1892 and named it after Amalthea of Greek mythology.', 83.5);
INSERT INTO public.moon VALUES (9, 'Himalia', 6, 'Himalia, or Jupiter VI, is the largest irregular satellite of Jupiter, with a diameter of at least 140 km (90 mi). It is the sixth largest Jovian satellite, after the four Galilean moons and Amalthea. It was discovered by Charles Dillon Perrine at the Lick Observatory on 3 December 1904 and is named after the nymph Himalia, who bore three sons of Zeus (the Greek equivalent of Jupiter).', 69.8);
INSERT INTO public.moon VALUES (10, 'Elara', 6, 'Elara is a prograde irregular satellite of Jupiter. It was discovered by Charles Dillon Perrine at Lick Observatory in 1905 in photographs taken with the 36" Crossley reflecting telescope which he had recently rebuilt. It is the eighth-largest moon of Jupiter and is named after Elara, one of Zeus''s lovers and the mother of the giant Tityos.', 43.0);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 6, 'Pasiphae, formerly spelled Pasiphaë, is a retrograde irregular satellite of Jupiter. It was discovered in 1908 by Philibert Jacques Melotte and later named after the mythological Pasiphaë, wife of Minos and mother of the Minotaur from Greek legend.', 30.0);
INSERT INTO public.moon VALUES (12, 'Sinope', 6, 'Sinope is a retrograde irregular satellite of Jupiter discovered by Seth Barnes Nicholson at Lick Observatory in 1914, and is named after Sinope of Greek mythology.', 19.0);
INSERT INTO public.moon VALUES (13, 'Lysithea', 6, 'Lysithea is a prograde irregular satellite of Jupiter. It was discovered by Seth Barnes Nicholson in 1938 at Mount Wilson Observatory and is named after the mythological Lysithea, daughter of Oceanus and one of Zeus'' lovers.', 18.0);
INSERT INTO public.moon VALUES (14, 'Carme', 6, 'Carme is a retrograde irregular satellite of Jupiter. It was discovered by Seth Barnes Nicholson at Mount Wilson Observatory in California in July 1938. It is named after the mythological Carme, mother by Zeus of Britomartis, a Cretan goddess.', 23.0);
INSERT INTO public.moon VALUES (15, 'Ananke', 6, 'Ananke is a retrograde irregular moon of Jupiter. It was discovered by Seth Barnes Nicholson at Mount Wilson Observatory in 1951 and is named after the Greek mythological Ananke, the personification of necessity, and the mother of the Moirai (Fates) by Zeus.', 14.0);
INSERT INTO public.moon VALUES (16, 'Mimas', 7, 'Mimas, also designated Saturn I, is a moon of Saturn discovered in 1789 by William Herschel. It is named after Mimas, a son of Gaia in Greek mythology.', 198.2);
INSERT INTO public.moon VALUES (17, 'Enceladus', 7, 'Enceladus is the sixth-largest moon of Saturn (19th largest in the Solar System). It is about 500 kilometers (310 miles) in diameter, about a tenth of that of Saturn''s largest moon, Titan. Enceladus is mostly covered by fresh, clean ice, making it one of the most reflective bodies of the Solar System.', 252.1);
INSERT INTO public.moon VALUES (18, 'Tethys', 7, 'Tethys, or Saturn III, is a mid-sized moon of Saturn about 1,060 km (660 mi) across. It was discovered by G. D. Cassini in 1684 and is named after the titan Tethys of Greek mythology.', 533.1);
INSERT INTO public.moon VALUES (19, 'Dione', 7, 'Dione is a moon of Saturn. It was discovered by Italian astronomer Giovanni Domenico Cassini in 1684. It is named after the Titaness Dione of Greek mythology. It is also designated Saturn IV.', 561.4);
INSERT INTO public.moon VALUES (20, 'Rhea', 7, 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System, with a surface area that is compareable to the area of Australia. It is the smallest body in the Solar System for which precise measurements have confirmed a shape consistent with hydrostatic equilibrium.', 763.8);
INSERT INTO public.moon VALUES (21, 'Ariel', 8, 'Ariel is the fourth-largest of the 27 known moons of Uranus. Ariel orbits and rotates in the equatorial plane of Uranus, which is almost perpendicular to the orbit of Uranus and so has an extreme seasonal cycle.', 578.9);
INSERT INTO public.moon VALUES (22, 'Umbriel', 8, 'Umbriel is a moon of Uranus discovered on October 24, 1851, by William Lassell. It was discovered at the same time as Ariel and named after a character in Alexander Pope''s 1712 poem The Rape of the Lock. Umbriel consists mainly of ice with a substantial fraction of rock, and may be differentiated into a rocky core and an icy mantle.', 548.7);
INSERT INTO public.moon VALUES (23, 'Triton', 9, 'Triton is the largest natural satellite of the planet Neptune, and was the first Neptunian moon to be discovered, on October 10, 1846, by English astronomer William Lassell. It is the only large moon in the Solar System with a retrograde orbit, an orbit in the direction opposite to its planet''s rotation. Because of its retrograde orbit and composition similar to Pluto, Triton is thought to have been a dwarf planet, captured from the Kuiper belt.', 1353.4);
INSERT INTO public.moon VALUES (24, 'Nereid', 9, 'Nereid, or Neptune II, is the third-largest moon of Neptune. It has the most eccentric orbit of all known moons in the Solar System. It was the second moon of Neptune to be discovered, by Gerard Kuiper in 1949.', 170.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, 0.24, 58.65, 'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun''s planets. It is named after the Roman god Mercurius (Mercury), god of commerce, messenger of the gods, and mediator between gods and mortals, corresponding to the Greek god Hermes.', NULL, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0, false, 0.62, 243.02, 'Venus is the second planet from the Sun. It is sometimes called Earth''s "sister" or "twin" planet as it is almost as large and has a similar composition. As an interior planet to Earth, Venus (like Mercury) appears in Earth''s sky never far from the Sun, either as morning star or evening star. Aside from the Sun and Moon, Venus is the brightest natural object in Earth''s sky, capable of casting visible shadows on Earth in dark conditions and being visible to the naked eye in broad daylight.', NULL, true, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 1, false, 1.00, 1.00, 'Earth is the third planet from the Sun and the only place known in the universe where life has originated and found habitability. While Earth may not contain the largest volumes of water in the Solar System, only Earth sustains liquid surface water, extending over 70.8% of the Earth with its ocean, making Earth an ocean world.', NULL, true, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 2, false, 1.88, 1.03, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, larger only than Mercury. In the English language, Mars is named for the Roman god of war. Mars is a terrestrial planet with a thin atmosphere and has a crust primarily composed of elements similar to Earth''s crust, as well as a core made of iron and nickel.', NULL, true, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 95, true, 11.86, 0.41, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun.', 4, true, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 83, true, 29.45, 0.44, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive.', 7, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 27, true, 84.02, 0.72, 'Uranus is the seventh planet from the Sun. It is named after Greek sky deity Uranus (Caelus), who in Greek mythology is the father of Cronus (Saturn), a grandfather of Zeus (Jupiter) and great-grandfather of Ares (Mars). Uranus has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. The planet is similar in composition to Neptune, and both have bulk chemical compositions which differ from those of the other two giant planets, Jupiter and Saturn (the gas giants). For this reason, scientists often distinguish Uranus and Neptune as "ice giants".', 13, true, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 14, true, 164.79, 0.67, 'Neptune is the eighth planet from the Sun and the farthest known planet in the Solar System. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere.', 5, true, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, false, 4.60, 0.38, 'Ceres is a dwarf planet in the asteroid belt between the orbits of Mars and Jupiter. It was the first asteroid discovered, on 1 January 1801, by Giuseppe Piazzi at Palermo Astronomical Observatory in Sicily and announced as a new planet. Ceres was later classified as an asteroid and then a dwarf planet – the only one orbiting entirely within Neptune''s orbit.', NULL, false, 1);
INSERT INTO public.planet VALUES (11, 'Orcus', 1, NULL, 247.50, NULL, 'Orcus is a trans-Neptunian dwarf planet with a large moon, Vanth. It has a diameter of 870 to 960 km (540 to 600 mi), the size of or somewhat smaller than the asteroid Ceres.', NULL, false, 1);
INSERT INTO public.planet VALUES (12, 'Pluto', 5, false, 247.90, 6.39, 'Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It is the ninth-largest and tenth-most-massive known object to directly orbit the Sun. It is the largest known trans-Neptunian object by volume, by a small margin, but is slightly less massive than Eris. Like other Kuiper belt objects, Pluto is made primarily of ice and rock and is much smaller than the inner planets. Pluto has only one sixth the mass of Earth''s moon, and one third its volume.', NULL, false, 1);
INSERT INTO public.planet VALUES (13, 'Haumea', 2, true, 283.80, 0.16, 'Haumea is a dwarf planet located beyond Neptune''s orbit. It was discovered in 2004 by a team headed by Mike Brown of Caltech at the Palomar Observatory in the United States and disputably also in 2005 by a team headed by José Luis Ortiz Moreno at the Sierra Nevada Observatory in Spain, though the latter claim has been contested. On September 17, 2008, it was named after Haumea, the Hawaiian goddess of childbirth, under the expectation by the International Astronomical Union (IAU) that it would prove to be a dwarf planet. Nominal estimates make it the third-largest known trans-Neptunian object, after Eris and Pluto, and approximately the size of Uranus''s moon Titania.', 1, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core. The Sun radiates this energy mainly as light, ultraviolet, and infrared radiation, and is the most important source of energy for life on Earth.', 'G', NULL);
INSERT INTO public.star VALUES (3, 'Altair', 1, 'Altair, also called Alpha Aquilae, the brighest star in the northern constellation Aquila and the 12th brightest star in the sky.', 'A', 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Proxima Centauri is a small, low-mass star located 4.2465 light-years away from the Sun in the southern constellation of Centaurus. Its Latin name means the ''nearest of Centaurus''. It was discovered in 1915 by Robert Innes and is the nearest-known star to the Sun.', 'M', 1);
INSERT INTO public.star VALUES (4, 'Spica', 1, 'Spica, (Latin: "Head of Grain") also called Alpha Virginis, brightest star in the zodiacal constellation Virgo and one of the 15 brightest in the entire sky, having an apparent visual magnitude of 1.04. It is a bluish star; spectroscopic examination reveals Spica to be a binary with a four-day period, its two components being of the first and third magnitudes, respectively. Spica lies about 250 light-years from Earth.', 'B', 3);
INSERT INTO public.star VALUES (5, 'Centaurus X-3', 1, 'Centaurus X-3 is an X-ray pulsar with a period of 4.84 seconds. It was the first X-ray pulsar to be discovered, and the third X-ray source to be discovered in the constellation Centaurus.', 'O', 1);
INSERT INTO public.star VALUES (6, 'Beta Virginis', NULL, 'Zavijava, also designated as β Virginis (beta Virginis), is a multiple main-sequence star in the constellation of Virgo. Zavijava visual magnitude is 3.61. Because of its moderate brightness, Zavijava should be easily visible from locations with dark skyes, while it can be barely visible, or not visible at all, from skyes affected by light pollution.', 'F', 1);


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

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: constellation db_constellation_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT db_constellation_id UNIQUE (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy tb_galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT tb_galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: moon tb_moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT tb_moon_id_unique UNIQUE (moon_id);


--
-- Name: planet tb_planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT tb_planet_id_unique UNIQUE (planet_id);


--
-- Name: star tb_star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT tb_star_id_unique UNIQUE (star_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

