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
-- Name: crud_user; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.crud_user (
    username character varying(25) NOT NULL,
    password character varying(25) NOT NULL,
    userrole character varying(10) NOT NULL
);


ALTER TABLE public.crud_user OWNER TO api_user;

--
-- Data for Name: crud_library; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.crud_library (isbn, book_name, author_name) FROM stdin;
123456789123 	Harry Potter and the Prisoner of Azkaban	J.K. Rowling
234567891234 	How To Train Your Dragon	Cressida Cowell
\.


--
-- Data for Name: crud_user; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.crud_user (username, password, userrole) FROM stdin;
\.


--
-- Name: crud_library crud_library_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_library
    ADD CONSTRAINT crud_library_pkey PRIMARY KEY (isbn);


--
-- Name: crud_user crud_user_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_user
    ADD CONSTRAINT crud_user_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--