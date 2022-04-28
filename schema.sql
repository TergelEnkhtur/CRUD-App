--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: crud_library; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.crud_library (
    isbn character(13) NOT NULL,
    book_name character varying(50) NOT NULL,
    author_name character varying(50) NOT NULL
);


ALTER TABLE public.crud_library OWNER TO api_user;

--
-- Name: team_members; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.team_members (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30)
);


ALTER TABLE public.team_members OWNER TO api_user;

--
-- Name: team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: api_user
--

CREATE SEQUENCE public.team_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_members_id_seq OWNER TO api_user;

--
-- Name: team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: api_user
--

ALTER SEQUENCE public.team_members_id_seq OWNED BY public.team_members.id;


--
-- Name: team_members id; Type: DEFAULT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.team_members ALTER COLUMN id SET DEFAULT nextval('public.team_members_id_seq'::regclass);


--
-- Data for Name: crud_library; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.crud_library (isbn, book_name, author_name) FROM stdin;
123456789123 	Harry Potter and the Prisoner of Azkaban	J.K. Rowling
\.


--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.team_members (id, first_name, last_name) FROM stdin;
1	Tergel	Enkhtur
2	Brandon	Rosas
3	Cooper	Ross
4	Zaeem	Khan
5	Henry	Holman
6	Hinal	Patel
7	Tergel	Enkhtur
8	Naruto	Uzumaki
9	Saruul	Enkhtur
10	First	Last
11	FirstName	LastName
12	First1	Last1
13	1234567891233	Harry
\.


--
-- Name: team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: api_user
--

SELECT pg_catalog.setval('public.team_members_id_seq', 13, true);


--
-- Name: crud_library crud_library_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_library
    ADD CONSTRAINT crud_library_pkey PRIMARY KEY (isbn);


--
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

