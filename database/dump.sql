--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.routines DROP CONSTRAINT "routines_petId_fkey";
ALTER TABLE ONLY public.pets DROP CONSTRAINT "pets_userId_fkey";
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.routines DROP CONSTRAINT routines_pkey;
ALTER TABLE ONLY public.pets DROP CONSTRAINT pets_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT email_unique;
ALTER TABLE public.users ALTER COLUMN "userId" DROP DEFAULT;
ALTER TABLE public.routines ALTER COLUMN "routineId" DROP DEFAULT;
ALTER TABLE public.pets ALTER COLUMN "petId" DROP DEFAULT;
DROP SEQUENCE public."users_userId_seq";
DROP TABLE public.users;
DROP SEQUENCE public."routines_routineId_seq";
DROP TABLE public.routines;
DROP SEQUENCE public."pets_petId_seq";
DROP TABLE public.pets;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pets (
    "petId" integer NOT NULL,
    "userId" integer NOT NULL,
    name character varying(64) NOT NULL,
    birthday date,
    "adoptionDay" date,
    age integer NOT NULL,
    breed character varying(64),
    species character varying(32) NOT NULL,
    coloring character varying(32),
    allergies character varying(64),
    diet character varying(64)
);


--
-- Name: pets_petId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."pets_petId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pets_petId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."pets_petId_seq" OWNED BY public.pets."petId";


--
-- Name: routines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.routines (
    "routineId" integer NOT NULL,
    "petId" integer NOT NULL,
    "routineName" character varying(32) NOT NULL,
    description text NOT NULL,
    "dateTime" timestamp with time zone NOT NULL,
    "isCompleted" boolean NOT NULL,
    "isRepeatable" boolean NOT NULL
);


--
-- Name: routines_routineId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."routines_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routines_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."routines_routineId_seq" OWNED BY public.routines."routineId";


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    "userId" integer NOT NULL,
    email character varying(64) NOT NULL,
    password character varying(64) NOT NULL,
    "fullName" character varying(64) NOT NULL
);


--
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";


--
-- Name: pets petId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets ALTER COLUMN "petId" SET DEFAULT nextval('public."pets_petId_seq"'::regclass);


--
-- Name: routines routineId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routines ALTER COLUMN "routineId" SET DEFAULT nextval('public."routines_routineId_seq"'::regclass);


--
-- Name: users userId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pets ("petId", "userId", name, birthday, "adoptionDay", age, breed, species, coloring, allergies, diet) FROM stdin;
\.


--
-- Data for Name: routines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.routines ("routineId", "petId", "routineName", description, "dateTime", "isCompleted", "isRepeatable") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users ("userId", email, password, "fullName") FROM stdin;
5	ju@ju.ju	$2b$10$2iqW6caowK.qkWdkmt7jO.90GjWP17kwXe7HBvO1jrshXFDPyhHXq	Julie Chung
\.


--
-- Name: pets_petId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."pets_petId_seq"', 11, true);


--
-- Name: routines_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."routines_routineId_seq"', 12, true);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."users_userId_seq"', 7, true);


--
-- Name: users email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY ("petId");


--
-- Name: routines routines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT routines_pkey PRIMARY KEY ("routineId");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");


--
-- Name: pets pets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT "pets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId");


--
-- Name: routines routines_petId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT "routines_petId_fkey" FOREIGN KEY ("petId") REFERENCES public.pets("petId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

