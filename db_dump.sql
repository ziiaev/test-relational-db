--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-03-09 12:06:17 UTC

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
-- TOC entry 209 (class 1259 OID 25221)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO admin;

--
-- TOC entry 210 (class 1259 OID 25226)
-- Name: customers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.customers (
    id uuid NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    phone_number text NOT NULL
);


ALTER TABLE public.customers OWNER TO admin;

--
-- TOC entry 211 (class 1259 OID 25233)
-- Name: document_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.document_types (
    id uuid NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public.document_types OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 25307)
-- Name: employee_documents; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.employee_documents (
    id uuid NOT NULL,
    document_type_id uuid NOT NULL,
    employee_id uuid NOT NULL,
    document_fields jsonb
);


ALTER TABLE public.employee_documents OWNER TO admin;

--
-- TOC entry 220 (class 1259 OID 25324)
-- Name: employee_personal_infos; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.employee_personal_infos (
    id uuid NOT NULL,
    employee_id uuid NOT NULL,
    email text NOT NULL,
    phone_number text NOT NULL,
    birth_date date NOT NULL,
    sex text NOT NULL
);


ALTER TABLE public.employee_personal_infos OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 25336)
-- Name: employee_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.employee_roles (
    employee_id uuid NOT NULL,
    role_id uuid NOT NULL
);


ALTER TABLE public.employee_roles OWNER TO admin;

--
-- TOC entry 224 (class 1259 OID 25403)
-- Name: employee_units; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.employee_units (
    employee_id uuid NOT NULL,
    unit_id uuid NOT NULL
);


ALTER TABLE public.employee_units OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 25280)
-- Name: employees; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.employees (
    id uuid NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    summary text NOT NULL,
    position_id uuid NOT NULL
);


ALTER TABLE public.employees OWNER TO admin;

--
-- TOC entry 212 (class 1259 OID 25240)
-- Name: positions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.positions (
    id uuid NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.positions OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 25247)
-- Name: project_role_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.project_role_types (
    id uuid NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.project_role_types OWNER TO admin;

--
-- TOC entry 222 (class 1259 OID 25366)
-- Name: project_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.project_roles (
    project_id uuid NOT NULL,
    employee_id uuid NOT NULL,
    project_role_type_id uuid NOT NULL
);


ALTER TABLE public.project_roles OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 25292)
-- Name: project_technologies; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.project_technologies (
    project_id uuid NOT NULL,
    technology_id uuid NOT NULL
);


ALTER TABLE public.project_technologies OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 25268)
-- Name: projects; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.projects (
    id uuid NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    start_date date NOT NULL,
    end_date date,
    project_health text NOT NULL,
    project_status text NOT NULL,
    customer_id uuid NOT NULL
);


ALTER TABLE public.projects OWNER TO admin;

--
-- TOC entry 214 (class 1259 OID 25254)
-- Name: roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.roles (
    id uuid NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.roles OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 25261)
-- Name: technologies; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.technologies (
    id uuid NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.technologies OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 25386)
-- Name: units; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.units (
    id uuid NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    parent_unit_id uuid,
    unit_head_id uuid NOT NULL
);


ALTER TABLE public.units OWNER TO admin;

--
-- TOC entry 3425 (class 0 OID 25221)
-- Dependencies: 209
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20220309120231_InitialCreate	6.0.2
\.


--
-- TOC entry 3426 (class 0 OID 25226)
-- Dependencies: 210
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.customers (id, name, description, phone_number) FROM stdin;
a36a7550-f7c2-470d-b5fd-90ce26f8c37a	IHS Markit	IHS Markit is the leading source of information and insight in critical areas that shape today's business landscape.	+1 800 447 2273
\.


--
-- TOC entry 3427 (class 0 OID 25233)
-- Dependencies: 211
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.document_types (id, name, description) FROM stdin;
639e893b-ed44-4bc8-91c3-be701c982301	Diploma of Higher Education	Diploma of Higher Education of employee
651ccf07-4142-40cc-bf7e-0443b636e1bc	Labor contract	Labor contract of employee
590b466a-4136-4e58-9254-3228cfdcd972	Passport	The official identity document of the owner.
968dca58-1799-4c76-8e35-043cfdc934fb	Certificate	Achievement certificate
\.


--
-- TOC entry 3435 (class 0 OID 25307)
-- Dependencies: 219
-- Data for Name: employee_documents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.employee_documents (id, document_type_id, employee_id, document_fields) FROM stdin;
9647ea94-9819-4f28-84bd-70bbc8a2e38a	590b466a-4136-4e58-9254-3228cfdcd972	2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499	{"date_to": "2030-08-11", "date_from": "2020-08-11", "passport_number": "AN9617850", "personal_number": 1964924}
69e21c09-a42e-4845-b009-453327851728	590b466a-4136-4e58-9254-3228cfdcd972	ec602f56-1e97-43d9-b3c0-6be0eae86caf	{"date_to": "2030-08-11", "date_from": "2020-08-11", "passport_number": "AN2211306", "personal_number": 1569516}
dd6216b2-74b7-45b1-bbb8-5d4f5bf95821	590b466a-4136-4e58-9254-3228cfdcd972	cfb8af2e-7960-4e6c-a7f6-746b6cb16bce	{"date_to": "2030-08-11", "date_from": "2020-08-11", "passport_number": "AN1301292", "personal_number": 5544431}
14928bc8-db8e-45cb-9c51-8561f64be11e	590b466a-4136-4e58-9254-3228cfdcd972	59a154d5-adeb-4c96-a562-96dc51cb4f08	{"date_to": "2030-08-11", "date_from": "2020-08-11", "passport_number": "AN2999397", "personal_number": 9830122}
ff1b1940-c450-4c6c-b48c-a0d70825de06	590b466a-4136-4e58-9254-3228cfdcd972	5a52c925-01a9-407e-b7f4-71847fed885e	{"date_to": "2030-08-11", "date_from": "2020-08-11", "passport_number": "AN5045106", "personal_number": 3486111}
7fbb0c63-9f1f-4c3f-a62a-59c6e465bca3	590b466a-4136-4e58-9254-3228cfdcd972	5d8607c6-8973-4aa1-9082-1ecf7ed7c6ba	{"date_to": "2030-08-11", "date_from": "2020-08-11", "passport_number": "AN2559927", "personal_number": 7935945}
\.


--
-- TOC entry 3436 (class 0 OID 25324)
-- Dependencies: 220
-- Data for Name: employee_personal_infos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.employee_personal_infos (id, employee_id, email, phone_number, birth_date, sex) FROM stdin;
2fd9f272-9f02-49d7-8f8d-04dcc5e82111	ec602f56-1e97-43d9-b3c0-6be0eae86caf	emil_ziiaev@epam.com	+375 33 123 45 67	1995-01-01	Male
67954d65-4f62-40e1-84ff-c1b91e0fa89d	2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499	aliaksandr_dabratsou@epam.com	+375 33 123 45 68	1987-01-01	Male
ce9043a3-00ae-4c67-8f91-91ee570d93e9	59a154d5-adeb-4c96-a562-96dc51cb4f08	viktoriia_gorneva@epam.com	+375 33 123 45 69	1999-01-01	Female
3be461a7-fcac-47e8-9169-24659d20cf7e	cfb8af2e-7960-4e6c-a7f6-746b6cb16bce	maksim_fedaryshyn@epam.com	+375 33 123 45 70	2000-01-01	Male
b2675472-0fd1-4de3-a123-2fa2fd4d163a	5a52c925-01a9-407e-b7f4-71847fed885e	vigen_simonyan@epam.com	+375 33 123 45 71	1995-01-01	Male
f8b44caa-60bf-44cc-844c-055050b188f2	5d8607c6-8973-4aa1-9082-1ecf7ed7c6ba	ekaterina_kuksenok@epam.com	+375 33 123 45 72	1999-01-01	Female
\.


--
-- TOC entry 3437 (class 0 OID 25336)
-- Dependencies: 221
-- Data for Name: employee_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.employee_roles (employee_id, role_id) FROM stdin;
2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499	43ae4e54-3736-4ba2-875e-94c0535ad6ae
4261c9d3-ef3a-4138-8a0d-89a96509256c	43ae4e54-3736-4ba2-875e-94c0535ad6ae
\.


--
-- TOC entry 3440 (class 0 OID 25403)
-- Dependencies: 224
-- Data for Name: employee_units; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.employee_units (employee_id, unit_id) FROM stdin;
2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
ec602f56-1e97-43d9-b3c0-6be0eae86caf	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
cfb8af2e-7960-4e6c-a7f6-746b6cb16bce	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
59a154d5-adeb-4c96-a562-96dc51cb4f08	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
5a52c925-01a9-407e-b7f4-71847fed885e	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
4261c9d3-ef3a-4138-8a0d-89a96509256c	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
e00e07ce-efc3-4d43-a66e-81e07b320d59	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
67559664-1567-4373-946e-fda9810d63fe	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
83309bbb-abbb-474b-a33b-74cc2ae4783e	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
5d8607c6-8973-4aa1-9082-1ecf7ed7c6ba	090dd3e6-ad4a-485a-9017-3ee6cda88e2d
2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499	7c561ed7-36e6-41ab-8c27-bb18bce3085f
ec602f56-1e97-43d9-b3c0-6be0eae86caf	7c561ed7-36e6-41ab-8c27-bb18bce3085f
cfb8af2e-7960-4e6c-a7f6-746b6cb16bce	7c561ed7-36e6-41ab-8c27-bb18bce3085f
59a154d5-adeb-4c96-a562-96dc51cb4f08	7c561ed7-36e6-41ab-8c27-bb18bce3085f
83309bbb-abbb-474b-a33b-74cc2ae4783e	7c561ed7-36e6-41ab-8c27-bb18bce3085f
5a52c925-01a9-407e-b7f4-71847fed885e	224509d8-1437-4c2f-a30a-882b2d0aa240
4261c9d3-ef3a-4138-8a0d-89a96509256c	224509d8-1437-4c2f-a30a-882b2d0aa240
67559664-1567-4373-946e-fda9810d63fe	224509d8-1437-4c2f-a30a-882b2d0aa240
5d8607c6-8973-4aa1-9082-1ecf7ed7c6ba	224509d8-1437-4c2f-a30a-882b2d0aa240
\.


--
-- TOC entry 3433 (class 0 OID 25280)
-- Dependencies: 217
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.employees (id, first_name, last_name, summary, position_id) FROM stdin;
2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499	Aliaksandr	Dabratsou	- 15+ year experience in IT with with primarly .NET, Python and Javascript languages,\nincluding frontend (HTML5, CSS, ReactJS, ASP.NET),\ndatabase development (MySQL, Oracle, Postgres, MS SQL, Azure SQL + SSDT),\ncloud solutions (Azure Web API, Azure Search, Functions, Active Directory, Storage, App Insights),\nhands-on experience in many communication technologies (REST, WCF, SOAP, Remoting, AMQP, MQTT, SignalR)\nand complex troubleshooting (memory leaks, performance bottlenecks, memory dump analysis),\nDevOps activities (Azure Pipelines, Ansible, Kubernetes, Docker, Terraform, Helm).\n- Various size projects with teams up to 1500 people including MTS (Russian telecom operator with 100M+ subscribers), Hoffmann Group (Germany, tooling), Enprecis (USA, survey analytics solutions), Thomson Reuters, Platts (S&P Global).\n- Certified Azure Solution Architect and Devops (AZ-303/304 and AZ-400)	24e0538a-3bda-4aa6-8461-0a3931ed7130
ec602f56-1e97-43d9-b3c0-6be0eae86caf	Emil	Ziiaev	- 5+ year experience in developing back-end applications using .NET, C#\n- experience in OOP application design, design patterns, SOLID.\n- experience in developing MVC, Web API applications.\n- 2 year experience in Game development using UNITY 3D Engine\n- 2+ year experience in developing frontend applications using (Angular, TypeScript, JavaScript, HTML5, CSS)\n- database development (Postgres, MS SQL),\n- hands-on experience in several communication technologies (REST, WCF, SOAP, SignalR),\n- troubleshooting (memory leaks, performance bottlenecks)	945f1974-2286-4854-80f3-8db86db5f2ca
cfb8af2e-7960-4e6c-a7f6-746b6cb16bce	Maksim	Fedaryshyn	- 2+ years experience in developing back-end applications using .NET Framework, .Net Core, C#\n- experience in OOP application design, design patterns, SOLID.\n- experience in developing MVC, Web API applications.\n- database development (Postgres, MS SQL),\n- cloud experience : AWS\n- troubleshooting	ea39fe1c-56ad-45f7-889f-b6dee14c783f
59a154d5-adeb-4c96-a562-96dc51cb4f08	Viktoriia	Gorneva	• 1,5+ years of experience as a C# Back-End Developer\n• Experience working with .NET Core, .NET Framework, ASP .NET MVC, Entity Framework, ADO.NET\n• Worked successfully with the following databases: SQL Server, PostgreSQL, MongoDB\n• Developed skills in optimization of queries (lazy loading and other EF features), creation of new entities and relationships between them, the extension of API functionality using gRPC\n• Familiar with designing and developing new services\n• Experience in deploying these services as Docker Containers on Kubernetes cluster\n• Experience in front-end development: created apps on Angular, used React and of course JS, TS	ea39fe1c-56ad-45f7-889f-b6dee14c783f
5a52c925-01a9-407e-b7f4-71847fed885e	Vigen	Simonyan	I am a full stack engineer with stacks primarily in .NET and JS. More precisely, I have experience in .NET MVC, .NET API, react JS, angular JS, jquery and go js. Also, I have experience in web scraping in python.\n\nI have participated in 3 projecs throughout my career. The projects were different in terms of my responsibilities and ranged from creating back end and front end parts to scraping data from web.	ea39fe1c-56ad-45f7-889f-b6dee14c783f
4261c9d3-ef3a-4138-8a0d-89a96509256c	Aliaksandr	Koush	Software Engineering Team Leader with the main focus in Teams building, development and motivation.\nExperienced in Delivery Management, Project Coordination, Resource Management.\nCertified EPAM technical interviewer.\n\n• .Net developer with more than 12 years of production experience in back-end and front-end development of web and desktop applications.\n\n• Accountable for stuffing, leading and coordinating Teams. Responsibilities include Project delivery, communication with the Customer, working on the requirements, solving different architectural questions and organizing Agile SDLC.\n\n• Client Projects include: TMNAS (Insurance), PLEX (ERP system in the Cloud), TriZetto (Health Care Management), Thomson Reuters (Financial Markets).	0e0e9b55-f0be-407e-9935-9130d222e210
e00e07ce-efc3-4d43-a66e-81e07b320d59	Vadim	Bortsov	Head of Microsoft Division - EPAM Systems	9a662f7b-d2b2-4040-8505-1289cfc7ced4
67559664-1567-4373-946e-fda9810d63fe	Artsiom	Ramanenia	Software engineer with about 10 years of experience in software development. Almost totally specialized in .Net technologies and web development. Have rudimentary experience with PHP and some of it`s frameworks.\n\nMy major interest in software development is a software architecture and design, low level details of underlying technologies (e.g. insides of .net framework, ms sql server etc.), protocols, algorythms and data structures. Also I am very interested in cryptography (and security in general) and artificial neural networks, but have only very basic knowledge of both.\n\nTechnologies: .Net framework, ASP.NET MVC and ASP.NET WebAPI, Asp Net Core, SignalR, ADO.NET, Enity Framework, EF Core, WPF, WCF, VS extensions, javascript (Angular 2+, React JS, knockout, angularJS, jQuery), Bootstrap, Amazon AWS API (EC2 and S3), Azure\nVersion control: TFS, SVN, Git	945f1974-2286-4854-80f3-8db86db5f2ca
83309bbb-abbb-474b-a33b-74cc2ae4783e	Aleh	Baslak	- Experienced .NET\\ReactJS Full-Stack Developer. Hands-on experience in other languages: Java, C++, Python. Prefer .NET Core\n- Redesigned Elasticsearch interaction on the last project (both, indexing and querying), increased its performance\n- Completed with excellence .NET Mentoring for L1, L2, Azure Mentoring\n- Certified as Professional Cloud Architect, Azure Developer Associate\n- Acted temporarily as a lead deputy\n- Mentored less experienced colleagues\n- Worked in appliance with Scrum and Kanban\n- Worked in a globally distributed multicultural team\n- Domain: CNC Machining	945f1974-2286-4854-80f3-8db86db5f2ca
5d8607c6-8973-4aa1-9082-1ecf7ed7c6ba	Ekaterina	Kuksenok	• .NET software developer with 8 years of hands-on experience in enterprise projects.\nAdditional 2 years of experience in another roles in development process (mostly as business-analyst)\n• Good knowledge of relational databases (MS SQL Server, PostgreSQL, Oracle);\n• Worked in agile mode and had solution-oriented approach\n• Experienced in sprint estimates, code reviewing, coordinating release processes\n• Extensive experience in communicating with customers in order to develop and clarify the project requirements\n• Have resource pool including subpools for more than a year\n• Coordinator of .NET technical interview activities in Saint-Petersburg location\n• Demonstrated proficiency in interviewing the candidates as well as leading and mentoring the newcomers\n• Fan of visiting .NET community meet-ups and conferences, was a conference presenter and expert several times\n• Oriented to the team success person	945f1974-2286-4854-80f3-8db86db5f2ca
\.


--
-- TOC entry 3428 (class 0 OID 25240)
-- Dependencies: 212
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.positions (id, name) FROM stdin;
0e0e9b55-f0be-407e-9935-9130d222e210	Software Engineering Team Leader
24e0538a-3bda-4aa6-8461-0a3931ed7130	Lead Software Engineer
945f1974-2286-4854-80f3-8db86db5f2ca	Senior Software Engineer
ea39fe1c-56ad-45f7-889f-b6dee14c783f	Software Engineer
9a662f7b-d2b2-4040-8505-1289cfc7ced4	Director, Software Engineering
\.


--
-- TOC entry 3429 (class 0 OID 25247)
-- Dependencies: 213
-- Data for Name: project_role_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.project_role_types (id, name, description) FROM stdin;
61ba8568-bd24-45b2-bfe3-c29daf7a255c	Technical Team Lead	Technical Team Lead
c3a520e4-5e5c-429e-9f70-8de3fdeab03d	Key developer	Key developer
9647ea94-9819-4f28-84bd-70bbc8a2e38a	Deeloper	Deeloper
\.


--
-- TOC entry 3438 (class 0 OID 25366)
-- Dependencies: 222
-- Data for Name: project_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.project_roles (project_id, employee_id, project_role_type_id) FROM stdin;
8629f984-5718-4584-b997-a28d4eb71fe7	2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499	61ba8568-bd24-45b2-bfe3-c29daf7a255c
8629f984-5718-4584-b997-a28d4eb71fe7	ec602f56-1e97-43d9-b3c0-6be0eae86caf	c3a520e4-5e5c-429e-9f70-8de3fdeab03d
8629f984-5718-4584-b997-a28d4eb71fe7	cfb8af2e-7960-4e6c-a7f6-746b6cb16bce	9647ea94-9819-4f28-84bd-70bbc8a2e38a
8629f984-5718-4584-b997-a28d4eb71fe7	59a154d5-adeb-4c96-a562-96dc51cb4f08	9647ea94-9819-4f28-84bd-70bbc8a2e38a
8629f984-5718-4584-b997-a28d4eb71fe7	5a52c925-01a9-407e-b7f4-71847fed885e	9647ea94-9819-4f28-84bd-70bbc8a2e38a
8629f984-5718-4584-b997-a28d4eb71fe7	5d8607c6-8973-4aa1-9082-1ecf7ed7c6ba	c3a520e4-5e5c-429e-9f70-8de3fdeab03d
\.


--
-- TOC entry 3434 (class 0 OID 25292)
-- Dependencies: 218
-- Data for Name: project_technologies; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.project_technologies (project_id, technology_id) FROM stdin;
8629f984-5718-4584-b997-a28d4eb71fe7	ecf89a55-9140-48f5-9cee-2444d011bab4
8629f984-5718-4584-b997-a28d4eb71fe7	4fa5344f-9503-4095-b537-83a2c1372597
8629f984-5718-4584-b997-a28d4eb71fe7	52c04e02-7ac5-43c6-9b40-200e6cdb8cf0
8629f984-5718-4584-b997-a28d4eb71fe7	5562419b-3f2b-4535-8059-5646eff17eb8
8629f984-5718-4584-b997-a28d4eb71fe7	b742170a-95ea-42e8-aea5-85460e16e89e
8629f984-5718-4584-b997-a28d4eb71fe7	935dd609-0788-4941-b275-e6e8e155aa82
\.


--
-- TOC entry 3432 (class 0 OID 25268)
-- Dependencies: 216
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.projects (id, name, description, start_date, end_date, project_health, project_status, customer_id) FROM stdin;
8629f984-5718-4584-b997-a28d4eb71fe7	IHSE_ULTR	Ultra Violet is a software development initiative for the Engineering Intelligence business line. EPAM has been contracted to bring specific data platform development, data science, and application development skills to the team.	2021-02-09	2022-12-31	Green	Active	a36a7550-f7c2-470d-b5fd-90ce26f8c37a
\.


--
-- TOC entry 3430 (class 0 OID 25254)
-- Dependencies: 214
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles (id, name, description) FROM stdin;
43ae4e54-3736-4ba2-875e-94c0535ad6ae	Resource Manager	Resource managers assist project managers with human resources planning and staff allocation. They determine a company's capacity to meet the staffing requirement of projects, assign personnel to projects, and hire new employees. They may also manage payrolls and train staff.
3c491773-3cb9-4354-ae5c-95301a876b61	Software Engineer	Software engineers design and create computer systems and applications to solve real-world problems.
\.


--
-- TOC entry 3431 (class 0 OID 25261)
-- Dependencies: 215
-- Data for Name: technologies; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.technologies (id, name) FROM stdin;
ecf89a55-9140-48f5-9cee-2444d011bab4	Microsoft Azure
4fa5344f-9503-4095-b537-83a2c1372597	PostgreSQL
52c04e02-7ac5-43c6-9b40-200e6cdb8cf0	.NET 6
49925c65-cb2c-4ac1-88ab-fedac63daa82	Java
5562419b-3f2b-4535-8059-5646eff17eb8	Docker
2973d8a4-ad24-48a4-bce8-9049c926e5d4	MSSQL
b742170a-95ea-42e8-aea5-85460e16e89e	Amazon Cloud
935dd609-0788-4941-b275-e6e8e155aa82	Stardog
\.


--
-- TOC entry 3439 (class 0 OID 25386)
-- Dependencies: 223
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.units (id, name, description, parent_unit_id, unit_head_id) FROM stdin;
090dd3e6-ad4a-485a-9017-3ee6cda88e2d	MSTD	Microsoft Development Network	\N	e00e07ce-efc3-4d43-a66e-81e07b320d59
224509d8-1437-4c2f-a30a-882b2d0aa240	Limon Team	Unit of Aliaksandr Koush	090dd3e6-ad4a-485a-9017-3ee6cda88e2d	4261c9d3-ef3a-4138-8a0d-89a96509256c
7c561ed7-36e6-41ab-8c27-bb18bce3085f	The roof is on fire	Unit of Aliaksandr Dabratsou	090dd3e6-ad4a-485a-9017-3ee6cda88e2d	2bcc2ca0-0ee4-4dd1-84f9-8cbb11a63499
\.


--
-- TOC entry 3227 (class 2606 OID 25225)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 3229 (class 2606 OID 25232)
-- Name: customers pk_customers; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 25239)
-- Name: document_types pk_document_types; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.document_types
    ADD CONSTRAINT pk_document_types PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 25313)
-- Name: employee_documents pk_employee_documents; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_documents
    ADD CONSTRAINT pk_employee_documents PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 25330)
-- Name: employee_personal_infos pk_employee_personal_infos; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_personal_infos
    ADD CONSTRAINT pk_employee_personal_infos PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 25340)
-- Name: employee_roles pk_employee_roles; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT pk_employee_roles PRIMARY KEY (employee_id, role_id);


--
-- TOC entry 3269 (class 2606 OID 25407)
-- Name: employee_units pk_employee_units; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_units
    ADD CONSTRAINT pk_employee_units PRIMARY KEY (employee_id, unit_id);


--
-- TOC entry 3245 (class 2606 OID 25286)
-- Name: employees pk_employees; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 25246)
-- Name: positions pk_positions; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT pk_positions PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 25253)
-- Name: project_role_types pk_project_role_types; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_role_types
    ADD CONSTRAINT pk_project_role_types PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 25370)
-- Name: project_roles pk_project_roles; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT pk_project_roles PRIMARY KEY (project_id, employee_id, project_role_type_id);


--
-- TOC entry 3248 (class 2606 OID 25296)
-- Name: project_technologies pk_project_technologies; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_technologies
    ADD CONSTRAINT pk_project_technologies PRIMARY KEY (project_id, technology_id);


--
-- TOC entry 3242 (class 2606 OID 25274)
-- Name: projects pk_projects; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT pk_projects PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 25260)
-- Name: roles pk_roles; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 25267)
-- Name: technologies pk_technologies; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT pk_technologies PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 25392)
-- Name: units pk_units; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT pk_units PRIMARY KEY (id);


--
-- TOC entry 3249 (class 1259 OID 25418)
-- Name: ix_employee_documents_document_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_employee_documents_document_type_id ON public.employee_documents USING btree (document_type_id);


--
-- TOC entry 3250 (class 1259 OID 25419)
-- Name: ix_employee_documents_employee_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_employee_documents_employee_id ON public.employee_documents USING btree (employee_id);


--
-- TOC entry 3253 (class 1259 OID 25420)
-- Name: ix_employee_personal_infos_employee_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX ix_employee_personal_infos_employee_id ON public.employee_personal_infos USING btree (employee_id);


--
-- TOC entry 3256 (class 1259 OID 25421)
-- Name: ix_employee_roles_role_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_employee_roles_role_id ON public.employee_roles USING btree (role_id);


--
-- TOC entry 3267 (class 1259 OID 25422)
-- Name: ix_employee_units_unit_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_employee_units_unit_id ON public.employee_units USING btree (unit_id);


--
-- TOC entry 3243 (class 1259 OID 25423)
-- Name: ix_employees_position_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_employees_position_id ON public.employees USING btree (position_id);


--
-- TOC entry 3259 (class 1259 OID 25425)
-- Name: ix_project_roles_employee_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_project_roles_employee_id ON public.project_roles USING btree (employee_id);


--
-- TOC entry 3260 (class 1259 OID 25426)
-- Name: ix_project_roles_project_role_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_project_roles_project_role_type_id ON public.project_roles USING btree (project_role_type_id);


--
-- TOC entry 3246 (class 1259 OID 25427)
-- Name: ix_project_technologies_technology_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_project_technologies_technology_id ON public.project_technologies USING btree (technology_id);


--
-- TOC entry 3240 (class 1259 OID 25428)
-- Name: ix_projects_customer_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_projects_customer_id ON public.projects USING btree (customer_id);


--
-- TOC entry 3263 (class 1259 OID 25429)
-- Name: ix_units_parent_unit_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_units_parent_unit_id ON public.units USING btree (parent_unit_id);


--
-- TOC entry 3264 (class 1259 OID 25430)
-- Name: ix_units_unit_head_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_units_unit_head_id ON public.units USING btree (unit_head_id);


--
-- TOC entry 3274 (class 2606 OID 25314)
-- Name: employee_documents fk_employee_documents_document_types_document_type_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_documents
    ADD CONSTRAINT fk_employee_documents_document_types_document_type_id FOREIGN KEY (document_type_id) REFERENCES public.document_types(id) ON DELETE CASCADE;


--
-- TOC entry 3275 (class 2606 OID 25319)
-- Name: employee_documents fk_employee_documents_employees_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_documents
    ADD CONSTRAINT fk_employee_documents_employees_employee_id FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 3276 (class 2606 OID 25331)
-- Name: employee_personal_infos fk_employee_personal_infos_employees_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_personal_infos
    ADD CONSTRAINT fk_employee_personal_infos_employees_employee_id FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 3277 (class 2606 OID 25341)
-- Name: employee_roles fk_employee_roles_employees_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT fk_employee_roles_employees_employee_id FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 3278 (class 2606 OID 25346)
-- Name: employee_roles fk_employee_roles_roles_role_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT fk_employee_roles_roles_role_id FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 3284 (class 2606 OID 25408)
-- Name: employee_units fk_employee_units_employees_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_units
    ADD CONSTRAINT fk_employee_units_employees_employee_id FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 3285 (class 2606 OID 25413)
-- Name: employee_units fk_employee_units_units_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employee_units
    ADD CONSTRAINT fk_employee_units_units_unit_id FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;


--
-- TOC entry 3271 (class 2606 OID 25287)
-- Name: employees fk_employees_positions_position_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_positions_position_id FOREIGN KEY (position_id) REFERENCES public.positions(id) ON DELETE CASCADE;


--
-- TOC entry 3279 (class 2606 OID 25371)
-- Name: project_roles fk_project_roles_employees_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT fk_project_roles_employees_employee_id FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 3280 (class 2606 OID 25376)
-- Name: project_roles fk_project_roles_project_role_types_project_role_type_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT fk_project_roles_project_role_types_project_role_type_id FOREIGN KEY (project_role_type_id) REFERENCES public.project_role_types(id) ON DELETE CASCADE;


--
-- TOC entry 3281 (class 2606 OID 25381)
-- Name: project_roles fk_project_roles_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT fk_project_roles_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 3272 (class 2606 OID 25297)
-- Name: project_technologies fk_project_technologies_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_technologies
    ADD CONSTRAINT fk_project_technologies_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 3273 (class 2606 OID 25302)
-- Name: project_technologies fk_project_technologies_technologies_technology_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_technologies
    ADD CONSTRAINT fk_project_technologies_technologies_technology_id FOREIGN KEY (technology_id) REFERENCES public.technologies(id) ON DELETE CASCADE;


--
-- TOC entry 3270 (class 2606 OID 25275)
-- Name: projects fk_projects_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_projects_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- TOC entry 3282 (class 2606 OID 25393)
-- Name: units fk_units_employees_unit_head_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT fk_units_employees_unit_head_id FOREIGN KEY (unit_head_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 3283 (class 2606 OID 25398)
-- Name: units fk_units_units_parent_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT fk_units_units_parent_unit_id FOREIGN KEY (parent_unit_id) REFERENCES public.units(id);


-- Completed on 2022-03-09 12:06:17 UTC

--
-- PostgreSQL database dump complete
--

