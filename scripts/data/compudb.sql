--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO compushowmaster;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO compushowmaster;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO compushowmaster;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO compushowmaster;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO compushowmaster;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO compushowmaster;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO compushowmaster;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO compushowmaster;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO compushowmaster;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO compushowmaster;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO compushowmaster;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO compushowmaster;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO compushowmaster;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO compushowmaster;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO compushowmaster;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO compushowmaster;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO compushowmaster;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO compushowmaster;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO compushowmaster;

--
-- Name: sistemaCS_categoria; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_categoria" (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_categoria" OWNER TO compushowmaster;

--
-- Name: sistemaCS_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_categoria_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_categoria_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_categoria_id_seq" OWNED BY "sistemaCS_categoria".id;


--
-- Name: sistemaCS_choice; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_choice" (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    votes integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE "sistemaCS_choice" OWNER TO compushowmaster;

--
-- Name: sistemaCS_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_choice_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_choice_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_choice_id_seq" OWNED BY "sistemaCS_choice".id;


--
-- Name: sistemaCS_imgnominacion; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_imgnominacion" (
    id integer NOT NULL,
    img character varying(200) NOT NULL,
    idcat_id integer NOT NULL,
    idnom_id integer NOT NULL
);


ALTER TABLE "sistemaCS_imgnominacion" OWNER TO compushowmaster;

--
-- Name: sistemaCS_imgnominacion_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_imgnominacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_imgnominacion_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_imgnominacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_imgnominacion_id_seq" OWNED BY "sistemaCS_imgnominacion".id;


--
-- Name: sistemaCS_nominacion; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_nominacion" (
    id integer NOT NULL,
    idcat_id integer NOT NULL,
    uid_id character varying(200) NOT NULL,
    unom_id character varying(200) NOT NULL,
    "desc" character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_nominacion" OWNER TO compushowmaster;

--
-- Name: sistemaCS_nominacion_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_nominacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_nominacion_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_nominacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_nominacion_id_seq" OWNED BY "sistemaCS_nominacion".id;


--
-- Name: sistemaCS_question; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_question" (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE "sistemaCS_question" OWNER TO compushowmaster;

--
-- Name: sistemaCS_question_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_question_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_question_id_seq" OWNED BY "sistemaCS_question".id;


--
-- Name: sistemaCS_usuario; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_usuario" (
    uid character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_usuario" OWNER TO compushowmaster;

--
-- Name: sistemaCS_voto; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_voto" (
    id integer NOT NULL,
    idcat_id integer NOT NULL,
    idnom_id integer NOT NULL,
    uid_id character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_voto" OWNER TO compushowmaster;

--
-- Name: sistemaCS_voto_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_voto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_voto_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_voto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_voto_id_seq" OWNED BY "sistemaCS_voto".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_categoria" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_categoria_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_choice" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_choice_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_imgnominacion" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_imgnominacion_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_nominacion_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_question" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_question_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_voto_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add question	7	add_question
20	Can change question	7	change_question
21	Can delete question	7	delete_question
22	Can add choice	8	add_choice
23	Can change choice	8	change_choice
24	Can delete choice	8	delete_choice
25	Can add categoria	9	add_categoria
26	Can change categoria	9	change_categoria
27	Can delete categoria	9	delete_categoria
28	Can add usuario	10	add_usuario
29	Can change usuario	10	change_usuario
30	Can delete usuario	10	delete_usuario
31	Can add nominacion	11	add_nominacion
32	Can change nominacion	11	change_nominacion
33	Can delete nominacion	11	delete_nominacion
34	Can add img nominacion	12	add_imgnominacion
35	Can change img nominacion	12	change_imgnominacion
36	Can delete img nominacion	12	delete_imgnominacion
37	Can add voto	13	add_voto
38	Can change voto	13	change_voto
39	Can delete voto	13	delete_voto
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$wMcEezYyMhQK$2aqH7euPJbJyHivs8OuQzAqOlO1Oux9Watu8luQ5mKA=	2016-06-01 02:17:52.86943-04	t	admin				t	t	2016-06-01 02:17:37.607389-04
2	pbkdf2_sha256$20000$Q7RerUHU261l$8SmaKBiPBGyTgjh+PI7Vw+aXK7LN6ZW3bmzs4f5Wct8=	2016-06-01 23:17:32.29926-04	t	admin2				t	t	2016-06-01 21:59:46.671865-04
4	pbkdf2_sha256$20000$GpPYlHxTBrEh$EVIyQF5OWgZAcjGw7QKEmbHWlx4YAkw0Z7RVBW8EqhE=	2016-06-02 00:30:17.850837-04	f	11-10683				f	t	2016-06-02 00:29:47.563261-04
3	pbkdf2_sha256$20000$wTKHQwO3DzIn$DKbEf/vx/I7W2EdvOamzqvFN/wA+C0RSnHuiVNEdaCY=	2016-06-02 00:41:06.691029-04	f	nabil				f	t	2016-06-02 00:27:35.412661-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-06-01 02:18:39.646498-04	1	adoptado	1		9	1
2	2016-06-01 02:19:46.160612-04	2	butt	1		9	1
3	2016-06-01 02:19:51.761119-04	3	cartoon	1		9	1
4	2016-06-01 02:19:57.270179-04	4	chancero	1		9	1
5	2016-06-01 02:20:02.15989-04	5	comadre	1		9	1
6	2016-06-01 02:20:07.446107-04	6	compadre	1		9	1
7	2016-06-01 02:20:10.084135-04	7	cono	1		9	1
8	2016-06-01 02:20:13.942259-04	8	cuaima	1		9	1
9	2016-06-01 02:20:17.293025-04	9	cuchio	1		9	1
10	2016-06-01 02:20:25.00219-04	9	cuchio	3		9	1
11	2016-06-01 02:20:31.174892-04	10	cuchi	1		9	1
12	2016-06-01 02:20:35.148982-04	11	falso	1		9	1
13	2016-06-01 02:20:38.860843-04	12	fitness	1		9	1
14	2016-06-01 02:20:42.044782-04	13	gordito	1		9	1
15	2016-06-01 02:20:45.957253-04	14	lolas	1		9	1
16	2016-06-01 02:20:48.597738-04	15	love	1		9	1
17	2016-06-01 02:20:51.268951-04	16	mami	1		9	1
18	2016-06-01 02:20:54.076798-04	17	master	1		9	1
19	2016-06-01 02:20:56.588722-04	18	papi	1		9	1
20	2016-06-01 02:20:59.244717-04	19	pro	1		9	1
21	2016-06-01 02:21:02.612414-04	20	productista	1		9	1
22	2016-06-01 02:21:04.909128-04	21	team	1		9	1
23	2016-06-01 02:51:07.015648-04	11-10683	11-10683	1		10	1
24	2016-06-01 02:52:26.268392-04	3	3	1		11	1
25	2016-06-01 02:52:44.0878-04	3	3	3		11	1
26	2016-06-01 02:54:31.466764-04	4	<Usuario: 11-10683>-><Usuario: 11-10683>( <Categoria: adoptado> )	1		11	1
27	2016-06-01 02:55:00.576858-04	4	<Usuario: 11-10683>=><Usuario: 11-10683>( <Categoria: adoptado> )	3		11	1
28	2016-06-01 22:01:15.923878-04	11-10683	11-10683	3		10	2
29	2016-06-01 22:03:33.183872-04	06-85155	06-85155	3		10	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 29, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sistemaCS	question
8	sistemaCS	choice
9	sistemaCS	categoria
10	sistemaCS	usuario
11	sistemaCS	nominacion
12	sistemaCS	imgnominacion
13	sistemaCS	voto
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-06-01 00:39:36.713747-04
2	auth	0001_initial	2016-06-01 00:39:37.555819-04
3	admin	0001_initial	2016-06-01 00:39:37.780993-04
4	contenttypes	0002_remove_content_type_name	2016-06-01 00:39:37.882479-04
5	auth	0002_alter_permission_name_max_length	2016-06-01 00:39:37.976068-04
6	auth	0003_alter_user_email_max_length	2016-06-01 00:39:38.06931-04
7	auth	0004_alter_user_username_opts	2016-06-01 00:39:38.099196-04
8	auth	0005_alter_user_last_login_null	2016-06-01 00:39:38.152557-04
9	auth	0006_require_contenttypes_0002	2016-06-01 00:39:38.173397-04
10	sessions	0001_initial	2016-06-01 00:39:38.354012-04
11	sistemaCS	0001_initial	2016-06-01 00:39:38.50324-04
12	sistemaCS	0002_categoria	2016-06-01 02:16:00.256258-04
13	sistemaCS	0003_auto_20160601_0649	2016-06-01 02:49:52.462307-04
14	sistemaCS	0004_nominacion_desc	2016-06-01 22:01:03.960639-04
15	sistemaCS	0005_auto_20160601_1316	2016-06-01 22:01:04.053276-04
16	sistemaCS	0006_usuario_name	2016-06-01 22:01:04.274385-04
17	sistemaCS	0007_remove_usuario_carnet	2016-06-01 22:01:04.317498-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
235ysw21z6x4t84ka010jk2wgrs8zr2e	Njc0MTFiZThhZjE5MDYwY2UwZjU2OTIyYjM3MmM5NDk4OTZlZTA4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlMDgyNWMxZmM1MWE5OTA5OTJlNzM1NjVhNjNmM2NjMGIzM2I3NzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-06-15 02:17:52.89139-04
\.


--
-- Data for Name: sistemaCS_categoria; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_categoria" (id, nombre) FROM stdin;
1	adoptado
2	butt
3	cartoon
4	chancero
5	comadre
6	compadre
7	cono
8	cuaima
10	cuchi
11	falso
12	fitness
13	gordito
14	lolas
15	love
16	mami
17	master
18	papi
19	pro
20	productista
21	team
\.


--
-- Name: sistemaCS_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_categoria_id_seq"', 21, true);


--
-- Data for Name: sistemaCS_choice; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_choice" (id, choice_text, votes, question_id) FROM stdin;
\.


--
-- Name: sistemaCS_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_choice_id_seq"', 1, false);


--
-- Data for Name: sistemaCS_imgnominacion; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_imgnominacion" (id, img, idcat_id, idnom_id) FROM stdin;
\.


--
-- Name: sistemaCS_imgnominacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_imgnominacion_id_seq"', 1, false);


--
-- Data for Name: sistemaCS_nominacion; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_nominacion" (id, idcat_id, uid_id, unom_id, "desc") FROM stdin;
\.


--
-- Name: sistemaCS_nominacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_nominacion_id_seq"', 4, true);


--
-- Data for Name: sistemaCS_question; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_question" (id, question_text, pub_date) FROM stdin;
\.


--
-- Name: sistemaCS_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_question_id_seq"', 1, false);


--
-- Data for Name: sistemaCS_usuario; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_usuario" (uid, password, name) FROM stdin;
06-85155		Jesus Campos
06-85521		Gustavo Lopez
07-85716		Alfredo Jose Regalado
07-85717		Reny Alvarado Riera
07-85718		Carlos Andres Escobar Gonzalez
07-85846		Josue Ramirez
07-86021		Yelitza J. Perez
07-86222		Aquiles Alejandro Barreto Marcano
07-86256		Blanca Lucila Guillen Vera
08-86500		Janett Auxiliadora Mora de Torre
08-86530		Andrius Cristian Morganti Montilla
08-86563		Jesus Herrera Machado
08-86565		Miguel Angel Palomino Hawasly
08-86645		Mercedes Adelina Martinez Delgado
08-86857		Javier Jose Jaramillo
08-86886		Jorge L. Plaza Rojas
09-86979		Juan Antonio Danilow Fragachan
09-86981		Alberto Mariño Gobbi Trujillo
09-87117		Julio C. Castillo Bueno
09-87235		Pedro Luis Villalba Felce
10-10534		n
13-89388		Marcos Grillo
14-89540		Saul Samir Hidalgo Aular
aalonso		Alfonso Alonso Lopez
abadmota		Soraya Abad Mota
abaranya		Alexander
abianc		Adelaide Bianchini
aborges		Ana Maria Borges Peña
adelgado		Alexis Delgado
adiserio		Angela Di Serio Iuorno
adolfo		LDC - Jesus Parra
aflores		n
afrancisco		Francisco Alirio Chacon
alacruz		Alexandra La Cruz
alan		LDC - Alan Mizrahi
alfonso		LDC - Alfonso Ros
alvaro		LDC - Alvaro E. Carvajal D.
ancelmo		Sinuhe Antonio Ancelmo Figueroa
andrea		Andrea Victoria Centeno Lopez
angelica		Angelica Berrocal
anibal		LDC - Cesar Anibal Castillo
arellano		Diana D Arellano Tavara
arismendi		Juan Carlos Arismendi
arraiz		Emely Arraiz B.
arratia		Argimiro Alejandro Arratia Quesada
aruperez		Armando Ruperez
asoriano		Prof. Amelia Soriano
astorga		Luis Astorga Junquera
augusto		Augusto Guillermo Hidalgo Bravo
bac		n
barenco		Claudia Barenco Abbas
berry		Thomas Berry
bonet		Blai Tirant Bonet Bretto
borges		Pedro Ramon Borges Carreño
caperez		Carlos A Perez Diaz
carlos		LDC - Carlos Eduardo Cardenas
carmine		LDC - Carmine Di Biase Cardone
carrasquel		Soraya Carrasquel
castillo		Carlos Castillo
cchang		Carolina Chang Tovar
cgomez		Carlos E Gomez Chacon
ci		n
ciro		LDC - Ciro Duran
claudia		Claudia Evelyn Gonzalez Valiente
clollett		Catherine Elena Lollett Paraponiaris
cpc		Coordinacion de Pregrado de Computacion
crodrig		Carmen R. Rodriguez C.
csavignano		Carlos A Savignano Vielma
cueto		LDC - Cueto Yohandry
damost		LDC - Daniel Mostacero
daniela		LDC - Daniela A. Torres
dcoronado		David Coronado
dmartinez		Domingo Martinez
domingo		Domingo Enrique
donato		Donato Antonio
drocha		Darwin Rocha
dzaragoza		David Zaragoza Rodriguez
ebroner		Edgardo Raul Broner
eduardo		Eduardo Antonio Blanco Padron
eduroam		Eduardo Roa
edward		LDC - Edward Zambrano
El		LDC - Ernesto Leal
eleal		Eleazar Enrique Leal Gonzalez
emhn		Ernesto Miguel Hernandez Novich
emilio		Emilio Fernando Hernandez Gonzalez
enrique		Enrique Antonio Iglesias Vidal
eosuna		Edgar Osuna
epablo		LDC - Pablo Endres Lozada
erika		LDC - Erika R. Azabache Pazos
eruiz		Eduardo Ruiz
esaulgd		Enrique Saul Gonzalez Di Totto
export		n
fabricio		LDC - Fabricio Jimenez
fgil		Fidel Espartaco Gil Garcia
figueira		Carlos Figueira
fopa		FOPA
franc		LDC - Francisco Caballero
francisco		LDC - Francisco Morillo
frank		Frank Stephan
ftorre		Fernando Gustavo Torre chalbaud
gabro		Gabriela Ochoa
gache		Gerardo Alberto Ache Ache
gallego		Alberto Marin
gaspar		Gaspar Daniel Herman Sandoval
gboloix		Germinal Boloix
gescuela		Gabi Escuela
gkufatty		Genesis del Valle Kufatty Anton
gmontoya		Gabriela V Montoya Castillo
gpalma		Guillermo V. Palma Navarrete
gsader		Gonzalo Jose Sader Gonzalez
gustavo		LDC - Gustavo El Khoury
hcastro		Hilmar Lorena Castro Moron
hector		Hector Alberto Geffner
hgoncalves		LDC - Hector Goncalves
hlp		Hector Luis Palacios V.
ibanez		Maria Blanca Ibañez Espiga
idaniel		Daniel Izquierdo
ioanis		LDC - Ioanis Biternas
ipio		n
isaac		Isaac Albenis Gonzalez Valiente
jackney		Jackney Alba Andrade
jairo		LDC - Jairo Eduardo Lopez
javier		LDC - Javier Arguello
jbaralt		Jorge Baralt Torrijos
jcastillo		Julio Castillo
jdaniel		LDC - Daniel J. Campello
jdeoliveira		Jesus De Oliveira
jdsantos		Jennifer Dos Santos
jefe		Jefe del Laboratorio Docente de Computacion
jegd		Jorge E Guerra Delgado
jferrer		Jose Jesus Ferrer Suarez
jfigueroa		Johanna Figueroa
jguzman		Jean Carlos Guzman
jorge		Jorge Jesus Correia Acevedo
jose		LDC - Jose L. Lo Huang
jpg		Jorge Elieser Palacios Garrido
jravelo		Jesus Nicolas Ravelo
jrjimenez		Juan Ramon Jimenez
jtcadenas		Jose Tomas Cadenas Lucero
khernandez		Karen Yolanda Hernandez de Garcia
kjalvarez		Kity Alvarez
krys		LDC - Krysler Pinto
lbravo		Lelys Isaura Bravo de Guenni
ldc		n
ldcprojects		Proyectos LDC
lem		LDC - Luis E. Mun~oz
leonid		Leonid Tineo Rodriguez
lfernandes		LDC - Luis Fernandes
lgutierrez		Lein Gutierrez
lias		Alexsey Lias Rodriguez
llandaeta		Luis Landaeta
lmauro		Leopoldo Mauro Collaoni
lramos		Luis Ramos
luigi		LDC - Luigi Giannandrea
luis		LDC - Luis Berbin
luism		Luis Manuel
macosta		Maribel Acosta Deibe
manrique		Jorge Manrique
manuel		LDC - Manuel Picone
marco		LDC - Marco Del Vecchio
marielba		Marielba Rojas
marisela		Marisela Andrea del Valle Morillo
martinez		Ivette Carolina Martinez Tellez
mathias		Mathias Alejandro San Miguel Lopez
mcardenas		Marelis A Cardenas B
mcastro		Miguel Angel Castro
mcuriel		Mariela Josefina Curiel Huerfano
meier		Andreas Meier
mestevez		Mirla I. Estevez Gonzalez
meza		Oscar Jose Meza Houtteman
mfernandez		Margarita Fernandez Chas
mgoncalves		Marlene Goncalves Da Silva
michelle		LDC - Michelle Fernandez
micky		LDC - Michele Bellino
miguel		LDC - Miguel Landaeta
mjose		Jose
mnabhan		Masun Nabhan Homsi
mof		Maria de Lourdes Ortega Febres
moises		LDC - Moises Castellanos
morales		Mireya Morales
mosquera		Diego Mosquera Uzcategui
mperez		Maria Mercedes Perez Machirant
mruiz		Maria Antonieta Ruiz B.
mvidal		Maria Ester Vidal Serodio
nabil		Nabil Jesus
nataly		Nataly Montezuma
ncardenas		Nelson Cardenas
nmarquez		Natalia Adriana Marquez Martinez
nunzio		Nunzio Savino Vasquez
nviloria		Ninoska Carolina Viloria Materano
ojeda		David Ojeda Avellaneda
olivo		Oswaldo Luis Olivo Mazzei
olunac		Orlando
pablo		LDC - Pablo Teran
pablodbc		Pablo Dario Betancourt Castro
paul		Paul Javier
pedro		LDC - Pedro J. Rincon
pgarcia		Pedro Jesus Garcia Tortolero
vsirvent		Victor Sirvent Espallargas
vtheok		Victor Simon Theoktisto Costa
wendi		Urribarri S Wendi C
wpereira		Wilmer Efren Pereira Gonzalez
xiomara		Xiomara J. Contreras
yadira		Yadira Munoz Lanz
yarvelo		Yolife Josefina Arvelo Noriega
yriarte		Vicente Yriarte
yudith		Yudith Cardinale
zoltan		Ana Cristina Zoltan de Torres
zulay		Zulay Rodriguez Montilla
00-32512		Luis Eduardo Alvarez Azarak
00-32532		Maria Esther Aragues Gonzalez
00-32539		Abraham Francisco Arellano Tavara
00-32608		Juan Jose Bustamante Torrealba
00-32611		Martha A. Cabrera Quijada
00-32644		Rafael Gabriel Casella Medina
00-32658		Teresita Cerdeira Carreira
00-32669		Luisana Chavez Keri
00-32731		Jorge Daniel Dias Martinez
00-32735		Ramon Eduardo Diaz Sfeir
00-32756		Barbara Espinoza Becerra
00-32766		Milagro Ileana Feijoo Peña
00-32780		Israel Feuerberg Colmenares
00-32845		Gustavo Adolfo Gonzalez Briceño
00-32857		Maximiliano Gonzalez Perez
00-32895		Carlos Alberto Henriquez Quintana
00-32908		Adriana Hernandez Ott
07-40804		Giovanna Maria Daza Hernandez
07-40812		Roberto Alejandro De La Rosa Fernandez
07-40813		Manuel Enrique de la Rosa Gimeno
07-40817		Rene Vicente de Valery Fiorito
07-40819		Monica Mercedes del Rio Rodriguez
07-40831		Maria del Pilar Di Martino Perez
07-40845		Erick Gildo Dos Ramos Yanez
07-40851		Gabriel A. Duran Klie
07-40855		Omar Ali El Assaad El Assaad
07-40884		Wileska Fermin Cesin
07-40888		Kelwin A. Fernandez Correia
07-40895		Katherine Susan Ferreira Pinto
07-40897		Andres Eduardo Ferrero Romero
07-40902		Edgar Giovanni Fiol Locantore
07-40913		Angel Roso Franco Carvajal
07-40915		Cesar Enrique Freitas de Freitas
07-40919		Carlos Alberto Gabidia Garcia
07-40926		Cesar Eduardo Garban Garcia
07-40930		Victor M. Garcia Aguilera
07-40942		Alejandro Jose Garcia Tovar
07-40944		Gabriela Garrido de Sousa
07-40947		Joseph Gaschteff Perez
07-40951		Ezequiel Elias Gimenez Perez
07-40967		David Enrique Gonzalez Bautista
07-40979		Johan Isaias Gonzalez Leal
07-40983		Hancel Lyrae Gonzalez Peña
07-40984		Federico Andres Gonzalez Peñuela
07-41010		Pedro Alejandro Gutierrez Gherbaz
07-41014		Leonardo Javier Guzman Duran
07-41018		Stefano Halabi Banchi
07-41024		Andreina Beatriz Henriquez Quintana
07-41038		Veronica del V. Hernandez Quijada
07-41045		Luis Carlos Herrero Correa
07-41046		Estefania Hidalgo Di Miele
07-41051		Carlos Alberto Huga Labarca
07-41054		Jose Luis Iglesias Moreno
07-41055		Lennon e. Infante Paez
07-41057		Nellybett Andrea Irahola Ramirez
07-41063		Maria Isabel Jilo Ghazal
07-41077		Maria Gabriela Labastidas Avila
07-41078		Gianfranco Jose Lacedre Ricciardi
07-41080		Wai Jack Lam Cardenas
07-41087		Maria Francys Lanza Garcia
07-41090		Rafael Ramon Las Cedeño
07-41092		Tony Enrique Lattke Urbaneja
07-41093		Nicola A. Lavermicocca Monaco
07-41100		Juan Marcos Leon Hernandez
07-41101		Fravier Jose Leon Quintero
07-41102		Wai M. Leung Ng
07-41104		Jose Gregorio Lezama Gonzalez
07-41106		Danny Leonel Lima Pepe
07-41107		Franklin Jesus Adrian Lira Rocca
07-41109		Lucia Mariana Lo Monaco Barazarte
07-41112		Terry Anderson Lobo Vegas
07-41120		Isaac Esteban Lopez Procopio
07-41125		Maria Andreina Loriente Caiazzo
07-41126		Fernando Andres Lovera Torres
07-41130		Erwin Fabian Lucero Guerrero
07-41135		Jorge Isaac Lujan Useche
07-41136		Gabriel Jesus Luque Di Donna
07-41138		Alejandro MacHado Gonzalez
07-41141		Yuleika C Madriz Diaz
07-41142		Eduardo Antonio Magallanes Tovar
07-41150		Nestor Roman Manrique Cruz
07-41154		Andreina del Va Marcano Zambrano
07-41157		Gabriel Enrique Marquez Bravo
07-41174		Maria Alejandra Martini Goncalves
07-41177		Daniel Enrique Mata Flores
07-41180		Carlos Arturo Medina
07-41185		Nelson e. Medina Mago
07-41189		Nestor Jose Medina Rivas
07-41198		Jaidibeth A. Melo Chirinos
07-41202		Jesus Eduardo Mendez Hernandez
07-41205		Mijalis Alexandros Mendiz Pazos
07-41206		Brian-marcial Mendoza Bollam
07-41210		Guillermo Arturo Mendoza Oropeza
07-41217		Daniel David Mezzana Palacios
07-41228		Juan Antonio Molina Ruiz
07-41238		Saskya Raquel Mora Di Battista
07-41239		Naileth Loreisy Mora Rosales
07-41242		Javier Alejandro Morales Delgado
07-41249		Jonathan J. Moreno Correa
07-41253		Audry Vanessa Morillo Muñoz
07-41260		Anselmo Jose Muñoz Medina
07-41268		Luis Alejandro Navarro Mollejas
07-41275		Dianak Carolina Niño Silverio
07-41279		Marilyn Nowacka Barros
07-41286		Charles Helliot Ochoa Pastran
07-41291		Alejandro Jose Olivares Rivero
07-41295		Narbelys Catterin Oropeza Rodriguez
07-41300		Frank Ernesto Ovalles Moreno
07-41302		Maria Leonor Pacheco Gonzalez
07-41311		Alvaro Jesus Parada Gamboa
07-41312		Maria Antonietta Parejo Bellorin
07-41324		Andres Eduardo Pereira Alvarez
07-41327		Marino Esteban Perez Batista
07-41328		Maria Alejandra Perez Bullones
07-41329		Dennis Esteban Perez Camacho
07-41330		Oliver Alejandro Perez Camargo
07-41331		Harold Jose Perez Carta
07-41340		Jose Alejandro Perez Pirela
07-41345		Mike Pesate Temprano
07-41349		Francis Daisyre Peña Fajardo
07-41353		Pio Daniel Peña Reinoza
07-41358		Victoria Pimentel Guerra
07-41362		Abelardo Agustin Pinedo Camacho
07-41367		Luis Alejandro Pirona Koster
07-41370		Emily Carolina Piñero Arreaza
07-41372		Fernando Luis Plaz Rivero
07-41378		Aldo Fabrizio Porco Rametta
07-41384		Alejandra Alheli Preciado Llanos
07-41388		Fatima A. Querales Valero
07-41391		Alejandro I. Quiaro Sandoval
07-41396		Christian Alexander Quintero Casares
07-41404		Stefani Carolina Ramirez Ramos
07-41408		Melvin David Ramos MacIas
07-41416		Monica Yannina Rasquin Contreras
07-41419		Dayanna C. Rebolledo Ambrazevicius
07-41420		Fabiana Eloisa Reggio Gallen
07-41423		Saymar Milagros Reina Mayora
07-41428		Maria Bethania Retamal Escobedo
07-41429		Athenea Helena Retegui Hernandez
07-41431		Jon Ander Ricchiutti Urresti
07-41432		Rene David Rico Escalante
07-41439		Andrea Gabriela Roballo Asuaje
07-41451		Roberto Xulio Rodriguez Devesa
07-41468		Manuel Alfonso Rodriguez Porras
07-41469		Vanessa Carolina Rodriguez Rahal
07-41470		Jose Angel Rodriguez Ramos
07-41475		Daniel Alejandro Rodriguez Tinoco
07-41502		Juan V. Rosas Ramirez
07-41503		Tomas Arnaldo Rosello Lira
07-41510		Frank Jose Sandoval Angulo
07-41512		Reinaldo Jose Sabbagh MacIel
07-41514		Giorgio Enrique Saez Dezi
07-41518		Maria Carolina Salas Moran
07-41524		Gabriel Enrique Sanabria Castro
07-41537		Luis Miguel Sanchez Sequera
07-41552		Manuel Arturo Sevilla Salazar
07-41556		Andres Alberto Sifontes Rodriguez
07-41571		Luis Eduardo Sotillo Aguiar
07-41572		Javier Enrique Sotillo Barrios
07-41573		Alejandro Alberto Soto Martin
07-41582		David Alejandro Subero Oberto
07-41586		Carlos Daniel Tabares Giraldo
07-41589		Freddy Alejandro Teixeira Gomes
07-41591		Carlos Eduardo Timaury Moreno
07-41595		Ricardo Adolfo Toro Hernandez
07-41599		Yhordelys y. Torres Banda
07-41604		Alexander Daniel Tough Guardia
07-41612		Christian Alexander Urbina de Miguel
07-41618		Diana Karina Vainberg Gauna
07-41622		Ligmar Nakary Valdivieso Vera
07-41629		Krisvely Coromoto Varela Verrilli
07-41639		Levi Noel Velazquez Mulato
07-41651		Luis Alejandro Vieira Zambrano
07-41652		Ileana Lorena Viejo Sanz
07-41654		Nilver Fernando Viera Araujo
07-41655		Saddam Jose Viera Torres
07-41664		Ricardo Alberto Virguez Delepiani
07-41672		Andreina Simonett Wilhelm Garcia
07-41675		Diego Alejandro Zambrano Gonzalez
07-41685		Jose Gregorio Zapata Urdaneta
07-41703		Nathalia Andrea Hernandez Benavides
07-41706		Vanderson Enrique Lozano Guerra
07-41708		Gustavo Adolfo Marin Martinez
07-41709		Aarom Sax Cephas Oporte Anca
07-41711		Arturo Abraham Rivas Silva
07-41722		Fabio Jose la Russa Rivera
07-41725		Daniel Fernando Valera del Pino
07-41778		Elena Nuñez Malledo
07-41782		Carlos Daniel Michinel Salazar
07-41797		Wuidiana Gabriela Ramos Azuaje
07-41801		Ayanim Josefina Oropeza Rondon
07-41811		Hemmder Gabriel Alvarez Mijares
07-41821		Ricardo Alejandro Djabayan Rodriguez
07-41869		Jeannette de los Angeles Valiente Muñoz
07-41876		Azahel Javier Gamez Guillen
07-41877		Johan Mireles Muñoz
08-10281		Paulo Fabrizio de Andrade Pincolini
08-10285		Rui Andres de Freitas Rodriguez
08-10287		Susana Eloisa de Frutos Griman
08-10301		Erik Carlos Dell Salas
08-10304		Genesis Carolina Delnardo Salas
08-10312		Angel Omar Diaz MacIas
08-10320		Alexandre Dominguez Miguez
08-10323		Jennifer Dos Reis de Nobrega
08-10332		Yahir Andres Eljuri Risquez
08-10333		Georgina Aniroc Elorza Delgado
08-10337		Luis Alejandro Esparragoza Sanchez
08-10343		Norman Alejandro Ettedgui Anselmi
08-10346		Nelary Del Valle Farias Rodriguez
08-10347		Beatriz Elena Margarita Faundes Pinos
08-10350		Arturo Jose Feiteira Figueira
08-10353		Andres Eduardo Fernandes Quilelli
08-10358		Julio Cesar Fernandez Merino
08-10359		Cesar Eduardo Fernandez Rios
08-10361		Anibal Jose Fernandez Rojas
08-10371		Niuroska Andreina Filardi Vera
08-10383		Gabriel Alejandro Freites Melero
08-10386		Jesyca Cecilia Fuenmayor Bello
08-10388		Genesis Antonieta Fuentes Casella
08-10392		Wendy Leslie Galarza Torres
08-10398		Alejandro Jose Garbi Moya
08-10405		Vanessa Andreina Garcia Diaz
08-10406		Andreina del Carmen Garcia Figueira
08-10408		Jorge Rafael Garcia Gonzalez
08-10412		Laura Cristina Garcia Mayo
08-10413		Julio Cesar Garcia Medina
08-10421		Alejandro Jose Garcia Romero
08-10423		Jonathan Enrique Garcia Silveira
08-10432		Daniele Augusto Gigante Bianchini
08-10433		Luis Alberto Gil
08-10436		Esau del Jesus Gil Prado
08-10437		Grace Alexandra Gimon Betancourt
08-10438		Humberto Jose Giordano Garcia
08-10439		Massimiliano Roberto Giuffrida Caputo
08-10440		Oriana Giuliante Di Gregorio
08-10441		Aldo Giustiniano Guardia
08-10443		Andres Alexander Gollini Peraza
08-10444		Rodrigo Miguel Gomez
08-10445		Santiago Domingo Gomez Leal
08-10448		Adriana Carolina Gomez Carrillo
08-10451		Carlos Enrique Gomez Papotto
08-10455		Jose Alberto Goncalves Da Silva
08-10462		Betzabeth Carolina Gonzalez Canonico
08-10463		Leopoldo Jesus Gonzalez Clarembaux
08-10464		Fernando Antonio Gonzalez Dulanto
08-10468		Jessyca Alexandra de Jesus Gonzalez Martinez
08-10471		Gabriela Margarita Gonzalez Panzarelli
08-10476		Eduardo David Gonzalez Salazar
08-10478		Adriana Josefina Gordon Ferrebus
08-10479		David Enrique Goudet Diaz
08-10488		Alejandro Efrain Guardia Hasenauer
08-10494		Andreina Emperatriz Guerra Luque
08-10507		Andrea Valentina Guillermo Cruz
08-10513		Roberto Antonio Gutierrez Moy
08-10515		Andras Albert Gyomrey Leal
08-10519		Roshanak Hannani Delgado
08-10533		Alejandro David Hernandez Gonzalez
08-10534		Sandy Pahola Hernandez Guerrero
08-10539		Jesus Enrique Hernandez Moya
08-10546		Jorge Luis Hernandez Villapol
08-10548		Marinar del Valle Hevia Parra
08-10551		Alejandro Hitti Ratino
08-10553		Carlo Iavarone Verde
08-10557		Alfredo Daniel Irahola Ramirez
08-10558		Maria Valentina Iribarne Requeira
08-10560		Irene Isabella Di Marcoberardino
08-10564		Diego Esteban Jaimes Parilli
08-10569		Ronel Antonio Jimenez Espinoza
08-10571		Jose Francisco Jimenez Hernandez
08-10574		Benjamin Ven Chiu Joa Li
08-10577		Shant Kajian Samgochian
08-10579		Andres Enrique Klopp Nowacka
08-10580		Michelle Catherine Kratohvil Miranda
08-10581		Michelle Alexandra Kristek Kristek
08-10586		Simon Roberto Lampo Capriles
08-10588		Edwar Jesus Enrique Landaeta Casanova
08-10589		Luis Alfredo Landaeta Espinoza
08-10590		Ysmaldo Jose Landaez Garcia
08-10595		Francis Lorena Larreal Herrera
08-10596		Giuli Antonieta Latella Ardizzone
08-10598		Ray Alejandro Lattarulo Arias
08-10600		Marie Andreina Lebon Gonzalez
08-10601		Carlos Alberto Ledezma Rondon
08-10602		Carlos Guillermo Ledezma Rondon
08-10607		Diego Alejandro Leon Maldonado
08-10608		Juliana Leon Quinteiro
08-10611		German Alejandro Leon Zapata
08-10616		Ricardo Francisco Lira Quintero
08-10618		Juan Guillermo Livinalli Jaimes
08-10621		Manuel Alejandro Lobete Pirela
08-10622		Daniel Enrique Lobo Perez
08-10625		Andres Adolfo Lon Ng
08-10631		Daniel Alejandro Lopez Luis
08-10633		Carlos Antonio Lopez Ramirez
08-10634		Rodolfo Alberto Lopez Saldivia
08-10638		Miguel Angel Lopez-torres Stadler
08-10641		Yoneidis Yubisay Loroño
08-10644		Jiu Yu Christopher Low Gonzalez
08-10655		Ricardo Enmanuel Lunar Fuentes
08-10656		Alfredo Enrique Lunar Silva
08-10658		Gabriel Leonardo MacHado Acosta
08-10667		Daniel Alejandro Mallcott Alvarez
08-10671		Luis Alejandro Manzanilla Africano
08-10672		Octavio Jesus Manzano Marano
08-10682		Catherine Alejandra Marques de Lucia
08-10686		Mayerlin del Carmen Marquez Nieves
08-10687		Alexis Alejandro Marquez Orellana
08-10689		Leonardo Enrique Marquez Silva
08-10694		Eduardo Andres Martinez Firgau
08-10695		Jose Vidal Martinez Franquis
08-10697		Gabriela Andreina Martinez Leo
08-10699		Fabiana Martinez Martinez
08-10704		Jesus Armando Martinez Vargas
08-10706		Maria Antonia Marturet Rios
08-10708		Abdalah Masrie Adoumich
08-10709		Ernesto David Mata Ubieda
08-10710		Genesis Osmarit Matehus Carrero
08-10712		Jorge Luis Matheus Fernandez
08-10722		Agustin Ignacio Medrano Navarro
08-10729		Jonathan Mauricio Melian Mizrahi
08-10734		Jose Noel Mendoza Bastidas
08-10738		Brahyam Steffano Meneses Moreno
08-10743		Oscar Enrique Mezones Camacho
08-10758		Karla Sthephanie Mongrell Uribe
08-10762		Daniel Arturo Montenegro Diaz
08-10763		Mariana Nazareth Montenegro Gonzalez
08-10770		Bernardo Jose Morales Gonzalez
08-10774		Miguel Arturo Moreno Mago
08-10785		Aquiles Jose Moya Riera
08-10787		Alejandro David Muino Lazarde
08-10789		Walter Antonio Muñoz Valery
08-10790		Arturo Miguel Murillo Paez
08-10792		Carla Nardone Gonzalez
08-10793		Jean Marcel Nava Avendaño
08-10796		Daniela Soleys Navas Jimenez
08-10798		Estephany Niño Diaz
08-10801		Franco Gabriel Nori Gonzalez
08-10802		Alejandro Nunes Esteves
08-10804		Andel Nuñez Michelena
08-10805		Andres Alejandro Nuñez Raymond
08-10810		Jose Alejandro Olivar Mata
08-10811		Oscar Guillermo Olivares Diaz
08-10812		Mariangel Olivieri Cervilla
08-10813		Mary Esther Ontiveros Gonzalez
08-10819		Carina Ortega Ramirez
08-10820		Danny Jesus Ortega Zambrano
08-10843		Oscar Enrique Parra Pocaterra
08-10844		Madeleine Parra Rojas
08-10845		Adriana Zuray Amanda Parra Saavedra
08-10848		Migdelys Karina Pena Chirinos
08-10852		Roso Antonio Peñaranda Peñaranda
08-10860		Geraldine Andrea de Jesus Pereira Guerra
08-10873		Alejandro Armando Isaias Pernia Duran
08-10874		Marjorie Pestana Meignen
08-10876		Miguel Pignataro Falletta
08-10881		Aquilino Enrique Pinto Andrades
08-10883		Eliana Carolina Pinto Gonzalez
08-10884		Henderson Gabriel Pinto Guerrero
08-10885		Diego Isaac Piñate Martinez
08-10888		Gregory Fernando Pita Goncalves
08-10889		Domelisa Pita Romao
08-10893		Jose Antonio Ponte Zambrano
08-10898		Lucila Isabel Prieto Martinez
08-10899		David Enrique Prieto Melendez
08-10909		Adrian Jose Quintero Rodriguez
08-10910		Natacha Andrea Quintero Vallejos
08-10911		Carlos Manuel Quinteros Remolina
08-10913		Johnny Jesus Ramirez Codallo
08-10914		Yeraldin Esthefany Ramirez Delgado
08-10916		Jose Guillermo Ramirez Loaiza
08-10918		Maria Jose Ramos Belisario
08-10919		Leydi Nathaly Ramos MacIas
08-10921		Leonardo Rafael Ramos Thomas
08-10924		Francisco Javier Rangel Gutierrez
08-10925		Alfonso Jose Rangel Varela
08-10926		Ivette Adriana Reina Perez
08-10934		Tomas Aldahir Reyes Rojas
08-10938		Roseling Celeste Rivas Hernandez
08-10948		Paola Alexandra Rodrigues Ferreira
08-10949		Andres Esteban Rodriguez Alvarez
08-10950		Arnaldo Antonio Rodriguez Arocha
08-10953		Gabriel Jose Rodriguez Contreras
08-10957		Rosa Carolina Rodriguez Garces
08-10958		Andrea Virginia Rodriguez Gonzalez
08-10959		Osmar Rafael Rodriguez Gutierrez
08-10964		Paola Delia Rodriguez Masiu
08-10965		Ernesto Alejandro Rodriguez Morales
08-10968		Jogre Alexandra Rodriguez Pamphil
08-10969		Jose Mauricio Rodriguez Pineda
08-10971		Jose Antonio Rodriguez Pomenta
08-10972		Hector Oswaldo Rodriguez Revete
08-10974		Mariana Teresa Rodriguez Ruiz
08-10976		Any Isabel Rodriguez Yanez
08-10979		Oriana Roig Cogorno
08-10982		Daniel Alejandro Rojas Di Egidio
08-10987		Alfredo Alejandro Rojas Prado
08-10988		Marielis del Valle Rojas Romero
08-10989		Jesus Enrique Rojas Velasquez
08-10992		Pedro Antonio Romero de Abreu
08-10997		Jhasua Sananda Romero Rosales
08-11003		Isaac Jacobo Rondon Sosa
08-11004		Raul Daniel Rondon Uzcategui
08-11005		Ricardo Rosa Delgado
08-11008		Andrea Carolina Rotundo Arbelaez
08-11011		Angello Jose Rubio Cogollo
08-11018		Juan Pablo Ruiz Nacero
08-11021		Gabriel Alejandro Russo
08-11023		Maria Jose Saavedra Acosta
08-11027		Fernando Andres Sahmkow Beicos
08-11028		Nairelys Zulibeth Salas Fermin
08-11029		Marisela Andreina Salas Hernandez
08-11031		Andreth Rafael Salazar Garofalo
08-11034		Carlos Adrian Sanabria Veitia
08-11035		Estefanny Jose Sanchez Bergoderi
08-11039		Maria Alejandra Sanchez Marin
08-11041		Andres Alberto Sanchez Ramos
08-11043		Ricardo Arturo Sans Morales
08-11044		Vicente Fernando Santacoloma Blanco
08-11046		Bernardo Andres Santana Schwarz
08-11052		Andreina Scannone Machado
08-11054		Maria Betania Schnake Santos
08-11055		Carlos Armando Schwarck Valente
08-11057		Frank Alexander Segovia Ospino
08-11058		Valeria Paola Segura Rojas
08-11063		Andrea Maria Serrano Echenagucia
08-11065		Cesar Ali Serrano Lara
08-11069		Rafael Jesus Sifontes Castro
08-11071		Juan Pablo Silva Castejon
08-11074		Pedro Antonio Silva Palencia
08-11087		Karen Anabel Sosa Sanquiz
08-11089		Alan Paul Soto Felice
08-11094		Bishma Radheya Stornelli Ortega
08-11095		Esteban Javier Struve Taguaruco
08-11097		Mauricio Alberto Suarez Colina
08-11102		Eduardo Jose Suarez Meza
08-11104		Gary Daniel Suarez Valderrama
08-11112		Fernando Alberto Tellez Miotta
08-11131		Ivan Andres Travecedo Peña
08-11133		Luis Manuel Trujillo Martinez
08-11135		Harrison Jose Ucros Bovea
08-11148		Maria Alejandra Valdes Graterol
08-11149		Jenny Daniela Valdez Romero
08-11150		Iriana Maria Valdivieso Guanchez
08-11154		Milagros Yamileth Valero Carmona
08-11155		Lisandro Alfonzo Valero Hernandez
08-11165		Aileth Carolina Vasquez Fonseca
08-11168		William Kareem Vegas Contreras
08-11172		Karla Victoria Velarde Izarra
08-11174		Melissa Angelica Velasquez Lopez
08-11175		Yeisson Venencia Saurith
08-11178		Eloisa Rebeca Vera Araujo
08-11179		Klyo Geraldine Vidal Salas
08-11186		Cristina Villalobos Perez
08-11188		Leonardo Jesus Villarreal Marcano
08-11189		Pedro Jesus Villarroel Romero
08-11191		Hetcysbeck Del Valle Villasana Ruiz
08-11194		Samuel Gabriel Villegas San Miguel
08-11195		Carlos Enrique Viña Barrientos
08-11196		Juan Carlos Viña Bello
08-11198		Fritz Martin Wagner Garcia
08-11202		Ana Maria Yamaui Gonzalez
08-11208		Charles Ketuig Yuan Chen
08-11213		Jose Daniel Zambrano Hadwan
08-11215		Veronica Zanolli Baseotto
08-11216		Daniel Elias Zeait Abi Mussa
08-11231		Hector Emmanuel Gomes de Freitas
08-11267		Jefferson Jose Herrera Garcia
08-11269		Krismary Daniela Madera Perez
08-11270		Maria Fernanda Baez Linares
08-11271		Lany Rebeca Plaza Barros
08-11273		Luisana Gutierrez Marin
08-11274		Andrea Estefania Balza Morales
08-11277		Javier Alexander Muñiz Torres
08-11325		Gabriele Tommaso Acconciagioco Ardila
08-11328		Luis Miguel Paez Zarate
08-11344		Heudes Emmanuel Ochoa Parra
08-11348		Francy Carolina Rodriguez Vega
08-11356		Gabriela Rodriguez Alamo
08-11359		Alessandra Sophia Orfei Ascenjo
08-11362		Jessie Fung Tian Tang
08-11363		Monica Alejandra Medina Gomez
08-11367		Jesimar Del Carmen Pereira Moncada
08-11369		Iranid del Carmen Perez
08-11374		Daniel Angarita Perez
08-11375		Yvany Carolina Hernandez Rodriguez
08-86514		Marla Manely Corniel
09-01021		Juan Pablo Casique Murillo
09-01037		Donibeth Carolina Perez Torres
09-01059		Ricardo Gabriel Ramirez Torrealba
09-01105		Wladimir Joisaac Mora Vasquez
09-01117		George Emmanuel Barahona Velasquez
09-01118		Fabiola Arace Gutierrez
09-01119		Jorvan Rodrigo Duran Salazar
09-01196		Maria Fernanda Blanco Hernandez
09-01247		Christopher Bracamonte Gonzalez
09-01261		Diego F Rojas Grajales
09-01264		Alejandro David Palacios Perez
09-01286		Giannina Gisell Raffo Gonzalez
09-01297		Lissette Antonia Guevara Nieves
09-01311		Gabriel Eduardo Battistelli Da Costa
09-01329		Vittoria Reale Monsalve
09-01855		Giuliana Graciela Peña Espinoza
09-01867		Karlis Madaly Garcia Salazar
09-01880		Estephannie Marcela Cervantes Ramirez
09-01893		Genesis Yudeisy Duque Galindez
09-01918		Daniel Eduardo Sarda Subero
09-01945		Neilim Lethelier Villegas Vivas
09-01976		Daniel Vicente Alvarez Hernandez
09-02006		Osiris Marianggely Lotito la Rosa
09-02017		Luis Carlos Orjuela Vento
09-02058		Anyer Luis Linares Liebano
09-02069		Ruben Leonardo Garcia Regalado
09-02098		Carlos Enrique Caruci Olivar
09-02207		Joselinne Andrea Toro Rodriguez
09-02218		Joel de Jesus Julio Rebolledo
09-02291		Hernando Rodolfo Ochoa Valero
09-02312		Liliam Estefania Laura Perez Valero
09-02314		Jessica del Carmen Alvarado Martinez
09-02465		Gerardo Aulisi Simone
09-02471		Adriana Mariela Da Silva Barbosa
09-02856		Wincler Carlos Madden Paduani
09-02918		Patricia Carolina Temprano Chacon
09-02935		Anger Leonardo Sanchez Plata
09-02958		Hecmirson Jose Ramirez Lopez
09-03011		Christian Rafael Castellano Aray
09-03012		Jose Vicente Carvajal Reyes
09-03060		Michelle Estefania Osuna Salgado
09-03077		Manuel Alejandro Leon Mayorga
09-03079		Nerylena Eloisa Marin Salas
09-03163		Angel Alfredo Dorta Pabon
09-03536		Merlin Yurisa Diaz Osorio
09-03615		Jose Angel Canzanese Disilvestri
09-03646		Norberto Ramon Cuello Ramirez
09-03662		Francisco Javier Beltran Morales
09-03971		Juan Carlos Cabral Quintana
09-04000		Yusmar Alicia Suarez Orejarena
09-04008		Ambar Elena Duarte Sanchez
09-04055		Lismery de Castro Correia
09-04062		Jeferson Rey
09-04083		Leonela Yennett Arrechedera Bravo
09-06279		Marco Antonio Herrera Molina
09-06406		Oswaldo Jose Aguilar Abreu
09-06442		Ledmalyt del Valle Castro Tirado
09-06589		Angel Rafael Sierra
09-06646		Martha Janeth Tasso Rivadeneyra
09-08318		Barbara Carolina Vegas Thomas
09-08336		Rosario Coromoto Ruiz Torres
09-08387		Anthony Jesus Verdez
09-08393		Luis Enrrique Avila Blanco
09-10002		Ana Alida Abdala Monasterios
09-10007		Diego Alejandro Afonso Soto
09-10008		Grace Estefania Aguero Jimenez
09-10009		Manuel Alejandro Aguilar Graterol
09-10010		Sara Isabel Aguilera Lusinche
09-10012		Fares Antonio Akel Cordovez
09-10018		Yamil Rafael Alfonzo Ebrath
09-10020		Stephanie Maria Alibrandi Ferrari
09-10024		Wilfredo Alejandro Alvarez Busani
09-10025		Jose David Alvarez Cortesia
09-10026		Daniel Eduardo Alvarez De Sanctis
09-10029		Gabriel Armando Alvarez Ramirez
09-10030		Alejandro Antonio Alvarez Serio
09-10034		Samuel Eduardo Andrade Sanchez
09-10039		Andres Eduardo Antonini Villamizar
09-10041		Carlos Aponte
09-10049		Mirna Josefina Arizaleta Valera
09-10053		Mariela Andreina Arnal Istillarte
09-10055		Juan Carlos Arocha Ovalles
09-10057		Isadora Arreaza Fagundo
09-10062		Rogelio Daniel Arzola Gomez
09-10064		Andrea Carolina Atilano Avila
09-10066		Gabriel Lee Austin Osorio
09-10076		Andrea Carolina Balbas Quintero
09-10081		Guilmer Barreto Nuñez
09-10083		Adriana Carolina Barreto Rodriguez
09-10087		Ivette Del Valle Barrios Padilla
09-10093		Neylin Adriana Belisario Sanjuan
09-10095		Javier Alejandro Bello Medina
09-10097		Antonio de Jesus Belmonte Fuentes
09-10098		Dayana Beniamini Matos
09-10102		Katrin Karina Bethencourt Ramos
09-10103		Nicole Christine Bizet Sole
09-10106		Kevin Antonio Bolivar Briceno
09-10109		Edgard Luis Bonilla Carrasquel
09-10110		Gabriel Franriq Bonilla Coronado
09-10114		Sofia Isabel Bravo Story
09-10116		Anthony Jolbert Bujosa Pacheco
09-10118		Oscar Jose Burguillos Andrade
09-10119		Maglys Maoly Bustamante Gallardo
09-10123		David Gonzalo Caicedo Mora
09-10124		Ruperto Andres Calatrava Castagnetti
09-10129		Leticia Margarita Capiello Mejia
09-10132		Maria Eugenia Carbonell Escalona
09-10135		Sergio Daniel Cardenas Ramos
09-10139		Carlos Ignacio Carrera Martini
09-10141		Maritza Cartaya Escalona
09-10146		Gerardo Rafael Castañeda Konig
09-10147		Simon Alberto Castillo Bueno
09-10148		Luis Jose Castillo Camargo
09-10152		Belen Aileen Castro Gomez
09-10163		Mariana Carolina Chacon Bernaez
09-10166		Raul Eduardo Chang Torrealba
09-10174		Julio Alejandro Colmenares Veitia
09-10177		Alberto Jose Cols Fermin
09-10178		Gabriela Contreras Camacho
09-10187		Adriana Carolina Covarrubias Sanz
09-10189		Luis Alejandro Crespo Falco
09-10190		Angelo Alessandro Crincoli Rondon
09-10195		Daniel Alejandro Da Corte Quintal
09-10197		Vanessa Maria Da Silva Vazquez
09-10200		Domingo de Abreu Dias
09-10202		Angel Manuel de Campos Magdalena
09-10203		Stefano Gabriele de Colli Di Lallo
09-10209		Juan Manuel de Olival Dos Santos
09-10210		Yessika Alejandra De Quintal Nobrega
09-10212		Artur Jose de Sousa Ferreira
09-10219		Jose Ignacio Delgado Campos
09-10226		Teresa Daniela Di Paolo Garcia
09-10233		Leonardo Andres Diaz Fragachan
09-10234		Alejandro Diaz Gonzalez
09-10236		Andrea Carolina Diaz Mora
09-10238		Cristina Maria Dib Zuloaga
09-10239		Carlos Arturo Diez Perez
09-10240		Ederson Jose Do Nascimento De Nobrega
09-10241		Hector Eduardo Dominguez Berdugo
09-10242		Vanesa Dominguez Miguez
09-10244		Cesar Eduardo Duarte Landaeta
09-10246		Cristian Leomar Duran Guerra
09-10252		Maen Mouhamed El Assaad El Assaad
09-10264		Miguel Eduardo Fagundez Silva
09-10269		Dalton Domingo Faria Goncalves
09-10270		Carlos Adrian Farinha Couce
09-10272		Ana Cristina Fariñas Filippi
09-10278		Patricia Helena Fernandez De Oliveira Latella
09-10282		Jouselt Aaron Fernandez Mendez
09-10285		Matteo Jose Ferrando Briceño
09-10288		Ana Cristina Figueira Cabrera
09-10295		Carlos Eduardo Flores Pino
09-10296		Veronica Carolina Flores Quijada
09-10297		Hernan Mariano Flores Rojas
09-10298		Alejandro Flores Velazco
09-10301		Carolina Alejandra Freites Correa
09-10302		Edgar Jose Fuentes Gonzalez
09-10303		Carla Beatriz Fuentes Rivas
09-10305		Wiman Fung Chang
09-10306		Tomas Andres Galavis Odreman
09-10309		Francisco Xavier Gamundi Aranda
09-10310		Michael Avimelech Gandelman Milgrom
09-10311		Libia Ines Gandolfi Diez
09-10315		Cesar Armando Garcia Cazorla
09-10318		Alejandro Enrique Garcia Navarro
09-10320		Christ Angela Garcia Pelaez
09-10328		Carlos Onofre Gimenez Barrios
09-10329		Maria Gabriela Gimenez Rodriguez
09-10333		Edwin Andres Gomes Pinto
09-10336		Oriana Gomez Di Silvestre
09-10337		Anna Beatrix Gomez Diaz
09-10340		Claudia Gabriela Gomez Gutierrez
09-10341		Jaime Edgardo Gomez Mata
09-10342		Luis Eduardo Gomez Rojas
09-10343		Mauricio Gomez Viloria
09-10345		n
09-10346		Karina Milagros Goncalves De Andrade
09-10350		Jorge Andres Gonzalez Alvarez
09-10351		Oskar Gabino Gonzalez Angola
09-10359		Rafael Eduardo Gonzalez Gomez
09-10360		Maria Fernanda Gonzalez Hernandez
09-10366		Gisela Cristina Gorrochotegui Romero
09-10367		Lilibeth Maria Gouveia De Sousa
09-10372		Francisco Jose Grisanti Canozo
09-10373		Veronica Valentina Gruber Camejo
09-10381		Christhian Jesus Guevara Valencia
09-10385		Alejandro Jesus Guipe Salazar
09-10387		Ronald Jose Gutierrez Zambrano
09-10390		Gustavo Augusto Guzman Paredes
09-10393		Antonio Enrique Hamilton Muñoz
09-10394		Raiff Jozsef Hazanow Guevara
09-10395		Roberto Carlos Heligon Rojas
09-10400		Ana Cristina Hernandez Gomez
09-10403		Jean Paul Hernandez Meze
09-10407		Harold Alberto Hidalgo Carmona
09-10410		Petar Hrgetic Vitols
09-10411		Giampaolo Michele Iannelli Galgano
09-10413		Claudio Imbriaco Liberman
09-10421		Andres Jaen Viera
09-10424		Giselle Andreina Jimenez Gonzalez
09-10425		Luis Fernando Jimenez Hernandez
09-10426		Manuel Alejandro Jimenez Rodriguez
09-10430		Alessandro Augusto la Corte Romagni
09-10441		Mariela Leon-Ponte Alvarez
09-10444		David Alejandro Lilue Borrero
09-10445		Hector Luis Limongi Vallenilla
09-10448		Zoila Del Carmen Lira Medina
09-10450		Franklin Jesus Loaiza Gerig
09-10456		Fernando Jesus Lopez Ybarra
09-10461		Juan Jose Lovera Brito
09-10462		David Augusto Lubo Robles
09-10465		Jesus Andres Luque Gonzalez
09-10466		Jose Manuel Macias Davila
09-10469		Carlos Alberto Madriz Delgado
09-10473		Mailen Cecilia Maniglia Mundarain
09-10476		Jose Alejandro Mansilla Herrera
09-10477		Joaquin Enrique Marcano Espinoza
09-10478		Andreina Milagros Marcano Pacheco
09-10479		Mauricio Alejandro Marcano Sandoval
09-10486		Ricardo Marques Biundo
09-10488		Bertin Antonio Marquez Berrios
09-10490		Miguel Alejandro Marquez Garcia
09-10491		Carlos Guillermo Marquez Parra
09-10495		Jorge Eduardo Marrero Nobrega
09-10498		Alejandra Isabel Martinez Gonzalez
09-10500		Kevin Antonio Martinez Guevara
09-10502		Francisco Antonio Martinez Medina
09-10507		Stephanie Carolina Martinez Verna
09-10508		Jose Rafael Masabet Tovar
09-10509		Jack Mitchell Massaad Mouawad
09-10520		Hector Jesus Medina Garcia
09-10521		Militza Ekaterina Medina Garcia
09-10527		Victoria Eugenia Melo Romero
09-10528		Irene Andreina Mendez Alvarez
09-10536		Carlos Alberto Mendoza Rojas
09-10537		Veronica Menendez De Felicis
09-10538		Raquel Adriana Mercado Torres
09-10540		Patricia Melani Mesa Gutierrez
09-10542		Giannina Isabella Miñano Diaz
09-10544		Gabriel Alejandro Mitacchione Ruiz
09-10546		Masaki Andres Miyazawa Mizukami
09-10547		Gustavo Alfredo Molero Perez
09-10548		Juan Carlos Molina Molina Poggioli
09-10549		Gabriela Alejandra Molinar Torres
09-10556		Daniela Alejandra Morales Arcila
09-10562		Aileen Gabriela Moreno Perez
09-10566		Barbara Muñoz Viamonte
09-10577		Fernando Luis Nunez Mendoza
09-10578		Joselyn Andrea Nuñez Rossi
09-10585		Julio Cesar Oliveira Colina
09-10590		Gustavo Alberto Ortega Martinez
09-10594		Alfredo Miguel Osorio Arias
09-10595		Emy Dayana Ostos Oropeza
09-10596		Giampaolo Otero Ridolfi
09-10599		Franklin David Padilla Padilla
09-10602		Nina Gabriela Paez Frias
09-10605		Andrea Viviana Palacios Pierluissi
09-10606		Gabriel Paolino Cortez
09-10610		Daniel Eduardo Parker Torrealba
09-10611		Leidy Naryimar Parra Nieves
09-10613		Faviola Carolina Paz Lima
09-10615		Edgar Eduardo Pelaez Sarabia
09-10624		Brandon Rafael Pena Leon
09-10631		Andres Enrique Pereira Alvarez Colimodio
09-10632		Miguel Angel Pereira Farray
09-10639		Jorge Ignacio Perez Gonzalez
09-10647		Danielle Carolina Perez Rivero
09-10650		Diego Oswaldo Perez Trenard
09-10655		Valeria Pestana Gianvittorio
09-10661		Krysler Ariana Pinto Olivares
09-10664		Jose Gregorio Piñero Garcia
09-10665		Karen Piotrowski Riera
09-10668		Harold Adonay Pita Serrano
09-10672		Carlo Emigdio Polisano Sanchez
09-10676		Rebecca Beatriz Porras Carta
09-10677		Quiny Guadalupe Portales Navarro
09-10684		Jonathan David Queipo Andrade
09-10688		Yisbellis Yolisbeth Quintero Cordero
09-10690		Alejandra Quiroz Vivas
09-10692		Lukas Ramirez Arango
09-10693		Jose Ignacio Ramirez Arnal
09-10694		Mariana del Valle Ramos Cabello
09-10698		Jesus Orlando Rangel Roberti
09-10700		Aura Victoria Ravelo Idrogo
09-10702		Jean Luis Rendon Mendoza
09-10703		Patrick Samuel Rengifo Mezerhane
09-10705		Carlos Luis Requena Blanco
09-10707		Mauricio Rafael Reyes Canales
09-10716		Luis Alfonso Rivas Rivas
09-10717		Gustavo Adolfo Rivera Dominguez
09-10718		Martha Patricia Rivero Arrieta
09-10719		Paola Alexandra Rivero Borrego
09-10725		Yanelkis Alejandra Rodriguez Bolivar
09-10726		Juan Manuel Rodriguez Cuevas
09-10727		Kevin Daniel Rodriguez Da Silva
09-10728		Samuel Jose Rodriguez Da Silva
09-10731		Mariana Cristina Rodriguez Marino
09-10733		Jesus Alejandro Rodriguez Morales
09-10735		Daniela Andreina Rodriguez Muñoz
09-10736		Rafael Angel Rodriguez Nava
09-10742		Maria Gabriela Rodriguez Sojo
09-10752		Freiber Orlando Rojas Ramirez
09-10754		Luis Guillermo Roldao Jimenez
09-10758		Junniers Jesus Romero Suarez
09-10763		Marielisa Rosales Seittiffe
09-10764		Fabiola Carolina Rosato Monaco
09-10765		Antonio Jose Rosciano Alvarez
09-10770		Miguel Javier Ruiz Peceno
09-10776		Alberto Sadde
09-10778		Francisco Jose Salanova Rodriguez
09-10779		Maria Margarita Salas Barragan
09-10782		Miguel Eduardo Sanabria Beltran
09-10785		Claudia Carolina Sanchez Lopez
09-10788		Alejandro Gabriel Sanchez Morales
09-10790		Jose Antonio Sanchez Rodriguez
09-10791		Luis Eduardo Sanchez Varela
09-10792		Jose Andres Sanchez Vazquez
09-10794		Fernando Miguel Saraiva de Almeida
09-10797		Nelson Avelino Saturno Teles
09-10799		Jose Ruben Sayritupac Vera
09-10806		Jose Alfredo Sepulveda Bayona
09-10809		Ruben Jose Serradas Aponte
09-10810		Luis Alberto Serrano
09-10814		Solange Milena Silva Vasquez
09-10815		Mitsiu Jose Siu Da Silva
09-10816		Marielby Mercedes Soares Afonso
09-10820		Fernando Enrique Sorondo Rivera
09-10822		Juan Carlos Soto
09-10829		Eduardo Luis Sue Ochoa
09-10832		Victor Julio Suniaga Martin
09-10838		Ricardo Alfredo Tellez Alzu
09-10839		Jose Manuel Teran Bermudez
09-10846		Kristian David Torres Bautista
09-10850		Maria Jose Tosta Guillent
09-10851		Mariana Tosta Otamendi
09-10852		Luis Elias Tovar Huiza
09-10855		Karen Maria Troiano Murrocu
09-10858		Carla Trujillo Villegas
09-10863		Cesar Abraham Urbina Torrealba
09-10864		Andres Alejandro Urdaneta Leon
09-10865		Andres Alfonso Uribe Jimenez
09-10869		Andrea Irene Valbuena Vilacha
09-10870		Edgar Daniel Valderrama Bacilio
09-10873		Rodolfo Jose Valery Franco
09-10874		Salvador Valisena Frias
09-10882		Yeiker Alex Vazquez Molina
10-01681		Anderson Miguel Contreras De Abreu
10-01705		Adriana Del Carmen Rondon Gomez
10-01728		Miguel Alexander Sequera Morillo
10-01754		Ana del Carmen Torrealba Marrero
10-01757		Maren Alejandra Pedroza Gomez
10-01768		Eliu Jose Hurtado Gomez
10-01820		Dariana del Carmen Rondon Granados
10-01834		Melanie Nina Mendes
10-01840		Yurubi Angelica Bonilla Castellar
10-01853		Brian Alexander Simoza Leon
10-01866		Silvia Patricia Penuela Leon
10-01870		Jaanh Federico Yajuri Bernal
10-01877		Nelsybet Naikely Trejo Marquez
10-01908		Yoseidy del Valle Hernandez Altuve
10-01913		Juan Jose Chong Paez
10-01917		Hendder Jesus Gonzalez
10-01922		Paula Beatriz Roshupkin Gonzalez
10-01930		Katherine Johanna Jimenez Brito
10-02071		Andres Alejandro Meza Ramirez
10-02130		Oscar Eduardo Salas Cabrera
10-02155		Sahiner Alberto Sequera Lugo
10-02219		Fatima Maria De Gouveia Vieira
10-02224		Luis Javier Torres Lopez
10-02236		Estefany Eddy Bermudez Paredes
10-02255		Ketty Johanna Julio Ferreira
10-02260		Maria Mercedes Arguello Suarez
10-02285		Ana Karina Carmona Ortiz
10-02299		Ariel Marina Mila de la Roca Morales
10-02307		Genesis Carolina Martinez Santiago
10-02378		Anadi Emilia Rodas Pulgar
10-02380		Yesenia Yamileth Pena Sanchez
10-02394		Mary Alexandra Zamora Hidalgo
10-02401		Laura Valentina Galeano Loaiza
10-02424		Iraima del Valle Ramirez Ramirez
10-02439		Emili Montilla Vasquez
10-02444		Ronald Enrique Farina Uzcategui
10-02461		Jorge Luis Mendoza Conde
10-02479		Danny Alberto Tello Alejo
10-02512		David Mercury Piza Paez
10-02526		Jing Hao Siet Liang
10-02528		Melanie Milagros Gutierrez Benavides
10-02531		Rosy Michel Guillen Guerrero
10-02532		Gilbert Manuel Osuna Uzcategui
10-02554		Aimeth Carolina Lira Campos
10-02562		Pedro Alejandro Valladares Zambrano
10-02566		Wendell Enrique Mego Sanchez
10-02623		Karleidy Anais Villarroel Campos
10-02649		Roxana Haidee Perez Perez
10-08366		Tito Jesus Urbano Perez
10-10003		Marlovis Scarlet Abreu Vargas
10-10004		German Alberto Acosta Correa
10-10005		Fabiana Jose Acosta Diaz
10-10011		Andrea Aylemar Alayon Trejo
10-10012		Deyimar Astrid Albornoz Celis
10-10014		Ignacio Manuel Alfonzo Prieto
10-10021		Pedro Jose Amodio Goncalves
10-10035		Miguel Alejandro Araujo Salazar
10-10040		Alberto Jose Artahona Lopez
10-10048		Eimy Solamsh Aviles Lara
10-10049		Andres Arturo Ayala Mennechey
10-10051		Gamar Ivan Azuaje Suarez
10-10055		Wilmer Rafael
10-10058		Bruno David Barone Cavalieri
10-10059		Jose Felipe Barradas Da Corte
10-10064		Nadia Estefania Bastidas Godoy
10-10084		Vincenzo Paolo Bonelli Vivas
10-10087		Luisana Elena Borrego Velasquez
10-10088		Stefany Daniela Botero Mendoza
10-10092		Juan Carlos Brito Soret
10-10103		Renny Ricardo Camacho de Freitas
10-10105		Samantha Elizabeth Campisi de Sousa
10-10108		Marcos Antonio Campos Manzano
10-10110		Ana Cristina Cancino Armas
10-10111		Maria Andreina Cane Mejias
10-10116		Luis Eduardo Caraballo Rodriguez
10-10119		Julio Jose de la Santisima Trinidad Cardenas Chapellin
10-10120		Juan Andres Carpio Castellanos
10-10122		Maria Esther Carrillo Grasso
10-10128		Junior Enrique Castillo Ortiz
10-10130		Andres Enrique Castro Gomez
10-10132		LDC - Fabio Castro
10-10133		Manuel Antonio Castro Martinez
10-10137		Ronald Alejandro Celis Trujillo
10-10139		Andrea del Carmen Chacon Alviarez
10-10141		Anabella Chacon Herran
10-10146		Ricardo Jesus Choy Chuecos
10-10148		Daniel Andres Cipriano Goncalves
10-10156		Abraham Jesus Contreras Ramirez
10-10164		Salvador Ricardo Covelo Mosquera
10-10168		Carlos Enrique Cruz Puigbo
10-10175		Carlos Fernando Da Silva Diaz
10-10176		Jose Antonio Da Silva Faria
10-10179		Emmanuel Jose de Aguiar Silva
10-10180		David de Faria Lo Paro
10-10185		Francisco Eugenio de Lima Rodriguez
10-10188		Jose Manuel de Oliveira Meneses
10-10190		Frank Carlos de Pasquale Gomez
10-10192		Andoni Joseba de Urrutegui la Riva
10-10193		Mathieu Enrique de Valery Fernandez
10-10195		Alfredo Alejandro Delgado Lopez
10-10196		John Mikel Delgado Pablo
10-10197		Rafael Eduardo Delgado Rocca
10-10198		LDC - Ivo Di Barros
10-10200		Luigi Di Martino
10-10201		Gabriela Carolina Di Mauro Portillo
10-10203		Daniel Augusto Di Vita de Sousa
10-10211		Danilo Diaz Tarasco
10-10217		Christian Dos Reis de Nobrega
10-10220		Cesar Eduardo Duran Cedeño
10-10222		Jose Daniel Duran Toro
10-10223		Maximiliano Enrique Eekhout Gil
10-10224		Luis Daniel Egan Villamizar
10-10225		Edvin Jesus Egas Guerrero
10-10227		Juan Andres Escalante Rodriguez
10-10231		Paolangela Espinal Useche
10-10235		Miguel Alejandro Farias Pizzano
10-10236		Domenico Favaro
10-10245		Jose Manuel Figueredo Fortes
10-10248		Minerva Josefina Figueroa Vivas
10-10251		Clint Wilman Fontalvo Orozco
10-10256		Victoria Eugenia Gabante Guerra
10-10258		Luciano Jose Gallucci Rendon
10-10261		Graziella Esther Gandolfi Diez
10-10264		Maria Lourdes Garcia Florez
10-10270		Gonzalo Enrique Garcia Valverde
10-10272		Gabriel Augusto Gedler Hernandez
10-10273		John Alexander Ghelman Guaira
10-10274		Sergio Guillermo Gil Aponte
10-10285		Victor Alejandro Gomez Molina
10-10290		Arleyn Yoandra Goncalves Lorca
10-10292		n
10-10293		Carlos Eduardo Goncalves Rodrigues
10-10296		Salvador Jose Gonzalez Di Renzo
10-10300		Carlos Daniel Gonzalez Cedillo
10-10302		Andrea Paola Gonzalez Colmenares
10-10304		Ambar Mariell Gonzalez Di Carlo
10-10305		Josif Alesandro Gonzalez Gonzalez
10-10307		Luis Alfonzo Gonzalez Lugo
10-10310		Miguel Angel Gonzalez Ohep
10-1032		n
10-10320		Ana Cristina Gravalos de Castro
10-10324		Rut Altair Gruber Rivas
10-10325		Daniel Enrique Grujicic Rosas
10-10328		Luis Alfonso Guerra Di Martino
10-10330		Andres Miguel Guerrero Silva
10-10333		Alejandro Rene Guillen Vera
10-10340		Tomas Eduardo Guzman Irsay
10-10341		Andres Jose Guzman Melendez
10-10343		Gabriel Alexander Hamilton Oviedo
10-10352		Valentina Hernandez Mogollon
10-10353		Andres Rafael Hernandez Monterola
10-10357		Andres Paul Hidalgo Betancur
10-10361		Carlos Jesus Huerta Socorro
10-10368		Oswaldo Andres Jimenez Hidalgo
10-10371		George Luis Koubbe Karahbit
10-10374		Rosneilys del Carmen Larez Ramirez
10-10381		Amanda Lorena Leon Giraldez
10-10383		Guido Maurizio Licini Diaz
10-10385		Gabriela Claret Limonta Marquez
10-10390		Mauricio Antonio Lombardo Pascarelli
10-10391		Irene Michelle Lopez Carron
10-10395		Jonathan Guillermo Lopez Gaston
10-10397		Daniel Alberto Lopez Velasco
10-10401		Veronica Maiella Lugo Lopez
10-10406		LDC - Rebeca Machado
10-10407		Veronica Alejandra MacHado Ramirez
10-10411		Gabriela Cristina Mantilla Ramos
10-10413		Jan Manuel Marcano Ortiz
10-10417		Javier Alejandro Marin Armas
10-10418		Rebeca de Jesus Marin Hernandez
10-10419		Daniel Arturo Marin Tirado
10-10420		Adriana Carolina Marquez Urbaez
10-10423		Joel Martin Romero
10-10433		Isabel Angelica Marval Saturno
10-10434		Gabriel Marzinotto Cos
10-10436		Andrea Kristina Masia Mata
10-10445		Cristian Adrian Medina Villarroel
10-10447		Alejandro Mena de Fonseca
10-10449		Jorge Mendez Mendez
10-10454		Ernesto Jesus Mengual Mora
10-10457		Vincenzo Miale Merola
10-10459		Luis Alberto Miglietti Garcia
10-10463		Luis Cesar Miranda Mogollon
10-10467		Maria de los Angeles Monserrate Mendoza
10-10469		n
10-10473		Albert Alejandro Montilla Mendoza
10-10477		Gustavo Adolfo Mora Pereda
10-10479		Paul Jose Morales Pinto
10-10483		Javier Mounir Moubayyed Rodriguez
10-10484		Victor Alejandro Mujica Maiguel
10-10488		Edwin Arturo Murillo Paez
10-10493		Greta Valentina Navas Cristea
10-10495		David Alberto Ng Castellano
10-10496		Jhoandri Gabriel Nogales Mujica
10-10498		Carlos Ignacio Noria Marrero
10-10499		Manuel Alfredo Noriega Ramos
10-10500		Manuel Antonio Noriega Ramos
10-10501		Christian Nowacka Barros
10-10504		Cindhy Katherine Ochoa Arellano
10-10512		Elvis Alexander Ortega Reyna
10-10513		Alejandra Ortega Tovar
10-10516		Daniel Alejandro Ortiz Ramirez
10-10517		Daniela Mercedes Ortiz Sanchez
10-10521		Jean Carlo Alejandro Ovalles Loyo
10-10524		Manuel Alejandro Pacheco Moreno
10-10525		Antonio Pacifico de Martinis
10-10526		Juan Vicente Padron Parraga
10-10530		Sofia Gabriela Parada Pereda
10-10539		Daniel Enrique Pelayo Useche
10-10544		Jorge Jesus Perez Bailon
10-10547		Larry Jhosue Perez Gonzalez
10-10548		Pedro Miguel Perez Gonzalez
10-10551		Alejandro Ricardo Perez Martinez
10-10562		Yolanda Alessandra Peñaloza Gomez
10-10563		David Samuel Peñaloza Seijas
10-10572		Carlos Aser Plantijn Conde
10-10574		Alejandro Porras Luces
10-10579		Zenon Efrain Prusza Fragoso
10-10581		Alejandro Arturo Pumpido Ochoa
10-10583		Nohely Josefina Quijada Millan
10-10585		Maricory Quintero Vezga
10-10588		Alexis Jose Quiroz Rivas
10-10591		Samuel Alejandro Ramirez Quintero
10-10595		Diego Andres Randon Jimenez
10-10602		Jesus Alejandro Reyes Segnini
10-10603		Sahid Gabriel Reyes Tabja
10-10605		Roberto Rinaldi Troiano
10-10608		Vanessa Eleonora Rivas Serio
10-10612		Nerio Alejandro Roa Blanco
10-10613		Leslie Angelica Rodrigues Agrela
10-10614		Carlos Eduardo Rodrigues Ferreira
10-10615		Dayana Carolina Rodrigues Peña
10-10628		Jhonny Rodriguez Rahal
10-10631		Rafael Alberto Rodriguez Sanchez
10-10636		Anyela Celeste Rojas Castro
10-10642		Roberto Antonio Romero Barrientos
10-10644		Jorge Javier Romero Manosalvas
10-10647		Andrea Fernanda Romero Pire
10-10649		Maria del Mar Rosales Malave
10-10650		Jose Carlos Rosales Nuñez
10-10656		Oscar Miguel Ruiz Ortiz
10-10660		Fergie Joselin Salas Bertys
10-10661		Andrea Margarita Salas Sanchez
10-10662		Henryke Jesus Salazar Bellorin
10-10664		Miguel Habraham Salazar Rodriguez
10-10666		Andrea Carolina Salcedo Lugo
10-10667		Sebastian Salerno Garmendia
10-10669		Valentina Salgueiro Gonzalez
10-10671		Hector Eduardo Sanchez Alfonzo
10-10672		Ramon Eduardo Sanchez Marquez
10-10673		Jorge Eliecer Sanchez Rivero
10-10684		Efrain Alberto Savasta Bravo
10-10686		Jose Vicente Scannone Chavez
10-10690		Carlos Enrique Scovino Molina
10-10695		Luis Alejandro Sierra Romero
10-10699		Dayana Niazabeth Silva Yanez
10-10700		Gabriela Alejandra Simoes Centeno
10-10708		Silvana Sofia Stredel Gallo
10-10710		Albert Ricardo Strusberg Perez
10-10713		Valeria Andreyna Suarez Bolivar
10-10716		Michel Sucar Geagea
10-10717		Francisco Javier Sucre Gonzalez
10-10718		Roberto Taboelle Fernandez
10-10726		Miguel Octavio Torrealba Schwarz
10-10729		Reinaldo Ignacio Torres Semprun
10-10733		Ivan Nicolas Tulli Segalla
10-10736		Simon Dario Valdivia Alberti
10-10738		Abelardo Jesus Valiño Ovalle
10-10744		Ruben Dario Vasquez Mijares
10-10751		Gabriel Andres Velasquez Scarano
10-10757		Reinaldo Enrique Verdugo Chavez
10-10758		Jean Paul Vergara Marcano
10-10759		Jose Felipe Verhelst Aguilera
10-10760		Gabriela Alejandra Veronelli Martinez
10-10766		Luis Alfredo Viejo Sanz
10-10768		Annybell de Jesus Villarroel Luis
10-10772		Vicente Vives Martinez
10-10773		Yoderick Joan Vizcaya Pinzon
10-10774		Arturo Voltattorni Castaño
10-10780		Indira Dana Yañez Gonzalez
10-10783		Rafael David Zerpa Tovar
10-10796		Juan Pedro Anzola Barros
10-10797		Joel Orlando Araujo Dos Santos
10-10800		Jose Manuel Barrientos Linares
10-10801		Roberto Alejandro Bolivar Rodriguez
10-10805		Joan Manuel Castro Lozada
10-10809		Samuel Corro Morales
10-10812		Fernando Javier D. Agostino Pitarrese
10-10815		Joel Eduardo de Jesus Figueira
10-10824		Christopher Alexander Flores Bracho
10-10826		Jose Alberto Garcia Cabrera
10-10827		Andry Nathali Garcia Parra
10-10833		Daniela del Valle Guedez Quintero
10-10839		Jose Luis Jimenez Betancourt
10-10840		Doranell Coromoto Jimenez Cisneros
10-10844		Armando Josue Longart Zapata
10-10845		Juan Carlos Lopez Lopez
10-10849		Ramon Alberto Marquez Arguello
10-10850		Sergio Enrique Marquez Brito
10-10851		Antonio Jose Martinez Glorioso
10-10861		Cesar Federico Najak Oropeza
10-10866		Mariana Andrea Osorio Coll
10-10868		Anner Jhoan Pellicer Navarro
10-10869		Juan Carlos Paiva Alcala
10-10870		Midaysa Nathalie Palacios Gomez
10-10877		Krysseida Rossely Rodriguez Gonzalez
10-10888		Luis Enrique Tercero Rodriguez Lugo
10-10889		Jose Vicente Rodriguez Morales
10-10890		Grace Estefania Rodriguez Pulido
10-10893		Victor Eduardo Rosales Millan
10-10895		Alejandra del Valle Sayago Paternina
10-10896		Jonathan Ricardo Saavedra Villa
10-10898		Jesus Humberto Sanchez Perez
10-10900		Serena Scarcello Anniballi
10-10901		Daniela Margarita Schloeter Chumaceiro
10-10904		Jorge Humberto Serres Ruiz
10-10906		Heissis Orielis Torres Gonzalez
10-10914		Genesis Elvira Urbina Aguiar
10-10915		Francisco Javier Urbina del Gallo
10-10916		Patricia Roxana Valencia Gomez
10-10918		Moises Abraham Vargas Oropeza
10-10924		Antonio Jose Miranda Lugo
10-10927		Emeli Chiquinquira Gonzalez Campos
10-10931		Jhoannys Carolina Sanchez Marquez
10-10940		Aldrix Jose Marfil Valera
10-10943		Carlos Eduardo Moron Lugo
10-10949		Eduardo Mendoza Alessio
10-10950		Lovera Seijas Anelyn Yanina
10-10956		Paula Carolina Rodriguez Vera
10-10958		Dailomar Neldis Pacheco Kayaspo
10-10960		David Rafael Ortega Uribe
10-10975		Karen Andreina Rodriguez Gomez
10-10980		Anais Noemi Lon Ng
10-10981		Dioneisy Dayana Romero Henriquez
10-10983		la Rosa Sosa Aleima Valeria
10-10988		Andrea Valentina Soto Arias
10-10993		Norman Oswaldo Leguizamon Castrillo
10-11005		Yezabel Drusila Rincon Leon
10-11018		Jesus Eduardo Vielma Sumoza
10-11022		Monica Manuella Saenz Ricella
10-11028		Edislean Irene Colina
10-11030		Brito Febres Andrea Maria
10-11034		Pascarella Berroteran Gibel Alessandro
10-11036		Gabriel Formica Bolaños
10-11037		Jose Gregorio Aponte Davila
10-11039		Shamuel Manuel Manrrique Aquino
10-11047		Betzabeth Anais Santana Garanton
10-11055		Genesis Carolina Sanabria Ospino
10-11058		Luis Miguel Gomes Leon
10-11059		Karen Monsalve Monsalve Perez
10-11066		Carlos Javier de Gois Goncalves
10-11072		Maria Isabel Farinha Vieira
10-11075		Daniel Antonio Montilla Lopez
10-11078		Daniel Geovanny Ascanio MacHado
10-11081		Michael Isaac Arjona Gomez
10-11082		Marcia Chiquinquira Camargo Mora
10-11094		Rafael Eduardo Garcia Garcia
10-11101		Ingrid Fabiola Becerra Pulido
10-11103		Sara Eugenia Jimenez Oraa
10-11105		Lugo Montero Genesis Kisbel
10-11110		Aquino Fernandez Roxana Alejandra
10-11117		Daniel Alejandro Cabezas Hernandez
10-11120		Alfredo Alejandro Villegas Silva
10-11121		Edward Antonio Fernandez Silva
10-11125		Yuri Coromoto Saab Ghanman
10-11126		Cruz Eliana Yanez Ugas
10-11127		Katiuska Alejandra Diaz Bernal
10-11128		Miguel Antonio Peña Perez
10-11129		John Alejandro Estrada Andrade
10-11130		Vanessa Del Carmen Rojas Rivas
10-11132		Eduardo Enrique Malave Millet
10-11133		Anakaren del Carmen Sosa Guevara
10-11135		Joseph Augusto Tarazona Ipanaque
10-11147		Maria Alexandra Bracamonte Quintero
10-11148		Jose Ramon Herradez Hernandez
10-11157		Keubis Jesus Mendoza Garcia
10-11186		Marialejandra Mendoza Aranguren
10-11191		Valeria Carolina Padilla Martinez
10-11195		n
10-11206		Emmanuel Alejandro Ramos Rosales
10-11246		Barbara MacArena Hernandez Ledon
10-11247		Rosangelis Veronica Garcia Dorta
10-11248		Oriana Gabriela Graterol Sanchez
10-11252		Esteban Jose Oliveros de Freitas
10-11255		Gabriel Alejandro Torres Morales
10-11256		Willian Gabriel Gonzalez Garcia
10-11260		Cesar Jose Carhuaricra Papuico
10-11261		Lawrence Jonnete Campos Quijada
10-11266		Carla Elena Gomez Alvarado
10-11268		Andrea Nicolle Fuguet Chirinos
10-11269		Victor Miguel Rios Maldonado
10-11287		Yanelith Gabriela la Cruz Aponte
10-11289		Johana Valentina Lopez Crespo
10-11306		Genesis Raquel Perez Arellano
10-11307		Lovera Navas Lisbeth Isabel
10-11308		Mariexis Alexandra Camba Palacios
10-11309		Angel Jesus Celis Buitrago
10-11311		Laura Daniela Rivas Silvio
10-11325		Francesco Galletta Galletta Colmenares
10-11328		Angela Beatriz Subero Calzadilla
10-11330		Caren Jinayra Tavares Acero
10-11331		Berena Benitez
10-11333		Francisco Javier de Pinho Maia
10-11334		Isaias Salvador Velaquez Infante
10-11342		Diego Ricardo Remiddi Gonzalez
10-11345		Roger Nick Pantoja Sotelo
10-87807		Carmen Josefina Flores Cortez
10-87809		Maria Alejandra Rangel Bravo
10-87816		Elba Naileth Carrero Medina
10-87818		Marta Rosa Armas Garcia
10-87819		Duamel Antonio La Rosa Torrealba
11-00905		Jose Rafael Almarza Villalobos
11-03005		Yoris Danieli Garcia Garcia
11-03459		Leonardo Alfonso Romero Rojas
11-03475		Roymar Amarilis Gonzalez Espejo
11-03661		Deilimar Alexandra Pajaro David
11-03826		Oscar Enrique Zambrano Micucci
11-03992		Juan Pablo Caraballo Villaparedes
11-04023		Gian Franco Di Candia Jaimes
11-04026		Kimberly Helena Tirado Barazarte
11-04170		Johnnie Alejandro Suarez Eyzell
11-04237		Maicol Steven Argumedo Martinez
11-04261		Angely Beatriz Mundarain Figueroa
11-04550		Xavier Eduardo Zambrano Ramirez
11-10001		Ramon Abascal Gamarra
11-10005		Moises Ackerman lañado
11-10009		Auralicia Acosta Niembro
11-10017		David Alejandro Alba Maloney
11-10019		Daniela Maria Alcantara Morcuende
11-10021		William Eduardo Aldana Seco
11-10023		Esteban Massimo Allocca Kajsza
11-10024		Melany Alonso Ruocco
11-10025		Said Alexander Alvarado Marin
11-10026		Bridihen Alvarado Montero
11-10029		Emilio Jose Alvarez Lopez
11-10030		Kelly Ann Alvarez Decan
11-10031		Antonio Jose Alvarez Gomez
11-10041		Anna Paola Antonini de Almeida
11-10043		Betzabeth Araque Rivera
11-10047		Marian Angelica Arenas Sanchez
11-10050		Mariana Arias Tozzi
11-10051		Andrea Isabel Arizaleta Valera
11-10053		Amin Alejandro Arria Meza
11-10054		Pablo Arquimedes Arriaga Mata
11-10055		Gabriel Eduardo Arroyo Antolinez
11-10058		Domingo Enrique Arteaga Gutierrez
11-10073		Victor Alessandro Balducci Di Mattia
11-10074		Narky Alejandra Isabel Ballarte Boudewyn
11-10075		Jonathan Jesus Bandes
11-10081		Juan Alejandro Barcenas Villegas
11-10082		Rene David Barcia Quijije
11-10084		Daniel Alexander Barreto Mattey
11-10088		Sergio Luis Barrios Palacios
11-10089		Ana Fernanda Barroeta Devia
11-10091		Mauricio Guillermo Bautista Rivas
11-10092		Andersson Enrique Becerra Colmenares
11-10093		Maria Estefania Bello Yajure
11-10095		Miguel Antonio Benitez Arteaga
11-10096		Mahikol Jose Benitez Quijada
11-10097		Gustavo Enrique Benzecri Hernandez
11-10103		Guillermo Jose Betancourt Garcia
11-10104		Cristina Elena Betancourt MacEro
11-10106		Emilio Blanco Kobernyk
11-10108		Alejandro Alexander Blanco Rodriguez
11-10111		Vinicius Bocaiuva Nunes
11-10113		Orlando Jose Bohorquez Herrera
11-10118		Diego Pasquale Borneo Moreno
11-10121		Juan Jose Bracho Sanchez
11-10124		Cristhian Andres Bravo Fernandez
11-10126		Jean Carlos Bravo Saez
11-10129		Nestor Luis Brito Naveda
11-10132		Alexandra Carolina Caballero Gomez
11-10133		Lesther Gabriel Caballero Pacheco
11-10135		Anibal Alejandro Cabezas Martinez
11-10143		Jhonny Jose Calvo Rondon
11-10144		Jonathan Enrique Camacho Navarro
11-10146		Lorenzo Jose Camejo Navarro
11-10147		Julio Cesar Camejo Pacheco
11-10148		Ana Valentina Camino Di Prinzio
11-10155		Rafael Enrique Cardozo Gomez
11-10156		Jose Gregorio Carmona Barazarte
11-10161		Diego Arturo Carrero Rangel
11-10162		Mairene Carolina Carreño Pantoja
11-10163		Marysabel Carrillo Davila
11-10169		Maria Jose Castejon Ruiz
11-10170		Reina de Luz Castillo Arevalo
11-10171		Damarys Gabriela Castillo Garcia
11-10178		Gabriel Armando Castro Lozada
11-10179		Carla Andreina Castro Martinez
11-10180		Claudio Jesus Castro Perez
11-10183		Guillermo Antonio Cañizales Call
11-10184		Samuel Jesus Celis Gomez
11-10190		Jose Alirio Chacon Vanegas
11-10195		Carla Isabel Chaurio Bermudez
11-10196		Lucia Donata Chavarria Valenzuela
11-10199		Jonnathan Chiu Yung Ng Ho
11-10200		Ricardo Alejandro Churion Cortez
11-10211		Vanessa Colmenares
11-10219		Luis Enrique Contreras Silva
11-10220		Pedro Arturo Contreras Tarazona
11-10226		Daniela Cossio Ramirez
11-10227		Edigar Jesus Coste Rios
11-10229		Manuela Crema Martinez
11-10231		Andreina Cuello Rondon
11-10232		Gleidimar Cuenca Carrillo
11-10233		Alfonso Curbelo Curbelo Jimenez
11-10235		Roberto Alejandro Camara Rodriguez
11-10237		Daniel Alberto Cardenas Perez
11-10238		Isabel Sofia Ciscar Barrios
11-10242		Edgar Daniel Da Silva Pineda
11-10252		Gabriela Karina de Jesus Reza
11-10253		Alexa Andrea de la Puente Torres
11-10258		Manuel Alejandro de Sousa Cabral
11-10259		Delines Alejandra de Sousa Lares
11-10275		Viviana Di Stefano Colasante
11-10278		Albert Edinson Diaz Granados
11-10280		Stephany Andrea Dickson Galvis
11-10281		Abraham Enrique Dominguez Hernandez
11-10283		Karen Carolina Dos Santos Vieira
11-10288		Yoel Ricardo Duran Gonzalez
11-10290		Alejandro Armando Diaz Collovini
11-10291		Diego Luis Diaz Ibañez
11-10293		Luis Carlos Diaz Ruiz
11-10302		Simon Luis Esperanza Lozada
11-10304		Arelys Joselyn Fajardo Caldera
11-10307		Juan Andres Fariñas Gonzalez
11-10308		Vanessa de los Angeles Farias Perdomo
11-10318		Alejandro David Fernandez Schrunder
11-10323		Carlos Alejandro Ferreira Pereira
11-10328		Monica Andreina Figuera Yuncosa
11-10329		Carlos Daniel Figueroa Gomez
11-10331		Daniel Alberto Flores Andreetta
11-10333		Daniela Gloria Flores Meregote
11-10336		Eugenio Andres Fortunato Pereira
11-10339		Clara Eugenia Fraile Mujica
11-10343		Amador Junior Galeano Villar
11-10350		Cesar Augusto Garcia Duque
11-10351		Daniel Orlando Garcia El Halabi
11-10352		Emanuel Isaac Garcia Garcia
11-10358		Arlenys Josefina Garcia-gil Castillo
11-10360		Reineudis Eli Garcia
11-10363		Mariana Isabel Garcia Latozefky
11-10365		Rosana de los Angeles Garcia Perez
11-10366		Jorge Eliezer Garrido Ramones
11-10371		Virginia Elizabeth Gil Vasquez
11-10373		Gabriel Arturo Giordano Vielma
11-10374		Sergio Matia Giuliani Lozada
11-10375		Manuel Alejandro Gomes Gonzalez
11-10377		Flor Elena Gomez Aguero
11-10378		Jose Inocente Gomez Fernandez
11-10381		Catherine Coromoto Goncalves Alvarez
11-10384		Andres Eduardo Gonzalez Arria
11-10388		Andres Enrique Gonzalez Giraldo
11-10390		Manuel Guillermo Gonzalez Malave
11-10391		Vidal Raul Gonzalez Pereira
11-10393		Dailys Lucerito Gonzalez Ramirez
11-10394		Eduardo Andres Gonzalez Robles
11-10397		Agustin Gabriel Gonzalez Zubillaga
11-10401		Paula Gonzalez Gago
11-10403		Jose Alejandro Gonzalez Nuñez
11-10406		Moises Jesus Gonzalez Salas
11-10409		Alfredo Enrique Graffe Garcia
11-10416		Mariana Cristina Guerra Espinoza
11-10420		Cristina Lilibeth Guerrero Mateus
11-10428		Gustavo Antonio Gutierrez Rondon
11-10431		Andres Arturo Gutierrez Serrano
11-10435		Yuli Margarita Gomez Aponte
11-10441		Eduardo Jesus Halmoguera Fanghella
11-10448		Andrea Eugenia Hernandez Guerra
11-10452		Adonai David Hernandez Villanueva
11-10454		Daniela Isabel Hernandez Fontaines
11-10455		Jorge Marcelo Hernandez Lopez
11-10457		Jean Piero Hernandez Meze
11-10459		Andres Eduardo Hernandez Romero
11-10461		Guillermo Alberto Herrera Ferreira
11-10463		Rafael Carmelo Herrera Ibarra
11-10468		Salomon Reynaldo Hidalgo Bracho
11-10472		Guillermo Rafael Hurtado Cardosi
11-10474		Eva Sofia Hurtado Kebschull
11-10476		Gabriel Enrique Iglesias Monedero
11-10477		Enrique Antonio Iglesias Vidal
11-10480		Jose Antonio Invernon Gomez
11-10484		Yerih Aziel Iturriago Ordoñez
11-10486		Kenny Alejandro Jaimes Manrique
11-10492		Oscar Guillermo Jimenez Rivero
11-10495		Maria Victoria Jorge Mauriello
11-10496		Ann Nathaly Juarez Carmona
11-10500		David Enrique Klie Vasquez
11-10502		Giancarlo Stephan Lago Ibañez
11-10503		Oscar Armando Laguna Valdivieso
11-10504		Alejandro Jose Laguna Zavarce
11-10507		Carol Sofia Landaeta Farias
11-10509		Gleidys Annette Lastra Yance
11-10510		Edgar Felipe Laucho Aguilarte
11-10514		Federico Andres Leonard Herrera
11-10516		Cristhyne Stephania Leon Borrego
11-10518		Alonso Rafael Leon Gutierrez
11-10530		Arianna Llanos Da Silva
11-10542		Carlos Enrique Luis Goncalves
11-10552		Javier Alejandro Lopez Lombano
11-10554		Juan Antonio Lopez Mendoza
11-10561		Marianny Jose Malave Morales
11-10565		Mauricio Enrique Marcano Delgado
11-10566		Jorge Enrique Marcano Dutkowski
11-10568		Dylan Jose Marchena Rojas
11-10569		Francisco Marcos Lombardi
11-10576		Leonardo Rafael Martinez Azuaje
11-10578		Andrea Carolina Martinez Celis
11-10579		Sirruma Alejandra Martinez la Cruz
11-10583		Jorge Alejandro Martinez Decena
11-10584		Carlos Rodrigo Martinez Diaz
11-10585		Jeniffer Katherin Martinez Hernandez
11-10588		David Alejandro Marzola Lopez
11-10590		Krisyorwing Braniel Mata Rojas
11-10593		Cristina Elena Maurette Blasini
11-10595		Miguel Angel Medina Cornejo
11-10598		Alejandro Meilan Akkari
11-10599		Valeska Mercedes Meinhard Rodriguez
11-10601		Diego Nicolas Mejia Esposito
11-10602		Daniel Alejandro Mejias Rojas
11-10604		Astrea Chanell Men Changarotty
11-10605		Diana Carolina Mendes Lodato
11-10609		Marco Antonio Mendoza Iraci
11-10612		Diego Ignacio Mendoza Zambrano
11-10613		Julivette Carolina Mercado Mendez
11-10615		Lorenzo Agustin Mercado Torres
11-10618		Gabriel Enrique Mijares Vasquez
11-10620		Magdiel Abinadab Millan Alonzo
11-10623		Alejandra Mirabent Roche
11-10626		Fatima Mercedes Mojica Duarte
11-10628		Gerardo Jose Molina Castillo
11-10629		Jesus Adolfo Molina Garcia
11-10631		Patricia Elena Molina Tirado
11-10639		Mauricio Jose Montero Rojas
11-10640		Ricardo Manlio Monticelli Rodriguez
11-10646		Saskya Raquel Mora Di Battista
11-10649		Gerardo Elias Mora Zoghbi
11-10650		Leonardo Jose Morales
11-10653		Maria Vaniuska Morales Diaz
11-10655		Barbara Milagros Morales Naranjo
11-10658		Guillermo Alexander Moran Garcia
11-10671		Luis David Moronta Rugeles
11-10681		Luis Alfredo Muñoz Molina
11-10682		Ramon Alejandro Marquez Hernandez
11-10683		Nabil Jesus Marquez Villarroel
11-10684		Ricardo Eugenio Munch Casanova
11-10685		Richard Nachar Habib
11-10686		Rossy Carolina Naranjo Diaz
11-10687		Nestor Javier Natera Aguilar
11-10688		Andres Orlando Navarro Gutierrez
11-10691		Daniel Antonio Neri Briceno
11-10695		Angelica Isabel Nieves Perez
11-10699		Luis Alejandro Nuñez Ferro
11-10703		Carlos Rafael Ocanto Davila
11-10708		Jose Maximino Ollalvis Santiago
11-10712		Peña Sanchez Orlando Jose
11-10713		Jose Miguel Ortega Ortiz
11-10719		Alexander Antonio Oyarzabal Silva
11-10720		Maria Jose Pacheco Cordero
11-10721		Patricia Pacheco Diaz
11-10723		Ricardo David Pacheco Morales
11-10728		Maite Padilla Morales
11-10729		Lewis Eduardo Palacios
11-10733		Simon Jesus Palma Cardenas
11-10734		Sandra Palumbo Hernando
11-10736		German Andres Pardi Cardozo
11-10738		Patricia Nakary Paredes Leon
11-10740		Luis Alberto Paredes Salazar
11-10741		Ricardo Javier Parra Guzman
11-10743		Jose Ricardo Pascarella Quijada
11-10745		Jose Daniel Patiño MacEdo
11-10747		Lorenzo Jesus Payaro Robles
11-10749		Andres Jose Perdomo Portillo
11-10750		Juan Pablo Pereira Garcia
11-10754		Gledys Maria Perez Colmenares
11-10759		Leonardo Jose Perez Perez
11-10773		Gabriel Rafael Peña Scaramella
11-10775		Jose Eduardo Peña Vera
11-10780		Angelica Vanessa Pingarron
11-10786		Yesika Luzmar Pirone Peña
11-10792		Eduardo Alfonso Polanco Colon
11-10793		Luis Fernando Polanco Herrera
11-10795		Jean Carlos Poleo Omaña
11-10796		Genesis Rossana Ponce Guacache
11-10797		Gabriella Porras Di Mauro
11-10798		Ysmar Yoleth Portillo Rodriguez
11-10801		Johanny Raquel Prado Garcia
11-10806		Manuel Salvador Perez Perez
11-10814		Maria Victoria Perez Morales
11-10818		Genesis Gabriela Quiaro Sandoval
11-10831		Jose Alejandro Ramos Medina
11-10848		Oscar Enrique Regalado Blanco
11-10851		Patricia Estefani Reinoso Arevalo
11-10856		Jesus Antonio Requena Valladares
11-10862		Carlos Tomas Rincones Bellorin
11-10863		Reynaldo Alberto Riobueno Jimenez
11-10865		Leonella Pilar Ritter Lista
11-10866		Joel Jesus Rivas Andara
11-10869		Michelle Alejandra Rivas Garces
11-10870		Juan Francisco Rivera Hernandez
11-10871		Gustavo Andres Rivera Martin
11-10872		Maria Victoria Rivera Sanchez
11-10874		Kervyn Johan Rivero Mujica
11-10876		Yerson Roa Rubio
11-10879		Stefane Geraldine Rodriguez Llamozas
11-10881		Diego Alejandro Rodriguez Campos
11-10883		Luis Ely Rodriguez Fernandez
11-10886		Ninfa Rosa Rodriguez Pire
11-10889		Juan Jose Rodriguez Rojas
11-10892		Andres Enrique Rodriguez Hernandez
11-10893		Susana de Jesus Rodriguez Mago
11-10896		Leonardo Mauricio Rodriguez Rodriguez
11-10903		Valeria Andrea Rolo de Abreu
11-10919		Constantino Ruiz Rodriguez
11-10920		Yeng Lyn Russian Cuan
11-10924		Hanssen Adolfo Salas Cueto
11-10931		Gabriela Sanahuja Santos
11-10932		Maximo Alejandro Sancha Nuñez
11-10935		Genessis Karolina Sanchez Centeno
11-10938		Andreina - Sanchez Querales
11-10939		Meggie Ariana Sanchez Zambrano
11-10943		Jesus Rafael Santaella Hernandez
11-10946		Daniel Alejandro Santiago Mayoral
11-10949		Francisco Santos Villanueva
11-10955		Maria Gabriela Sarmiento Ramirez
11-10957		Antonio Alejandro Scaramazza Cortiñas
11-10960		Ninisbeth Yoselin Segovia Noguera
11-10966		Gonzalo Enrique Silva Castillo
11-10968		Edgar Jose Silva Rengel
11-10969		Erick Gabriel Silva Rodriguez
11-10971		Roberto Andres Silva Segovia
11-10979		Daniela Ohana Socas Gil
11-10982		Jesus Daniel Soler Cepeda
11-10984		Sujey Sterling Soto Guerrero
11-10987		Carlos Adolfo Spaggiari Roa
11-10994		Sofia Lorena Suarez Molina
11-10998		Jose David Suarez Alvarez
11-10999		Mijail Yevgeñii Szczerban Gonzalez
11-11001		Daniel Enrique Sanchez Aranguren
11-11002		Vannessa Lorena Sanchez Blanchard
11-11004		Gabriel Eduardo Sanchez Caputo
11-11005		Victor Alejandro Sanchez Gomez
11-11008		Nestor David Sanchez Rodriguez
11-11012		Cesar Eugenio Tarantino Mussett
11-11013		Desiree Victoria Tassara Quijada
11-11016		Christian Antonio Teixeira Gomes
11-11020		Sergio Alejandro
11-11023		Johan Josue Toro Gonzalez
11-11025		Yesenia Torrealba de la Rosa
11-11027		Douglas Enrique Torres Cuevas
11-11028		Carlos Luis Torres Giraldez
11-11031		Migyael Guillermo Torres Vieira
11-11044		Adriana Victoria Valera Perez
11-11047		Juan Alejandro Valero Zambrano
11-11055		Cristiam Milord Vasquez Lopez
11-11058		Miguel Alejandro Vecchio Gajzenberg
11-11065		Andreina de Lourdes Vera de Freitas
11-11067		Ebelyth Andreina Verenzuela Padron
11-11078		Manuel Alejandro Viloria Weffer
11-11080		Victor Manuel Wall Gonzalez
11-11082		Leonardo Jesus Ward Valdez
11-11085		Antonio Enrique Wimmer Miranda
11-11088		Shean Daniel Yllarramendi Fuentes
11-11094		Jose Antonio Alamo Vallejo
11-11103		Steffany Jelyth Gonzalez Quintero
11-11105		Jose Allendro Zurita Sanchez
11-11107		Oswaldo Dugarte Sanchez
11-11108		Benjamin Acevedo Palacios
11-11109		Josnelly Alejandra Alcala Sulbaran
11-11110		Ely Nazareth Alfonzo Leon
11-11111		Gabriel Alejandro Di Silvestre Marquez
11-11112		Juan Carlos Dominguez Gonzalez
11-11115		Aleska Sthephanie Lamus Rodriguez
11-11116		Willians Isnaldo Mora Diaz
11-11117		Anthonny Jose Vieira Gomez
11-11119		Dougleidys Daniela Fuenmayor Fajardo
11-11120		Henry Alberto Melendez Mora
11-11131		Adonis Eduardo Hernandez Alvarado
11-11145		Andrea Cutillas Boschetti
11-11156		Arturo Gregorio Castro Flores
11-11172		Daniela Alejandra Valdez Rivero
11-11173		Daniela Indira Gutierrez Tovar
11-11174		Danihan de Freitas Perdomo
11-11178		Deborah Estefania Mendes Lodato
11-11179		Dhameliz Annais Espinoza Zerpa
11-11189		Esteban de Jesus Puerta Mendoza
11-11191		Fabian Jesus Jaimes Arcia
11-11196		Gabriela Carolina Viloria Alvis
11-11197		Gaetano Armando Garofalo Jasan
11-11202		Gianfranco Mastrorosa Vargas
11-11204		Gisbely Yulesky Moyeja
11-11206		Gustavo Eduardo Vargas Moreno
11-11208		Henry Josue Melgarejo Huaman
11-11211		Hosmar Armando Colmenares Rodriguez
11-11217		Jesus Daniel Cisneros Noguera
11-11222		Jose Angel Santos Betancourt
11-11225		Jose Gregorio Castro Lazo
11-11227		Jose Ignacio Herrera Mendez
11-11228		Juan Carlos Ledezma Zapata
11-11236		Luis Alberto Rodriguez Rosendo
11-11239		Maggelys Elianis Perdomo Marin
11-11244		Maria Alejandra Diaz Contreras
11-11249		Maria Fernanda Diaz Anato
11-11252		Marisabel Cedeño Ojeda
11-11264		Oscar Enrique Guillen Rodriguez
11-11274		Ricardo Andres Di Zio
11-11283		Victor Gerardo Pignone Moreno
11-11312		Keyla Graciela Gonzalez Abad
11-11320		Hugo Rafael Tarazona Alviarez
11-11326		Francisco Gerardo Rivas Villalobos
11-11367		Elizabeth Yoselin Martin Reyes
11-11371		Yurjelis Briceño Marquez
11-11374		Gerardo David Galicia Rodriguez
11-11375		Elio Josue Barrueta Mijares
11-11377		Ildefonso Manuel Mata Espinoza
11-11380		Andrea Veronica Ramirez
11-11382		Marielbis Yessenia Hernandez Blanco
11-11391		Pablo Francisco Lupo Loyo
11-11392		Roman Jesus Camacho Ramirez
11-11393		Jesusroman Camacho Ramirez
11-11394		Stefani Carolina Castellanos Torres
11-11398		Marielena Aizaga Graterol
11-11404		Mariana Andreina Gonzalez Vargas
11-11407		Daniela Alexandra Santoyo Bautista
11-11412		Rafael Eduardo Acosta Marcano
11-11425		Doffiny Gabriel Mendoza
11-11426		Jhoana Carolina de Brito Fernandez
11-11429		Jose Angel Delgado Simancas
11-11431		Aimee Andreina Salazar Salcedo
11-11456		Evimar Castañeda Bastidas
11-11462		Ana Karina Ropero Fernandez
11-11468		Andreina del Valle Huerta Gonzalez
11-11487		Janet Stephanie Torre Mora
11-11498		Ricardo Rico
11-11500		Ricardo Javier Ceballos padron
11-11508		Vanessa Carolina Villalba
11-11509		Ariela Pardo Di Candia
11-11522		Reinaldo Andres Jacome Pinedo
11-11523		Wilson Jose Zerpa Morales
12-00289		Vanessa Henriquez Garcia
12-05080		Jesus Ignacio Salazar Flores
12-05385		Anibal Enrique Correa Rattia
12-05447		Diego Alejandro Bencomo Carrasquel
12-05510		Freddy Alexander Luque Guillen
12-05661		Alejandro del Rio Salas
12-05714		Maria Fernanda Mero Acosta
12-05854		Orlando Jesus Hernandez Vanegas
12-05912		Greily Andreina Rodriguez Saez
12-05917		Moises Alejandro Monzon Veitia
12-05957		Willian Leandro Gavidia Strubinger
12-05992		Jose David Ostos Oropeza
12-06355		Milagros Rivera Pertuz
12-06540		Ricardo Arturo Alvarez Ruch
12-06564		Gabriel Alexander Hernandez Rios
12-06627		Alejandro Jose Ortega Linares
12-06824		Bensedi Jose Acosta Barrios
12-08311		Gabriela Jose Guzman Romero
12-08418		Adriana Isabel Vasquez Vasquez
12-08454		Robert Alejandro Martinez Melo
12-10000		Daniel Alexander Mendoza Hereipa
12-10004		Manuel Alejandro Hurtado Rosales
12-10018		Jacinto Martin Jimenez
12-10020		Germain Jose Perdomo Perdomo
12-10023		Eduardo Jose Santa Cruz Arvelo
12-10025		Claudia Vanessa Florez Breidenbach
12-10027		Helio Ruben Girioli Fejure
12-10028		Yasmilet Guerrero Ramirez
12-10033		Erni Jesus Navarro Salinas
12-10040		Miriam Xurimar Cedeño Carrasquel
12-10041		Pedro Ismael Parra Camacho
12-10046		Alexis Florentino Gonzalez Alcala
12-10047		Angel Hung Fung Zhou
12-10052		Cristopher Enrique Noda Garcia
12-10054		Vicente Ramos Uzuriaga
12-10056		Estefania Zambrano Rivas
12-10061		Luis Alejandro Mata Salvatierra
12-10065		Andres Alexander Valdez
12-10067		Maria Elena Ramos Orozco
12-10068		Maria Fernanda Pineda Serra
12-10069		Jesus Alfonzo Mendez Arias
12-10071		Jose Miguel Tovar Torres
12-10075		Eduardo Jose Mata Galindez
12-10078		Eduardo Lodeiro Colatosti
12-10083		Chantal Lopez Procopio
12-10089		Eduardo Jose Montilva Guillen
12-10090		Daniel Rafael Gomez Infante
12-10096		Maria Carolina Mayorca D. Onofrio
12-10099		Yilber Esneker Patiño Gonzalez
12-10102		Andrea Estefania Martinez Cardenas
12-10105		Yilmar Teresa Gomez Vasquez
12-10109		Angelica Jose Lopez Zerpa
12-10116		Gabriela del Carmen Diaz Marin
12-10118		Gustavo Adolfo Cerrada Marquez
12-10122		Andrea Stephanie Quintana Zambrano
12-10127		Astrid Maria Alibrandi Ferrari
12-10128		Francisco Enrique Morillo Delgado
12-10131		Isabel Cristina Feito del Vecchio
12-10136		Juver Jose Rosillo Arellan
12-10141		Eduardo Ignacio Alvarez Brito
12-10148		Josmery de Matos de Barros
12-10152		Carlos Eduardo Arispe Aponte
12-10157		Launelly del Cobre Cecinato Cano
12-10165		Dalexis Tolosa Arias
12-10166		Diego Jose Guerrero
12-10175		Victoria Karina Franco Bastidas
12-10180		Raquel Andreina Mendoza Sanchez
12-10181		Manuel Alejandro Ojeda Albarracin
12-10191		Daniel Jesus Comas Betancourt
12-10193		Edison Jose Duran Rojas
12-10199		Nairelys Josefina Hernandez Sanchez
12-10201		Vito Antonio Melchionna Di Mattia
12-10206		Jose Gerardo Sucre Yejas
12-10209		Eduardo Jose Goncalves Rodriguez
12-10214		Fabio Luis Morales Hidalgo
12-10215		Yoisi Kristy Low Gonzalez
12-10218		Edgar Alfonzo Ledezma Paris
12-10219		Maria Andrea Molina Tirado
12-10222		Arnaldo Andres Lovera Alvarado
12-10223		Roberto Carmelo Messina Martins
12-10228		Miguel Alejandro Orozco Breton
12-10229		Pedro Alejandro Rondon Herrera
12-10230		Daniel Steven Levkovits Scherer
12-10239		Christian Lorenzo Velazquez Infante
12-10240		Benjamin Amos Amos Carta
12-10247		Franco Jose Caputo Manzolillo
12-10248		Soluraisma Maria Luciani Pinto
12-10249		Hector Raul Zambrano Chacon
12-10253		Valeria Izquierdo Zambrano
12-10254		Romer Enrique Mena Illarramendi
12-10260		Jose Antonio Trujillo Panza
12-10262		Gianfranco Comici Lamas
12-10264		Daniela Victoria Borrell Semeraro
12-10266		Marco Alejandro Lozano Bethke
12-10273		Jesus Elias Kauze Basanta
12-10284		Carlos Eduardo Hidalgo Vieira
12-10285		Diego Alexander Urbina Jimenez
12-10290		Daniela Daniela Azuaje Azuarta
12-10291		Natasha Sophia Medina Gil
12-10294		Maria Daniela Salazar Delgado
12-10300		Daniel Eduardo Guarecuco Aguiar
12-10305		Cristhian Yeison Da Silva Fernandez
12-10316		Carlos Eduardo Gonzalez Iglesias
12-10317		Ana Luisa Borjas Meneses
12-10344		Gabriel Duarte de Ayala Diaz
12-10347		Ricardo Antonio Capiello Bello
12-10348		Isabela Elisa Diaz Barrios
12-10349		Jimmy Daniel Vidal Rodriguez
12-10350		Gustavo Adolfo Arias Parra
12-10354		Andres Ernesto Avilan Rodriguez
12-10358		Maria Alejandra Hernandez Quintero
12-10359		Jesus Alejandro Marcano Marquez
12-10360		Carlos Alberto Gouveia Rincones
12-10361		Brian de Jesus Infante Lopez
12-10364		Krisbeth Alejandra Gonzalez Duque
12-10366		Diego Leonardo Peña Colaiocco
12-10375		Enderson Jose Guerra Salazar
12-10376		Magdeling Nazareth Ojeda Medina
12-10381		Jorge Cromwell Juarez MacHacuay
12-10385		Mixangel Alexandra Oropeza Rosales
12-10387		Adriana de Ponte Olivares
12-10400		Javier Alejandro Medina Salas
12-10401		Diana Yexireth Delgado Contreras
12-10402		Pablo Enrique Izquierdo Peña
12-10420		Eduardo Francisco Nunes Alvarez
12-10427		Lautaro Manuel Villalon Castillo
12-10432		Gabriel Alejandro Lesti Rivera
12-10437		Zujany Milagros Salazar Aquino
12-10438		Carlos Luis Perez Rosario
12-10442		Maria Valeria Rahme Alfonzo
12-10446		Jeckson Agustin Jaimes Contreras
12-10447		Wederman Isaac Silva Canelon
12-10456		Luis Fernando Aguirre Herrera
12-10463		Maria Virginia Ramirez Pereira
12-10465		Manuel Alberto Cabeza Luque
12-10466		Javier Alejandro Inojosa Moya
12-10467		Monica Guillan Carames
12-10468		Danielle Yorleny Oyague Solano
12-10470		Mervin Alexandra Quintero Breindembach
12-10472		Manuel Jesus Hernandez Aguilar
12-10476		Sabrina Salome Garcia Churion
12-10478		Laura Gabriela Navarro Longa
12-10482		Leslie Yesireth Soto Cardenas
12-10484		Ivanna Patricia Moreno Florez
12-10489		Tomas Andreas Borbely Lemoine
12-10501		Gustavo Enrique Silva Rios
12-10502		Cecilia Roselyn Galan Esquivel
12-10505		Luis Santiago Mora Diaz
12-10506		Javier Alberto Darder Palacios
12-10510		David Alejandro Correa Oliveira
12-10515		Francisco Alberto Rojas Key
12-10519		Jose Antonio Della Sala Pereira
12-10523		Adolfo Antonio Jeritson Huerta
12-10524		Tomas Andres Ochoa Galicia
12-10527		Jesus Rafael Valerio Valero
12-10530		Mary Andreina Leone Fernandez
12-10538		Frederick Alexander Klindt Jesurun
12-10541		Yisbeth Nakary Yarza Pire
12-10551		Bruno Colmenares Salamanca
12-10554		Maria Jose Oberto Pereira
12-10561		Pablo Ricardo Maldonado Montilva
12-10562		Ana Karina de Ponte de Ponte
12-10564		Marcos David Marquez Di Mella
12-10566		Juan Diego Porras Pocaterra
12-10572		Luis Jose Diaz Diaz
12-10573		Argenis Jesus Pelayo Nava
12-10575		Joana Alexandra Ramirez Ortiz
12-10577		Lisette Andreina Altuve Briceño
12-10578		Fabio Daniel Suarez Gorrin
12-10580		Luis Beltran Vasquez Mijares
12-10585		Ibrahim Gustavo Gordils Lusinchi
12-10589		Jorge Luis Cortez Giraldo
12-10591		Ruth Daniela Castillo Pinto
12-10601		Jose Miguel Romero Pabon
12-10603		Daniela Tesi Esteves
12-10606		Gilney Carolina Briceño Fernandez
12-10608		Virginia Antonella Briceño Fernandez
12-10613		Lalezka Isabel Duque Contreras
12-10614		Stephany Paola Guijarro Carracedo
12-10616		Karen Lucia Justo Rangel
12-10617		Andreina Duarte
12-10620		Luis Carlos Marval Zambrano
12-10621		Marialicia Suarez Castro
12-10622		Andres Eduardo Hernandez Farias
12-10625		Guillermo Jose Telleria Cisneros
12-10627		Mauricio Federico Salerno Garmendia
12-10630		Edwin Joel Franco Mero
12-10634		Paola Alejandra Maggino Luces
12-10636		Manuel Alejandro Ramirez Cabrejos
12-10639		Maria Fernanda Zambrano Tineo
12-10640		Victor Dario Zapata Roman
12-10644		Amanda de Jesus Camacho Rolon
12-10645		Alejandra del Carmen Cordero Garcia
12-10646		Marfred Josue Hernandez Torres
12-10647		Mayber Mariana Figueroa Romero
12-10648		Oriana Gabriela Pinto Salcedo
12-10650		Leonardo Andres Castillo Sabino
12-10660		Corcuera Pando Andre Enrique
12-10663		Veronica Andreina Lozada Lopez
12-10665		Erick Joshua Gelimich Romero
12-10669		Santiago Rene de la Fuente Blanco
12-10679		Grey Bosse Rondon Cardozo
12-10682		Manuel Guillermo Cabrera Gonzalez
12-10685		Maria Waleska Suarez Rodriguez
12-10686		Estefania Cristina Gonzalez Zubillaga
12-10689		Andres Ignacio MacIas Medina
12-10694		Eliot Gabriel Diaz Garcia
12-10696		Armando Andres Flores Colet
12-10698		Greg Emmanuel Spinetti Jimenez
12-10701		Oriana Andreina Esparragoza Velasquez
12-10703		Cristina Paz Rodriguez
12-10706		Ronald Alfonso Becerra Gil
12-10707		Isabella Grespan Vial
12-10708		Yolly Jose Diaz Millan
12-10714		Pedro Danis Ramirez Leon
12-10715		Jose Andres Melendez Carrizales
12-10716		Alvaro Luis Rodrigues Acosta
12-10724		Nicole Stefania Tavano Rangel
12-10731		Luis Eduardo Perez Solorzano
12-10734		Jose Gregorio Maghios Haddad
12-10736		Omar Jose Gomez Hernandez
12-10738		Victor Yovanni Garcia Carmona
12-10742		Mayra del Valle Alvarez Rivero
12-10757		Juan David Galeano Loaiza
12-10761		David Antonio Hernandez Viloria
12-10764		Bernardo Aceituno Cabezas
12-10769		Guillermo Enrique Olmos Ranalli
12-10771		David Alejandro Atias Martinez
12-10774		Miguel Angel Parra Salgado
12-10775		Juan Ignacio Cubillan Acevedo
12-10783		Juan Andres Laprea Diaz
12-10784		Brandon Alexander Lopez Rodulfo
12-10788		Jose Carlos Garcia Padrino
12-10791		Andres Eduardo Rojas Herrera
12-10796		Arturo Antonio Toro Ruiz
12-10803		Sophia Estephania Fakih Rojas
12-10808		Andrea Carolina de Sousa Cubero
12-10821		Pablo Alonso Velasquez Garrido
12-10828		Veruzka Thais Iglesias Salazar
12-10829		Gitanyaly Jaimes Garcia
12-10830		Angelica Maria Escobar Moreno
12-10836		Juliagny Gabriela Guillen Vasquez
12-10848		Jean Paul Alexander Lacour
12-10849		Angie Daniela Linares Casanova
12-10850		Gian Marco Fontana Gagliardi
12-10855		Edwar Joel Yepez Paredes
12-10860		Viviana Milagros Fajardo Altuve
12-10863		Daniel Eduardo Francis Zambrano
12-10866		Oriana Antonieta Morales Chacon
12-10867		Jose Miguel Perez Rodriguez
12-10872		Ricardo Mena de Fonseca
12-10875		Estefania Mairin Cortes Antia
12-10877		Andres Alejandro Payema Rodriguez
12-10882		Edymar Eunice Mijares Garcia
12-10887		Wilman Gabriel Rodriguez Odon
12-10890		Ariana Maurin Morales Rendon
12-10891		Maria Gabriela Ramirez Moreno
12-10892		Mariano Alberto Rodriguez Diaz
12-10893		Miguel Alfonso Miranda Lopez
12-10894		Ernesto Jose D. Angelo Lopez
12-10897		Maria Fernanda Gonzalez Gomez
12-10900		Victoria Inmaculada Colmenares Rodriguez
12-10903		Gianni Antonio Manilia Di Tommaso
12-10905		Samuel Jose Rujano Mota
12-10906		Alejandro Enrique Giron Morales
12-10909		Marcos Arturo Jota Caraballo
12-10911		Veronica Andreina Hevia Linares
12-10912		Jesus Jose Bueno
12-10920		Rosamaria Victoria Belisario Alfonzo
12-10921		Nathalia Carolina Silvera Gonzalez
12-10923		Oscar David Narvaez Luces
12-10925		Andres Suarez Figueroa
12-10928		Hector Agustin Lara Castillo
12-10929		Alexandra Jackeline Quiroz Restifo
12-10931		Gabriela Alexandra Palacio Jaimes
12-10935		Paola Valentina Rojas Chirino
12-10941		Norelys Marian Rumbos Carrasco
12-10950		Karina Andreina Gabanzo Garcia
12-10957		Carlos Eduardo Lorenzo Landaeta
12-10958		Carlos Javier Vazquez Rodriguez
12-10961		Luis Daniel Peña Chacon
12-10965		Luis Alfredo Pacheco Leon
12-10967		Alfredo Jose Fanghella Valero
12-10969		Clara Ines Fanega Rosas
12-10973		Lizamar Escobar Lavarte
12-10975		Paola Carolina Martinez Ficorilli
12-10977		Daniela Dos Ramos Laguna
12-10979		Sebastian Antonio Clavell Martinez
12-10982		Simon Guillermo Rodriguez Bandres
12-10986		Maria Laura Rodriguez Mogollon
12-10992		Rosmary Virginia de Abreu Acevedo
12-10997		Anna Maria Cafaro Crocamo
12-11001		Gianfranco Nicola Bitetto Caceres
12-11005		Diana Alejandra Fumero Maduro
12-11006		Gabriel Gimenez Catuogno
12-11009		Antonio Jose Herradez Hernandez
12-11012		Manuela Belisario Nava
12-11013		Jeancarlo Jose Leon Castillo
12-11014		Nievsabel Fireley Molina Ramos
12-11016		Simone Jose Bermudez Perez
12-11021		Andrha Lismar Aray Bustamante
12-11022		Manuel Alfredo de Freitas Perez
12-11030		Raynulfo Jesus Mata Negrette
12-11033		Maria Valentina Contreras Marquez
12-11035		Diego Gerardo Perez Gonzalez
12-11036		Jorge Antonio Osorio Ramirez
12-11043		Nicole Andreina Martinez Rojas
12-11044		Rolando Segundo Cortez Garcia
12-11048		Jeinybel Andrea Colmenares Clavo
12-11058		Rossy Virginia Pino Saez
12-11059		Carlos Alejandro Mendoza Rumbo
12-11060		Andres Eduardo Gomez Ramones
12-11063		Jose Miguel Cabrera Van Grieken
12-11067		Javier Alberto Vivas Veliz
12-11072		Cristopher Alejandro Hucul de Nobrega
12-11075		Anthony Joseph El Kareh Said
12-11076		Lilia Elena Alvarez Lopez
12-11077		Clareth Georgette Cañizales Diaz
12-11088		Ritces Coromoto Parra Barrios
12-11091		Alessandra Carina Marrero Bartolucci
12-11092		Antonio Jose Romero Alvarez
12-11094		Jesus Andres Soengas Fernandes
12-11095		Carlos Eduardo Sanoja Vanegas
12-11098		Jose Carlos Torres Boadas
12-11101		Julio Cesar Blanco Deniz
12-11104		Jose Gregorio Carrasquel Blanco
12-11106		Carlos Daniel Ramirez Pita
12-11113		Brenda Fabiana Farinha Fernandes
12-11115		Arianna Ginette Amaya Colina
12-11118		Carla Daniela Acosta Sira
12-11119		Carlos Gregorio Leal Mangano
12-11135		Jhon Kevin Torres Paredes
12-11136		Reinaldo Javier Malave Hernandez
12-11141		Nathasha Elizabeth Prieto Castillo
12-11142		Andres Eduardo Espinoza Marante
12-11146		Natasha Alessandra Dielingen Marrero
12-11152		Fernando Benjamin Perez Maurera
12-11153		Walter David Morales Alvarez
12-11158		Maria Esther Aponte Campos
12-11159		William Enrique Lopez Villasmil
12-11162		Victor David Sanchez Gomez
12-11163		Francisco Javier Marquez Hernandez
12-11164		Rosanna Andrea Ramirez Suarez
12-11167		Greanny Maria Vivas Diaz
12-11170		Andres Eduardo Cadenas Zerpa
12-11177		Adolfo Felipe Martinez Perez
12-11181		Kemberly Alviani la Cruz Aguilera
12-11182		Vanessa Fabiola Muttach Maltas
12-11183		Diego Armando Tovar Guillen
12-11184		Steffany Ivanny Strubinger Florez
12-11187		Maria Fernanda Castillo Dominguez
12-11188		Jesus Alberto Camejo Pacheco
12-11190		Maria Virginia Perez Estevez
12-11194		Sergio Jose Perez Rios
12-11195		Crisleysis del Valle Hernandez Tonito
12-11201		Arturo Jose Colmenares Calderon
12-11204		Juan Jose Jimenez Rojas
12-11214		Adriana Nicole Deftereos Medina
12-11226		Claudia Maria de Andrade Nascimento
12-11229		Edwin Daniel Marin Diaz
12-11231		Leidymar Trinidad Barbosa Rebolledo
12-11233		Ashley Draysmar Villarroel Pacheco
12-11235		Solangie Andreina Andrade Dos Santos
12-11243		Patricia Lupe Milanesi Sandoval
12-11245		Jenifer Viviana Samper Torbello
12-11247		Andres Eduardo Rocha Ferrer
12-11250		Natascha Sinai Gamboa Gomes
12-11251		Jefferson Jose Malpica Rondon
12-11260		Angel Eduardo Paez Linares
12-11276		Enrique Philippe Gutierrez Fedoruk
12-11277		Issam Kury Abi Nakhoul
12-11278		Luis Daniel Silvera Silvera
12-11281		Diego Daniel Pedroza Perez
12-11283		Andrea Mekel Nakhal
12-11284		Angel Alberto Galvis Rivas
12-11285		Raul Rafael Bander Moreno
12-11291		Victor Jose Fernandez Viloria
12-11298		Anne Angelica Lopez Behling
12-11302		Estefania Garcia Rodriguez
12-11303		Gabriel Alejandro Tochon Rodriguez
12-11311		Charlie Daniel Moreno Rangel
12-11314		Jonathan Enrique Reyes Santana
12-11315		Joseph Alexis Sosa Mijares
12-11317		Diego Ernesto Mendez Fuentes
12-11318		Fabiana Alejandra Hernandez Bruno
12-11325		Jose Luis Salas Gonzalez
12-11327		Linfray Estefany Porras Meza
12-11329		Andres Manuel Tavares Herrera
12-11334		Adrian Dezulovic Ortiz
12-11337		Daniela Michel Torres Hernandez
12-11346		Santiago Augusto Troconis Pages
12-11356		Cesar Enrique Rojas Rodriguez
12-11361		Kaina Teresa Bolivar Venegas
12-11366		Daleska Naomi Gonzalez Seoane
12-11386		Giovanna Andrea Aparicio Gutierrez
12-11392		Maria Gabriela Salazar Secada
12-11394		Jackeline Mercedes Martinez Dum
12-11395		Edgar Miguel Guzman Blanco
12-11401		Aguasanta Moreno Garcia
12-11402		Georvic Alejandro Tur Rojas
12-11412		Gianluque Antonio de Simone Hernandez
12-11414		Genesis de Jesus Azuaje Gil
12-11426		Gabriela Beatriz Franco Camelio
12-11429		Fedora Lucia Di Polo Pocovi
12-11431		Daniel Eduardo Pirrongelli Lopez
12-11435		Luis Fernando Yumgano Brito
12-11437		Patricia Andreina Marcano Torrealba
12-11440		Yaliani del Carmen Perez Duarte
12-11443		Jose Manuel Molina Catari
12-11450		Jose Manuel Mendez Jaimes
12-11453		Maglis Paola Martinez Lopez
12-11461		Zadkiel Germain Romero Suarez
12-11466		Freddy Augusto Igreda Carruyo
12-11468		Victoria Vanessa Torres Avendaño
12-11469		Juan Eduardo Casilla Camarillo
12-11471		Eder Augusto Buitrago Flores
12-11472		Christian Joel Arellano Monzon
12-11482		Venancio Enrique Besson Pedraza
12-11483		Josue David Carieles Chacon
12-11484		Pedro Alejandro Prato Cermeño
12-11490		Jesus Leonardo Goncalves Andrade
12-11494		Miguel Andres Angola Escalona
12-11499		Orlando Jose Chaparro Salazar
12-11505		Jose Manuel Martinez Fonseca
12-11509		Emanuel Esteban Sanchez Berrio
12-11511		Laura Marcela Rueda Villamizar
12-11517		Joseph Alberto Lopez Elias
12-11521		Amanda Milagros Morales Julio
12-11524		Andres Eduardo Fornez Rujano
12-11539		Alejandra Estefania Guerrero Luna
12-11543		Monica Cecilia Zarate Urgiles
12-11547		Adriana Raquel Navarro Guerrero
12-11555		Erick Salvador Flejan Tovar
12-11561		Dorianny Yuruani Molina Codella
13-03047		Brenda Ramos
13-03114		Alejandro Enrique Febres Diaz
13-03133		Jogsana Maria Carvallo Castellanos
13-03150		Mithcaill Werner Rodriguez
13-03208		Loreanny Gabriela Unda Diaz
13-03367		Wilneylis Anais Rodriguez Azuaje
13-03393		Michell Yukerly Duarte Ramos
13-03439		Oscar Andres Gonzalez Garcia
13-03537		Carlos Luis Andara Marin
13-03558		Alexis Maximiliano Duque Rios
13-03559		Sebastian Alexander Rios Millan
13-04281		Caren Nayarith Carmona Barazarte
13-04534		Tommy Yemallel Reyes Rangel
13-05112		Ariadna Elizabeth Caporale Gomez
13-08389		Nicole Alexandra Gomes Pita
13-08391		Genesis Stefany Rodriguez Pabon
13-08438		Joseph Saraid Lopez Mosquera
13-10000		Constanza Yulai Abarca Sarmiento
13-10004		Gabriel David Acebey Inojosa
13-10006		Jose Luis Acevedo Salazar
13-10017		Manuela Andreina Adriani Araujo
13-10031		Daniel Alejandro Aldana Iriza
13-10034		Maria Jose Alfonzo Leal
13-10040		Wilson Enrique Alvarez Navarrete
13-10044		Luis Eduardo Alvarez Valdivieso
13-10045		Oscar Daneil Alviarez Mendez
13-10054		Mariela Antillano Fernandez
13-10061		Fernando Aragon Medina
13-10067		Oscar Gregorio Arcas Gil
13-10069		Stefany Andreina Arcos Jimenez
13-10073		Felix Miguel Arias Ponente
13-10077		Daniel Alejandro Armao Perez
13-10089		Walkell Antonio Atopo Guevara
13-10095		Dansmar Giselle Avila Campozano
13-10099		Adriana Valentina Ayala Suarez
13-10114		Yurbanys Isabelys Barreto Reyes
13-10116		Alejandro Barrios
13-10125		Jose David Basanta Thomas
13-10126		Francisco Miguel Bastardo Carrano
13-10128		Yineska Erimar Becerra Borges
13-10137		Marco Antonio Benitez Briceño
13-10156		Rafael Andres Blanco Guerra
13-10160		Jonathan David Boada Mendoza
13-10163		Genesis Alexandra Bolivar Nieves
13-10167		Victor Anibal Borjas Castillo
13-10169		Victor Daniel Bosch Borno
13-10173		Jose Donato Bracuto Delgado
13-10176		Veronica Jose Bravo Zerpa
13-10184		Andres Alejandro Buelvas Vergara
13-10187		Keilly Alejandra Bulle Arias
13-10191		David Ernesto Cabeza Luque
13-10196		Maria Gabriela Cafarelli Ferrante
13-10214		Miguel Clemente Canedo Rodriguez
13-10218		Isabella Capecchi Van Schermbeek
13-10227		MacHado Duin Carlos Argenis
13-10230		Jonathan Aender Carpio Arellano
13-10234		Erick Jose Carretero Sarabia
13-10238		Naylin Carolina Carvajal Nouel
13-10240		Miguel Angel Casanova Medina
13-10243		Karolayn Dayana Castellar Rambal
13-10248		Paola Franshesca Castro Gerdel
13-10258		Gabriela Cerdeira Lerones
13-10268		Kevin Daniel Chacon Pereira
13-10272		Cindy Ga Kei Chang Yu
13-10279		Pierangela Chiafele Barreto
13-10291		Leonardo Jose Cisneros Sanchez
13-10295		Isram Javier Cobos Valera
13-10308		Daniela Coromoto Contreras Figuera
13-10331		Rafael Adrian Curra Ochoa
13-10336		Braulio Jose Da Silva Aponte
13-10339		Stefany Cristell Da Silva Mogollon
13-10341		Maurizio Roberto Dall Est Alvarez
13-10345		Maria Madelein de Abreu Ferreira
13-10349		Marielisa Betania de Andrade Marquez
13-10350		Andres Ricardo de Biase Añon
13-10356		Katherin Veronica de Leca Goncalves
13-10363		Aibel del Carmen del Vecchio David
13-10365		Airon Enrique Delgado Castillo
13-10377		Ricardo Rafael Diaz Garrido
13-10379		Katherine Lourdes Diaz MacIas
13-10382		Jose Hernan Diaz Perez
13-10395		Paola Daniela Dommar Plaza
13-10398		Miguel Angel Dos Reis de Nobrega
13-10400		Elian Sigel Duarte Manrique
13-10405		Deisy Duran Cristancho
13-10414		Greivex Rachel Escalona Manrique
13-10422		Fernando Emilio Escorcia Charris
13-10428		Adriana Patricia Estrada Owen
13-10432		Valentina Farhat Mendez
13-10434		Beatriz Elena Margarita Faundes Pinos
13-10445		Sergio Fernandez Afonso
13-10449		Manuel Antonio Fernandez Guevara
13-10458		Luisaura Andreina Figuera Tebres
13-10464		Veronica Judith Florentin Rosero
13-10466		Luis Alejandro Flores Baduel
13-10474		Mariana Carolina Fornerino Velasquez
13-10477		Laura Elena Fraile Ascunce
13-10482		Raydis Moises Franco Guerra
13-10488		Julio Enrique Fuenmayor Prieto
13-10491		Gabriel Galicia Rodriguez
13-10493		Stephanie Daniela Gallardo Hernandez
13-10506		Angie Paola Garcia Duque
13-10516		Alexander David Garcia Nuñez
13-10543		Victor Manuel Gomes Ribeiro
13-10544		Melanie Carolina Gomes Segovia
13-10557		Ricardo Goncalves Da Silva
13-10559		Ilda Stefania Goncalves de Freitas
13-10566		Aharom Gonzalez Anaure
13-10567		Daniela Alejandra Gonzalez Tovar
13-10575		Pablo Eduardo Gonzalez Castro
13-10578		Maria Fernanda Gonzalez Dulanto
13-10613		Desire Carolina Guerra Di Martino
13-10614		Johamelis Adolfina Guerrero Estrada
13-10615		Steven Antonio Guerrero Lara
13-10618		Winnert Mariana Guevara Leon
13-10622		Fabiana Isabella Guglielmelli Crivari
13-10625		Gabriel Eduardo Gutierrez Garcia
13-10632		Giancarlo Halabi Banchi
13-10634		Jimmy Gabriel Hasan Fernandes
13-10639		Luis Enrique Hernandez Aguilar
13-10648		Jean Claude Hernandez Meze
13-10649		Joshua Hernandez Ochoa
13-10652		Maria Auxiliadora Hernandez Rivero
13-10653		Isabel Maria Hernandez Rodriguez
13-10655		Luis Alejandro Hernandez Somaza
13-10662		Manuel Alejandro Herrera Ferreira
13-10665		n
13-10675		Antonio Jose Hung Merentes
13-10680		Gabriela Alejandra Indriago Hernandez
13-10681		Carlos Infante Infante Lopez
13-10684		Ainara Victoria Iriarte Agudelo
13-10687		Carmen Alicia Iturbe Mata
13-10690		Tatiana Sabrina Izquierdo Paez
13-10697		Reinaldo Jimenez
13-10723		Victor David Landaeta Roa
13-10732		Kit Alam Leung Chiang
13-10741		Luis Jesus Lira Salazar
13-10770		Yarima Gabriela Luciani Faccini
13-10777		Freddy Antonio MacHado Camacho
13-10780		Maria Fernanda MacHado Peña
13-10785		Nathalia Andrea Madrid Diaz
13-10786		Miguel Enrique Maestre Gallegos
13-10790		Pedro Jose Maldonado Gonzalez
13-10792		Kelly Andreina Malho de Abreu
13-10802		Conny Michelle Marcano Brito
13-10803		Jhoanelis Alejandra Marcano Castro
13-10804		Miguel Angel Marcano Diaz
13-10805		Irina Antoinette Marcano Fadlallah
13-10808		Erick Eduardo Marcial Bezonez
13-10833		Miguel Arturo Martinez Gutierrez
13-10834		Nahirobi Alexandra Martinez Jimenez
13-10838		Fabiola Mercedes Martinez Perez
13-10839		Alejandro David Martinez Riera
13-10846		Anakarina Mata Beltran
13-10853		Veronica Andreina Mazutiel Vargas
13-10856		Lucio David Mederos Duque
13-10859		Valentina Andrea Medina Diaz
13-10863		Jhoanna Isabel Medina Torrealba
13-10865		Yin Ling Mei Xue
13-10866		Jean Carlos Mejias Hernadez
13-10873		Wilson Daniel Mendez Orosco
13-10876		Cesar Augusto Mendoza Arguello
13-10877		Luis Carlos Mendoza Bohorquez
13-10891		Victor Alfonso Meza Guerrero
13-10895		Laura Isabel Miranda Julio
13-10910		Maria de los Angeles Montañez Osorio
13-10911		Ana Karina Montaño Alvarez
13-10913		Juan Andres Montenegro Vegas
13-10914		Yilda Rosina Montero Rodriguez
13-10925		Orlando Antonio Mora de Gouveia
13-10927		Barbara Susana Morales Coronado
13-10931		Angel Jesus Morante Martinez
13-10936		Rafael Arcangel Moreno Figueroa
13-10941		Rose Mery Moreno Orozco
13-10943		Veronica Maria Moreno Prevete
13-10959		Alejandro Jesus Muttach de Franca
13-10963		Paula Andreina Natera Benitez
13-10964		Alejandro Enrique Natera Leal
13-10968		Alvaro Alexander Navarro Valero
13-10973		Francisco Gabriel Nicassio Manuse
13-10974		Jose Alejandro Niebla Creazzola
13-10983		Marianna Patricia Noya Rampersad
13-10985		Joao Valerio Nunes de Gouveia
13-10986		Gabriela Nuñez
13-10988		Dylan Joel Nuñez Aldana
13-10991		Juan Diego Ocando Ruiz
13-11000		Christian Alexander Oliveros Labrador
13-11001		Carlos Eduardo Oliveros Marquez
13-11004		Joed Alejandra Olmos Nuez
13-11007		Kevin Jesus Oporto Hernandez
13-11010		Jennifer Mailyn Oropeza Sandoval
13-11019		Jesus Alejandro Ortiz Perez
13-11021		Juan Pablo Ortiz Tepedino
13-11024		Deyluz Lucia Osorio Ortega
13-11030		Jean Carlo Alejandro Ovalles Loyo
13-11034		Dailobinson Alexander Pacheco Ruiz
13-11037		Alejandra Daniela Padilla Azuaje
13-11043		Andrea Deyanira Palma Briceño
13-11044		Jose Ignacio Palma Misle
13-11050		Diego Rafael Parima Palacio
13-11051		Andreina Maria Alejandra Parra Barrios
13-11052		Jorge Javier Parra Padrino
13-11064		Miguel Orlando Peña Sanchez
13-11065		Vanessa Alexandra Peñuela Verburg
13-11067		Martin Jose Peralta Roa
13-11068		Elbelis Belisa Perdomo Colina
13-11069		Genesis Daniela Perdomo Medina
13-11075		Carlos Alberto Pereira Hernandez
13-11076		Idaly Betzabeth Pereira Maldonado
13-11077		Daniel Jose Pereira Reyes
13-11081		Arthur Cristhofher Perez Acevedo
13-11086		Aida del Carmen Perez Campos
13-11089		Carlos Adolfo Perez Feo
13-11103		Pierre Ramiro Perez Ramirez
13-11108		Jesus Eduardo Perez Vargas
13-11109		Indira Sasha Perez Vasquez
13-11114		Eduardo Henrique Pestana Pereira
13-11124		Victor David Pirela Garcia
13-11128		Samuel Johan Plasencia Coello
13-11134		Frank Angel Ponte Delgado
13-11144		Samuel Alejandro Quiñones Riera
13-11150		Arnaldo Alberto Quintero Segura
13-11156		Cisneros Corro Rafael Andres
13-11160		Daniel Alejandro Ramirez Cabrera
13-11170		Jesus Enrique Ramirez Serrano
13-11172		Alejandro Enrique Ramos Figuera
13-11187		Guillermo Andres Remiddi Gonzalez
13-11191		Anyeli Briseth Reyes Avila
13-11199		Jawil Marliott Ricauter Dodero
13-11205		Jhahir Jose Rivas Barrios
13-11209		Carolina Desiree Rivas Serio
13-11212		Fernando Jose Rivera Soto
13-11216		Carlos Rafael Rivero Panades
13-11223		Manuel David Rodriguez Bonilla
13-11242		Arianne Isabel Rodriguez Janer
13-11248		Angel David Rodriguez Niño
13-11264		Rubmary Daribeth Rojas Linarez
13-11270		Denylson Alejandro Romero Contreras
13-11271		Ivanhy Nagery Romero Guzman
13-11274		Alexander Arturo Romero San Andres
13-11275		Gilbers Alejandro Romero Suarez
13-11278		Nelson Enrique Rondon Quintero
13-11296		Alejandra Salas Gutierrez
13-11299		Alejandro Salazar Herrera
13-11301		Natalia Coral Salazar Marval
13-11303		Abelardo Jose Salazar Patiño
13-11310		n
13-11319		Virginia Vanessa Sanchez Patete
13-11341		David Alejandro Segura Martinez
13-11347		Carlos Alberto Serrada Granado
13-11349		Carlos Luis Serrano Barreto
13-11353		Luis Alfredo Sifontes Medina
13-11357		Cesar Eduardo Silva Espinoza
13-11362		Samuel Simeone
13-11368		Kevin Alberto Sorzano Mongel
13-11371		Arnaldo Ramon Sosa Rojas
13-11379		Gustavo Eduardo Suarez Rojas
13-11384		Jennifer Carolina Tammaro Fernandez
13-11386		Vanessa Maria Tapia Hernandez
13-11389		Giulianne Vanessa Tavano Rangel
13-11390		Yeison Daniel Teixeira Goncalves
13-11391		Jose Francisco Tejera Hernandez
13-11396		Angelo Tersillo Aleman
13-11411		Carlos Eduardo Torres Querales
13-11412		Gabriel Alexander Torres Ruiz
13-11417		Karen Tovar Molina
13-11426		Valentina Tsouroukdissian Alcala
13-11427		Genesis Marlene Tuozzo Izaguirre
13-11432		Nathalia Isabel Urbina Matos
13-11434		Humberto Jose Urdaneta Perez
13-11444		Fernando Jesus Vallejo Pabon
13-11447		Daniel Alessandro Varela Di Nuzzo
13-11449		Anniels Gabriel Vargas Garcia
13-11459		Fabianni Alexandra Vazquez Gonzalez
13-11506		Fernando Javier Yanez Lucero
13-11508		Samuel Jose Yendez Meza
13-11509		Jesus Gabriel Yepez Moreno
13-11512		Abrahan Daniel Zambrano Aldana
13-11523		Eglantine Zanders Garcia
13-11545		Nelly Guadalupe Morales Ortiz
96-28155		Ricardo Alexis Alvarez Jiron
96-28324		Leonor Chriqui Gonzalez
96-28485		Jhonnie Goncalves
96-28519		Ana Carolina Guarisma Carmona
96-28698		Nicolas F. Mendez Federico
97-29264		Alvaro Enrique Barboza Bello
97-29298		Basilio Manuel Bogado Marsa
97-29331		Jose Vicente Caiazzo Poleo
97-29700		Yelitza Margarita Jaramillo Acuña
97-29933		Julio Alberto Omana Gutierrez
97-30014		Daniel A. Ponticelli Lima
97-30247		Homer Pastor Vargas Alvarez
98-30315		Jean C. Abreu
98-30419		Samuel Beltran Rojas
98-30433		Isabel T. Blank Lopez de Ceballos
98-30564		Solay Maria Da Silva Nunes
98-30568		Luis Agustin Dalo Guevara
98-30582		Jesus Gilberto de Oliveira Escalona
98-30732		Aleksander Gonzalez
98-30962		Joel Alejandro Mercado Mata
98-30969		Marize Damaris Mijares Hernandez
98-31068		Maria Eugenia Peña Rodriguez
98-31279		Shun Sing Siem Feng
98-31348		Rosanna Valente Girado
98-31395		Yamilet A. Yanes Trujillo
99-31428		Adrianna C. Adrian Hernandez
99-31446		Maria F. Alvarez Gomez
99-31456		Rafael E Andara G
99-31492		Gian Franco Azzato Sordo
99-31508		Sergio Bartolome Navas
99-31591		Jose R. Carrero Leon
99-31592		Oxael Alberto Carrillo de Hijes
99-31609		Sahar Charara C.
99-31639		Alberto Croes M.
99-31641		Veronica e. Cuello Gonzale Z.
99-31683		Fabiana Dipolo Venegas
99-31691		Jorge E. Duque Narvaez
99-31744		Federico Flaviani Gustaferro
99-31763		Nicola Armando Furcolo Salazar
99-31778		Yelitza Elena Garcia Garcia
99-31796		Deris Amnilde Gil Martinez
99-31815		Marco Antonio Gonzalez Balza
99-31854		Isabel Cristina Guerrero de Armas
99-31861		Edwin Becquer Guilbert Sanchez
99-31887		Larissa Herrera Turchaninoff
99-31924		Luis Miguel Landaeta Bonelli
99-31926		Miguel Alfredo Lander Tepedino
99-31952		Victor J. Lomonaco Barazarte
99-31982		Jose Francisco Maldonado Vargas
99-31983		Mariuska Manaure Becerra
99-32010		Daniel A. Medina Rodriguez
99-32017		Andreina Mendez Baralt
99-32024		Jean C. Meninno Pardo
99-32035		Raimundo Mirisola Maraone
99-32045		Alejandro M. Monteverde E.
99-32088		Jose Juan Nieto Mendez
99-32112		Set Isaac Ortiz Monasterio
99-32114		Miguel E. Ortiz Parra
99-32174		Antonietta Veronica Pigliacampo Valladares
99-32224		Olaf Reitmaier Veracierta
99-32228		Marcos Retzignac Morales
99-32242		Argenis Enrique Rodriguez Rondon
99-32262		Miguel Angel Rodriguez Villamizar
99-32291		Francisco Javier Saavedra Cuevas
99-32305		Silvio Jesus Salierno de Meo
99-32334		Gelvis D. Sequera Zubillaga
99-32385		Juan C. Torres Bolivar
99-32408		Claudia Virginia Valecillos Girand
xencuestasusb		n
games		n
minaya		Minaya Villasa
nobody		nobody
propro		Liga Pro Pro
scastillo		Simon Castillo
sumafs1		SumaFS 1
vlinayo		Veronica Irene Linayo Vega
07-41255		Jorge Luis Moubayyed Crespo
08-10336		Luis Fernando Escalona Moreno
08-10480		Gabriela Maria Graf-Stillfried
08-10615		n
08-10732		Andres Edgardo Mendez Lucero
08-10814		Estefania De Los Angeles Ordaz Maurera
08-10832		Jose Rafael Paez Rivera
09-10047		n
09-10451		n
09-10460		Angel Eduardo Loreto Nevado
09-10604		Luis Santiago Palacios Moyano
09-10701		Marco Raphael Rebolledo Camarano
09-10866		Gustavo Andres Urich Angarita
09-10997		Jenniffer Carolina Oller Camacho
10-01299		Ana Victoria De Canha Regalado
10-10056		n
10-10170		Andreina Coromoto Cupello Subero
10-10174		Luis Alejandro Da Silva Bettencourt
10-10315		Miguel Gonzalez Segueri
10-10351		Luis Enrique Hernandez Maradey
10-10400		Rafael Angel Lugo Garcia
10-10462		Samuel Rafael Millan Petit
10-10531		Andreina Maria Pares Acosta
10-10545		Luis Alejandro Perez Bustos
10-10569		Karen Maria Pizarro Ruiz
10-10609		Diana Carolina Rivera Rosas
10-10657		Jorge Alejandro Russian Alibrandi
10-10658		Alexis Daniel Saade Coll
10-10659		Diego David Sabbagh Gonzalez
10-10704		Rangelys Josefina Sorrentino Sifontes
10-10725		Daniel Eduardo Toro Yepez
10-10820		Luis Miguel Escalona Otero
10-10829		Patricia Angelica Gonzalez Estaba
\.


--
-- Data for Name: sistemaCS_voto; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_voto" (id, idcat_id, idnom_id, uid_id) FROM stdin;
\.


--
-- Name: sistemaCS_voto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_voto_id_seq"', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: sistemaCS_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_categoria"
    ADD CONSTRAINT "sistemaCS_categoria_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_choice"
    ADD CONSTRAINT "sistemaCS_choice_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_imgnominacion_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_imgnominacion"
    ADD CONSTRAINT "sistemaCS_imgnominacion_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_nominacion_idcat_id_18520b2f8ff5d03e_uniq; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nominacion_idcat_id_18520b2f8ff5d03e_uniq" UNIQUE (idcat_id, unom_id, uid_id);


--
-- Name: sistemaCS_nominacion_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nominacion_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_question_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_question"
    ADD CONSTRAINT "sistemaCS_question_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_usuario"
    ADD CONSTRAINT "sistemaCS_usuario_pkey" PRIMARY KEY (uid);


--
-- Name: sistemaCS_voto_idcat_id_6dbd2338324ba85e_uniq; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_voto_idcat_id_6dbd2338324ba85e_uniq" UNIQUE (idcat_id, uid_id);


--
-- Name: sistemaCS_voto_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_voto_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: sistemaCS_choice_7aa0f6ee; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_choice_7aa0f6ee" ON "sistemaCS_choice" USING btree (question_id);


--
-- Name: sistemaCS_imgnominacion_9bbe0886; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_imgnominacion_9bbe0886" ON "sistemaCS_imgnominacion" USING btree (idnom_id);


--
-- Name: sistemaCS_imgnominacion_df5b9745; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_imgnominacion_df5b9745" ON "sistemaCS_imgnominacion" USING btree (idcat_id);


--
-- Name: sistemaCS_nominacion_71422c2d; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_nominacion_71422c2d" ON "sistemaCS_nominacion" USING btree (uid_id);


--
-- Name: sistemaCS_nominacion_a61012f2; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_nominacion_a61012f2" ON "sistemaCS_nominacion" USING btree (unom_id);


--
-- Name: sistemaCS_nominacion_df5b9745; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_nominacion_df5b9745" ON "sistemaCS_nominacion" USING btree (idcat_id);


--
-- Name: sistemaCS_usuario_uid_9ab466579ba6562_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_usuario_uid_9ab466579ba6562_like" ON "sistemaCS_usuario" USING btree (uid varchar_pattern_ops);


--
-- Name: sistemaCS_voto_71422c2d; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_71422c2d" ON "sistemaCS_voto" USING btree (uid_id);


--
-- Name: sistemaCS_voto_9bbe0886; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_9bbe0886" ON "sistemaCS_voto" USING btree (idnom_id);


--
-- Name: sistemaCS_voto_df5b9745; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_df5b9745" ON "sistemaCS_voto" USING btree (idcat_id);


--
-- Name: sistemaCS_voto_uid_id_5352d68629f21396_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_uid_id_5352d68629f21396_like" ON "sistemaCS_voto" USING btree (uid_id varchar_pattern_ops);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS__idnom_id_2f8015efdbde110e_fk_sistemaCS_nominacion_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_imgnominacion"
    ADD CONSTRAINT "sistemaCS__idnom_id_2f8015efdbde110e_fk_sistemaCS_nominacion_id" FOREIGN KEY (idnom_id) REFERENCES "sistemaCS_nominacion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_i_idcat_id_6d1f8868e425dc84_fk_sistemaCS_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_imgnominacion"
    ADD CONSTRAINT "sistemaCS_i_idcat_id_6d1f8868e425dc84_fk_sistemaCS_categoria_id" FOREIGN KEY (idcat_id) REFERENCES "sistemaCS_categoria"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_n_idcat_id_3e4ea2f3e61af080_fk_sistemaCS_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_n_idcat_id_3e4ea2f3e61af080_fk_sistemaCS_categoria_id" FOREIGN KEY (idcat_id) REFERENCES "sistemaCS_categoria"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_nom_unom_id_645cefd61f6cc73b_fk_sistemaCS_usuario_uid; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nom_unom_id_645cefd61f6cc73b_fk_sistemaCS_usuario_uid" FOREIGN KEY (unom_id) REFERENCES "sistemaCS_usuario"(uid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_nomi_uid_id_60047dac2663a317_fk_sistemaCS_usuario_uid; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nomi_uid_id_60047dac2663a317_fk_sistemaCS_usuario_uid" FOREIGN KEY (uid_id) REFERENCES "sistemaCS_usuario"(uid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_question_id_19f0a12a12f2a04a_fk_sistemaCS_question_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_choice"
    ADD CONSTRAINT "sistemaCS_question_id_19f0a12a12f2a04a_fk_sistemaCS_question_id" FOREIGN KEY (question_id) REFERENCES "sistemaCS_question"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_v_idcat_id_53df938c2083bc8d_fk_sistemaCS_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_v_idcat_id_53df938c2083bc8d_fk_sistemaCS_categoria_id" FOREIGN KEY (idcat_id) REFERENCES "sistemaCS_categoria"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_v_idnom_id_e1e95537a5d36d1_fk_sistemaCS_nominacion_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_v_idnom_id_e1e95537a5d36d1_fk_sistemaCS_nominacion_id" FOREIGN KEY (idnom_id) REFERENCES "sistemaCS_nominacion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_voto_uid_id_5352d68629f21396_fk_sistemaCS_usuario_uid; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_voto_uid_id_5352d68629f21396_fk_sistemaCS_usuario_uid" FOREIGN KEY (uid_id) REFERENCES "sistemaCS_usuario"(uid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

