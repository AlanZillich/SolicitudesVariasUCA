--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2014-03-31 17:47:03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 177 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1987 (class 0 OID 0)
-- Dependencies: 177
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 24580)
-- Name: album; Type: TABLE; Schema: public; Owner: se2; Tablespace: 
--

CREATE TABLE album (
    id integer NOT NULL,
    artist character varying(100) NOT NULL,
    title character varying(100) NOT NULL
);


ALTER TABLE public.album OWNER TO se2;

--
-- TOC entry 170 (class 1259 OID 24578)
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: se2
--

CREATE SEQUENCE album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.album_id_seq OWNER TO se2;

--
-- TOC entry 1988 (class 0 OID 0)
-- Dependencies: 170
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: se2
--

ALTER SEQUENCE album_id_seq OWNED BY album.id;


--
-- TOC entry 173 (class 1259 OID 24588)
-- Name: user; Type: TABLE; Schema: public; Owner: se2; Tablespace: 
--

CREATE TABLE "user" (
    user_id integer NOT NULL,
    username character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    display_name character varying(50) DEFAULT NULL::character varying,
    password character varying(128) NOT NULL,
    state smallint
);


ALTER TABLE public."user" OWNER TO se2;

--
-- TOC entry 175 (class 1259 OID 24606)
-- Name: user_role; Type: TABLE; Schema: public; Owner: se2; Tablespace: 
--

CREATE TABLE user_role (
    id integer NOT NULL,
    role_id character varying(255) NOT NULL,
    is_default integer DEFAULT 0 NOT NULL,
    parent_id integer
);


ALTER TABLE public.user_role OWNER TO se2;

--
-- TOC entry 174 (class 1259 OID 24604)
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: se2
--

CREATE SEQUENCE user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_id_seq OWNER TO se2;

--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 174
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: se2
--

ALTER SEQUENCE user_role_id_seq OWNED BY user_role.id;


--
-- TOC entry 176 (class 1259 OID 24620)
-- Name: user_role_linker; Type: TABLE; Schema: public; Owner: se2; Tablespace: 
--

CREATE TABLE user_role_linker (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_role_linker OWNER TO se2;

--
-- TOC entry 172 (class 1259 OID 24586)
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: se2
--

CREATE SEQUENCE user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO se2;

--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 172
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: se2
--

ALTER SEQUENCE user_user_id_seq OWNED BY "user".user_id;


--
-- TOC entry 1840 (class 2604 OID 24583)
-- Name: id; Type: DEFAULT; Schema: public; Owner: se2
--

ALTER TABLE ONLY album ALTER COLUMN id SET DEFAULT nextval('album_id_seq'::regclass);


--
-- TOC entry 1841 (class 2604 OID 24591)
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: se2
--

ALTER TABLE ONLY "user" ALTER COLUMN user_id SET DEFAULT nextval('user_user_id_seq'::regclass);


--
-- TOC entry 1845 (class 2604 OID 24609)
-- Name: id; Type: DEFAULT; Schema: public; Owner: se2
--

ALTER TABLE ONLY user_role ALTER COLUMN id SET DEFAULT nextval('user_role_id_seq'::regclass);


--
-- TOC entry 1974 (class 0 OID 24580)
-- Dependencies: 171
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: se2
--

COPY album (id, artist, title) FROM stdin;
1	The  Military  Wives	In  My  Dreams
2	Adele	21
3	Bruce  Springsteen	Wrecking Ball (Deluxe)
4	Lana  Del  Rey	Born  To  Die
5	Gotye	Making  Mirrors
\.


--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 170
-- Name: album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: se2
--

SELECT pg_catalog.setval('album_id_seq', 6, true);


--
-- TOC entry 1976 (class 0 OID 24588)
-- Dependencies: 173
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: se2
--

COPY "user" (user_id, username, email, display_name, password, state) FROM stdin;
1	Azo	alanzillich@gmail.com	\N	$2y$14$IeR1YbXxMG4M80OrNz6WXuc.wog2/dlOujaK.BjAetuJVIRz/rhCm	\N
2	\N	asd@asd.com	\N	$2y$14$99eqrIbMLFxg2y6.BPYPHuf81mRBZBA8mrVYBTncYfnfyF1gVuSTW	\N
\.


--
-- TOC entry 1978 (class 0 OID 24606)
-- Dependencies: 175
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: se2
--

COPY user_role (id, role_id, is_default, parent_id) FROM stdin;
1	guest	1	\N
2	user	0	\N
3	admin	0	2
\.


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 174
-- Name: user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: se2
--

SELECT pg_catalog.setval('user_role_id_seq', 3, true);


--
-- TOC entry 1979 (class 0 OID 24620)
-- Dependencies: 176
-- Data for Name: user_role_linker; Type: TABLE DATA; Schema: public; Owner: se2
--

COPY user_role_linker (user_id, role_id) FROM stdin;
2	2
1	3
\.


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 172
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: se2
--

SELECT pg_catalog.setval('user_user_id_seq', 2, true);


--
-- TOC entry 1848 (class 2606 OID 24585)
-- Name: album_pkey; Type: CONSTRAINT; Schema: public; Owner: se2; Tablespace: 
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- TOC entry 1850 (class 2606 OID 24603)
-- Name: user_email_key; Type: CONSTRAINT; Schema: public; Owner: se2; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 1852 (class 2606 OID 24599)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: se2; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1862 (class 2606 OID 24624)
-- Name: user_role_linker_pkey; Type: CONSTRAINT; Schema: public; Owner: se2; Tablespace: 
--

ALTER TABLE ONLY user_role_linker
    ADD CONSTRAINT user_role_linker_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 1858 (class 2606 OID 24612)
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: se2; Tablespace: 
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 1854 (class 2606 OID 24601)
-- Name: user_username_key; Type: CONSTRAINT; Schema: public; Owner: se2; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 1855 (class 1259 OID 24619)
-- Name: idx_parent_id; Type: INDEX; Schema: public; Owner: se2; Tablespace: 
--

CREATE INDEX idx_parent_id ON user_role USING btree (parent_id);


--
-- TOC entry 1859 (class 1259 OID 24635)
-- Name: idx_role_id; Type: INDEX; Schema: public; Owner: se2; Tablespace: 
--

CREATE INDEX idx_role_id ON user_role_linker USING btree (role_id);


--
-- TOC entry 1860 (class 1259 OID 24636)
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: se2; Tablespace: 
--

CREATE INDEX idx_user_id ON user_role_linker USING btree (user_id);


--
-- TOC entry 1856 (class 1259 OID 24618)
-- Name: unique_role; Type: INDEX; Schema: public; Owner: se2; Tablespace: 
--

CREATE UNIQUE INDEX unique_role ON user_role USING btree (role_id);


--
-- TOC entry 1863 (class 2606 OID 24613)
-- Name: fk_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: se2
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk_parent_id FOREIGN KEY (parent_id) REFERENCES user_role(id) ON DELETE SET NULL;


--
-- TOC entry 1864 (class 2606 OID 24625)
-- Name: fk_role_id; Type: FK CONSTRAINT; Schema: public; Owner: se2
--

ALTER TABLE ONLY user_role_linker
    ADD CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES user_role(id) ON DELETE CASCADE;


--
-- TOC entry 1865 (class 2606 OID 24630)
-- Name: fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: se2
--

ALTER TABLE ONLY user_role_linker
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES "user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 1986 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: se2
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM se2;
GRANT ALL ON SCHEMA public TO se2;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-03-31 17:47:03

--
-- PostgreSQL database dump complete
--

