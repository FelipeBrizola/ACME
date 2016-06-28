--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: airlines; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE airlines (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE airlines OWNER TO acmeuser;

--
-- Name: airports; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE airports (
    id character varying(255) NOT NULL,
    latitude character varying(100) NOT NULL,
    longitude character varying(100) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE airports OWNER TO acmeuser;

--
-- Name: alliances; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE alliances (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    airline_list character varying(255) NOT NULL
);


ALTER TABLE alliances OWNER TO acmeuser;

--
-- Name: equipments; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE equipments (
    equipment_id character varying(255) NOT NULL,
    name character varying(255)
);


ALTER TABLE equipments OWNER TO acmeuser;

--
-- Name: flights; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE flights (
    id integer NOT NULL,
    route_id integer,
    departure character varying(20) NOT NULL,
    price real NOT NULL,
    sales_id integer
);


ALTER TABLE flights OWNER TO acmeuser;

--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: acmeuser
--

CREATE SEQUENCE flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flights_id_seq OWNER TO acmeuser;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acmeuser
--

ALTER SEQUENCE flights_id_seq OWNED BY flights.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE routes (
    id integer NOT NULL,
    airline_id character varying(255),
    "from" character varying(255),
    "to" character varying(255),
    codeshare character varying(10),
    stops character varying(10),
    equipment character varying(255)
);


ALTER TABLE routes OWNER TO acmeuser;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE sales (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    discount integer NOT NULL,
    alliance_id integer
);


ALTER TABLE sales OWNER TO acmeuser;

--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: acmeuser
--

CREATE SEQUENCE sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales_id_seq OWNER TO acmeuser;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acmeuser
--

ALTER SEQUENCE sales_id_seq OWNED BY sales.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE tickets (
    id integer NOT NULL,
    flight_id integer,
    user_id integer,
    status character varying(100),
    seat character varying(100)
);


ALTER TABLE tickets OWNER TO acmeuser;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: acmeuser
--

CREATE SEQUENCE tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tickets_id_seq OWNER TO acmeuser;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acmeuser
--

ALTER SEQUENCE tickets_id_seq OWNED BY tickets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: acmeuser
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(50),
    document character varying(50),
    email character varying(50),
    password character varying(50)
);


ALTER TABLE users OWNER TO acmeuser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: acmeuser
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO acmeuser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acmeuser
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY flights ALTER COLUMN id SET DEFAULT nextval('flights_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY sales ALTER COLUMN id SET DEFAULT nextval('sales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY tickets ALTER COLUMN id SET DEFAULT nextval('tickets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY airlines (id, name) FROM stdin;
2B	OJSC AK BARS AERO
2G	Angara Airlines
2I	Star Peru
2J	Air Burkina
2K	Aerogal
2L	Helvetic Airways
2N	Nextjet
2O	Island Air Service
2P	PAL Express
2Z	Passaredo
3E	Multi-Aero, Inc. d/b/a Air Choice One
3F	Pacific Airways Inc
3G	Gambia Bird Airlines Ltd.
3H	Air Inuit
3J	Jubba Airways Ltd
3K	Jetstar Asia
3L	Intersky
3M	Silver Airways Corp
3O	Air Arabia Maroc
3P	Tiara Air Aruba
3R	Gromov Air
3S	Air Antilles
3U	Sichuan Airlines
4B	Boutique Air
4D	Air Sinai
4E	Tanana Air Service
4G	Gazpromavia
4H	United Airways Bangladesh
4K	Kenn Borek Air
4M	LanArgentina
4N	Air North
4O	Interjet
4Q	Safi Airways
4T	Belair Airlines
4U	germanwings
4W	Warbelow
4Y	Flight Alaska
5C	NatureAir
5G	Fly 540 Ghana
5H	Five Forty Aviation
5J	Cebu Pacific Air
5M	FlyMontserrat
5N	Nordavia - Regional Airlines
5P	Aerolinea Principal
5Q	BQB Air
5T	Canadian North
5U	TAG Airlines (T A Guatemaltecos)
5Z	Cemair
6E	IndiGo Air
6H	Israir
6I	Air Alsie
6L	Aklak Air
6R	OJSC Mirny Enterprise
6T	Air Mandalay Ltd
6W	Saratov Airlines
6Y	SMARTLYNX AIRLINES Ltd
7C	Jeju Airlines
7E	Sylt Air
7F	First Air
7G	Star Flyer
7H	Era Aviation
7I	Insel Air
7J	Tajikistan Airlines
7M	Mayair, S.A. de C.V.
7P	Air Panama
7R	Joint Stock Aviation Company RusLine
7S	Ryan Air
8B	Business Air Centre Co
8D	Servant Air, Inc.
8E	Bering Air
8I	Insel Air Aruba
8L	Lucky Air Co. Ltd.
8M	Myanmar Airways International
8P	Pacific Coastal Airlines Limited
8Q	Onur Air
8R	TRIP Linhas A�reas S.A.
8T	Air Tindi Ltd
8U	Afriqiyah Airways
8V	Wright Air Service
9C	Spring Airlines
9D	Toumai Air Tchad
9E	Endeavor Air
9K	Cape Air
9M	Central Mountain Air Ltd.
9N	Tropic Air
9Q	Caicos Express Airways
9R	Satena
9U	Air Moldova
9V	Avior Airlines
9W	Jet Airways (India) Ltd
A2	Astra Airlines
A3	Aegean Airlines
A4	Aerocon
A5	HOP!
A8	Aerolink Uganda Ltd
A9	Georgian Airways
AA	American Airlines
AB	Air Berlin
ABJ	Abaet� Linhas A�reas
AC	Air Canada
AD	Azul Airlines
AE	Mandarin Airlines
AF	Air France
AH	Air Algerie
AI	Air India
AK	AirAsia
AM	Aeromexico
AP	Air One
AR	Aerolineas Argentinas
AS	Alaska Airlines
AT	Royal Air Maroc
AV	Avianca
AW	Africa World Airlines Limited
AY	Finnair
AZ	Alitalia - Compagnia Aerea Italiana Spa
B2	Belavia
B5	East African Safari Air Express
B6	Jetblue Airways Corporation
B7	UNI Airways
B9	Iran Air Tours
BA	British Airways
BB	Seaborne Airlines
BC	Skymark Airlines
BE	Flybe
BF	Vincent Aviation
BG	Biman Bangladesh Airlines
BH	Hawkair
BI	Royal Brunei Airlines
BJ	Nouvelair
BK	Okay Airways
BL	Jetstar Pacific Airlines
BM	BMI Regional
BP	Air Botswana
BR	EVA Airways
BT	Air Baltic Corporation
BU	Compagnie Africaine d
BV	Blue Panorama Airlines
BW	Caribbean Airlines
BX	Air Busan
C8	CRONOSAIR
CA	Air China
CC	CM Airlines
CE	Chalair
CG	Airlines Of Papua New Guinea
CI	China Airlines
CM	COPA Airlines
CN	Grand China Air
CU	Cubana
CX	Cathay Pacific Airways
CY	Cyprus Airways
CZ	China Southern Airlines
D2	Severstal Aircompany
D3	Daallo Airlines
D6	Inter Air
D7	AirAsia X
DC	Braathens Regional AB
DD	Nok Air
DE	Condor Flugdienst
DG	Tigerair Philippines
DH	Douniah Airlines
DL	Delta Air Lines
DN	Senegal Airlines
DT	TAAG Angola Airlines
DV	Air Company Scat
DX	Danish Air Transport
DY	Norwegian Air Shuttle
DZ	Donghai Airlines
E2	Eagle Atlantic Airlines
E5	Air Arabia Egypt
E7	Equaflight
E8	City Airways
E9	Evelop Airlines S.L.
EB	Pullmantur Air
EF	Eznis Airways
EG	CJSC East Air
EI	Aer Lingus
EK	Emirates
EL	Ellinair S.A.
EN	Air Dolomiti S.p.A L.A.R.E
EO	Air Go
EP	Iran Aseman Airlines
EQ	TAME Linea Aerea del Ecuador
ET	Ethiopian Airlines
EU	Chengdu Airlines
EW	Eurowings
EY	Etihad Airways
F2	SafariLink
F5	Fly540 S.A
F7	Darwin Airline
F9	Frontier Airlines Inc.
FB	Bulgaria Air
FD	Thai AirAsia
FE	Far Eastern Air Transport
FG	Ariana Afghan Airlines
FI	Icelandair
FJ	Fiji Airways
FL	AirTran Airways
FM	Shanghai Airlines
FO	Felix Airways
FR	Ryanair
FS	Syphax Airlines
FV	Rossiya Airlines
FW	IBEX Airlines
FY	Firefly
FZ	flydubai
G3	VARIG-GOL Airlines/VRG Linhas Aereas SA
G4	Allegiant Air LLC
G5	China Express Airlines
G8	Go Air
G9	Air Arabia
GA	Garuda Indonesia
GE	Transasia Airways
GF	Gulf Air
GK	Jetstar Japan
GL	Air Greenland
GQ	Sky Express S.A.
GR	Aurigny Air Services
GS	TianJin Airlines
GV	Grant Aviation, Inc.
GY	Sky Bishkek
GZ	Air Rarotonga
H2	Sky Airline
H7	Eagle Air
HA	Hawaiian Airlines
HD	Hokkaido International Airlines
HF	Air Cote d
HG	NIKI
HI	Papillon Airways
HK	Hamburg Airways
HM	Air Seychelles
HN	Afghan Airlines
HO	Juneyao Airlines
HQ	Thomas Cook Airlines Belgium N.V
HR	Hahn Air
HS	DirektFlyg
HU	Hainan Airlines
HV	transavia.com
HW	North-Wright Airways Ltd.
HX	Hong Kong Airlines
HY	Uzbekistan Airways
HZ	JSC Aurora Airlines
I4	Scott Air LLC
I6	Air Indus (Pvt.) Ltd.
I8	Izhavia
I9	Air Italy
IB	Iberia
ID	Batik Air
IE	Solomon Airlines Limited
IG	Meridiana fly S.p.A.
IL	PT Trigana Air
IOS	Isles of Scilly Skybus
IR	Iran Air
IX	Air India Express
IY	Yemenia Yemen Airways
IZ	Arkia - Israeli Airlines
J2	Azerbaijan Airlines
J3	Northwestern Air Lease Ltd.
J4	Badr Airlines
J5	Alaska Seaplane Service L.L.C.
J8	Berjaya Air
J9	Jazeera Airways
JA	BH Airlines
JB	Helijet International Inc
JD	Beijing Capital Airlines
JE	Mango
JH	Fuji Dream Airlines
JJ	TAM Linhas Aereas
JL	Japan Airlines
JN	Livingston Air
JP	Adria Airways
JQ	Jetstar Airways
JS	Air Koryo
JT	Lion Air
JU	Air Serbia
JV	Bearskin Lake Air Services LP
JW	Vanilla Air
JY	Intercaribbean Airways Ltd
K2	Eurolot
K3	Taquan Air Services
K5	Wings Of Alaska SeaPort Airline
K6	Cambodia Angkor Air
K8	Kan Air
KA	Dragonair
KB	Druk Air
KC	Air Astana
KE	Korean Air
KK	Atlasjet Airlines
KL	KLM-Royal Dutch Airlines
KM	Air Malta
KN	China United Airlines
KO	Aircompany Khors
KQ	Kenya Airways
KR	Air Bishkek
KS	PenAir
KU	Kuwait Airways
KX	Cayman Airways
KY	Kunming Airlines
L6	Mauritanian Airlines International
LA	Lan Airlines
LC	ECAir
LF	Lao Central Airlines
LG	Luxair
LH	Lufthansa German Airlines
LI	LIAT (1974)
LJ	Jin Air
LM	Loganair
LN	Libyan Airlines
LO	LOT - Polish Airlines
LR	LACSA-Lineas Aereas Costarricenses
LS	Jet2.com
LT	Air Lituanica
LV	Mega Global Air Services (Maldives)
LW	Pacific Wings
LX	SWISS
LY	El Al Israel Airlines
M3	Air Norway/North Flying
M4	Smart Aviation Company
M5	Kenmore Air
M6	Meta Linhas A�reas
M9	Motor Sich PJSC
MD	Air Madagascar
ME	Middle East Airlines
MF	Xiamen Airlines Company
MH	Malaysia Airlines
MI	SilkAir
MJ	Mihin Lanka
MK	Air Mauritius
MM	Peach Aviation Limited
MN	Comair
MO	Calm Air Intl Ltd
MR	Hunnu Air
MS	Egyptair
MU	China Eastern Airlines
MW	Mokulele Airlines
MY	Maya Island Air
N3	Aerolineas MAS
NF	Air Vanuatu
NH	All Nippon Airways
NHG	NHT Linhas A�reas
NK	Spirit Airlines
NL	Shaheen Air International
NP	Nile Air
NS	Hebei Airlines
NT	Binter Canarias
NU	Japan Transocean Air
NX	Air Macau
NY	Air Iceland
NZ	Air New Zealand
O4	Antrak Air
O6	OceanAir
OA	Olympic Air
OB	Boliviana de Aviacion - BoA
OC	Oriental Air Bridge Co., Ltd. (ORC)
OD	Malindo Airways
OJ	Fly Jamaica
OK	Czech Airlines
OM	MIAT - Mongolian Airlines
ON	Our Airline
OR	ArkeFly
OS	Austrian Airlines AG dba Austrian
OU	Croatia Airlines
OV	Estonian Air
OX	Orient Thai Airlines
OY	Andes Lineas Aereas
OZ	Asiana Airlines
P0	Proflight Commuter Services
P1	PublicCharters.com
P2	AirKenya Express
P4	Aero Lineas Sosa
P6	Pascan Aviation Inc.
P9	Peruvian Airlines
PB	Provincial Airlines
PC	Pegasus Airlines
PD	Porter Airlines Inc.
PE	Peoples Vienna Line
PG	Bangkok Airways
PI	Polar Airlines Ltd
PJ	Air Saint-Pierre
PK	Pakistan International Airlines
PL	Southern Air Charter
PM	CANARY FLY
PN	China West Air
PQ	AirAsia Philippines
PR	Philippine Airlines
PS	Ukraine International Airlines
PV	Saint Barth Commuter
PW	Precisionair
PX	Air Niugini
PY	Surinam Airways
PZ	Transportes Aereos del Mercosur
Q2	Maldivian
Q3	Anguilla Air Services
Q5	40 Mile Air
Q6	Skytrans
Q7	SkyBahamas
Q8	Trans Air Congo
Q9	Sky Jet M.G. Inc
QB	Faraz Qeshm Airline
QC	Camair-Co
QF	Qantas Airways
QG	Citilink Indonesia
QH	Kyrgyzstan
QL	LASER Airlines
QN	Air Armenia
QR	Qatar Airways
QS	SmartWings
QU	UTair-Ukraine
QV	Lao Airlines
QZ	Indonesia AirAsia
R2	ORENAIR
R3	Yakutia
R7	Aserca Airlines
RA	Nepal Airlines Corporation
RC	Atlantic Airways Faroe Islands
RG	Rotanajet Aviation
RI	Tigerair Mandala
RJ	Royal Jordanian
RL	Royal Falcon
RO	Tarom
RQ	Kam Air
RX	Regent Airways
RZ	SANSA Airlines
S2	Jet Lite
S3	Santa Barbara Airlines C.A.
S4	SATA International
S5	SETE Linhas A�reas
S6	Sunrise Airways
S7	S7 Airlines
S9	Starbow Airlines
SA	South African Airways
SB	Air Caledonie International
SC	Shandong Airlines
SD	Sudan Airways
SE	XL Airways France
SG	SpiceJet
SH	Sharp Airlines
SI	Blue Islands
SJ	Sriwijaya Air
SK	SAS Scandinavian Airlines
SN	Brussels Airlines
SP	SATA Air Acores
SQ	Singapore Airlines
SS	Corsair
ST	Germania
SU	Aeroflot Russian Airlines
SV	Saudi Arabian Airlines
SW	Air Namibia
SX	Sky Work Airlines
SY	Sun Country Airlines
SZ	Somon Air
T3	Eastern Airways
T5	Turkmenistan Airlines
T7	Twin Jet
TA	Taca International Airlines
TCX	Thomas Cook Airlines
TD	Atlantis European Airways
TE	TEAM Linhas Aereas
TF	Malmo Aviation
TG	Thai Airways International
TJ	Tradewind Aviation
TK	Turkish Airlines
TL	Airnorth Regional
TM	LAM-Linhas Aereas de Mocambique
TN	Air Tahiti Nui
TO	Transavia.com France
TOM	Thomson Airways
TP	TAP Portugal
TR	Tigerair Singapore
TS	Air Transat A.T.Inc.
TT	Tigerair Australia
TU	Tunisair
TV	Tibet Airlines
TW	T
TX	Air Caraibes
TY	Air Caledonie
TZ	Scoot
U2	easyJet
U6	Ural Airlines
U7	Air Uganda
UA	United Airlines
UD	Hex
UE	Nasair
UG	TunisAir Express
UJ	Almasria Universal Airlines
UL	SriLankan Airlines
UM	Air Zimbabwe
UN	Transaero Airlines
UO	Hong Kong Express Airways
UP	Bahamasair
UR	UTair-Express
US	US Airways
UU	Air Austral
UX	Air Europa
UY	Air Caucasus Ltd.
V0	Conviasa
V3	Carpatair
V4	Vieques Air Link
V7	Volotea
V9	Citywing
VA	Virgin Australia International
VB	VivaAerobus
VF	Valuair
VH	Aeropostal Alas de Venezuela S.A.
VJ	VietJet Air
VN	Vietnam Airlines
VQ	NovoAir
VR	TACV Cabo Verde Airlines
VS	Virgin Atlantic Airways
VT	Air Tahiti
VW	Transportes Aeromar S.A. de C.V.
VX	Virgin America
VY	Vueling Airlines
W2	FlexFlight ApS
W3	Arik Air
W4	LC Busre
W5	Mahan Air
W6	Wizz Air
W9	Air Bagan
WB	Rwandair Express
WF	Wideroe
WJ	Air Labrador
WM	Windward Island Airways International
WN	Southwest Airlines
WP	Island Air
WS	WestJet
WT	Wasaya Airways LP
WU	Wizz Air Ukraine
WW	WOW Air
WX	City Jet
WY	Oman Air
X3	TUIfly
X4	Air Excursions, LLC
X7	ExecAir
XK	Air Corsica
XL	LanEcuador
XQ	SunExpress
XU	African Express Airways
XV	BVI Airways
XY	Flynas - National Air Services
Y4	Volaris
Y5	Golden Myanmar Airlines
Y7	Airline Tajmyr
Y8	Passaredo Linhas A�reas
Y9	Kish Air
YC	Yamal Airlines
YI	Air Sunshine
YJ	Asian Wings Airways
YK	Avia Traffic Company
YM	Montenegro Airlines
YN	Air Creebec (1994) Inc.
YO	Heli Air Monaco
YQ	Aircompany POLET
YR	Scenic Airlines
YT	Yeti Airlines
Z2	Zestair
Z3	PM Air LLC
Z4	Zagros Air
Z6	Dnieproavia Joint Stock Aviation Co
Z8	Amaszonas
Z9	Bek Air
ZB	Monarch Airlines
ZD	EWA Air
ZE	Eastar Jet
ZH	Shenzhen Airlines
ZI	Aigle Azur
ZK	Great Lakes Airlines
ZL	Regional Express
ZM	Air Manas
\.


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY airports (id, latitude, longitude, name) FROM stdin;
AAA	-17.3542	-145.4961	Anaa
AAC	31.0733	33.8358	EL-ARISH
AAE	36.8222	7.8094	Annaba
AAF	29.7275	-85.0274	APALACHICOLA MUNI AIRPORT
AAG	-24.1036	-49.7900	ARAPOTI
AAL	57.0928	9.8492	Aalborg Airport                         
AAM	-24.8181	31.5446	  Mala Mala
AAN	24.2617	55.6092	Al Ain
AAQ	45.0017	37.3483	Anapa
AAR	56.3000	10.6190	Aarhus Tirstrup Airport
AAT	47.7200	88.1500	Altay
AAX	-19.5603	-46.9653	Araxa
AAY	16.1917	52.1750	Al Ghaydah
ABA	53.7417	91.3850	Abakan
ABB	6.1978	6.7285	Asaba
ABC	38.9480	-1.8630	Albacete
ABD	30.3667	48.2333	Abadan
ABE	40.6521	-75.4408	Allentown/Bethlehem/Easton
ABH	-23.6583	146.5917	ALPHA
ABI	32.4113	-99.6819	Abilene Regional Apt
ABJ	5.2544	-3.9286	Abidjan
ABK	6.7340	44.2530	  Kabri Dehar
ABL	67.1063	-157.8575	Ambler
ABM	-10.9500	142.4600	Bamaga
ABQ	35.0402	-106.6092	Albuquerque
ABR	45.4490	-98.4218	Aberdeen
ABS	22.3758	31.6117	Abu Simbel
ABT	20.2961	41.6342	Al Baha
ABV	9.0069	7.2631	Abuja
ABX	-36.0689	146.9564	Albury
ABY	31.5369	-84.1945	Albany Dougherty County Apt
ABZ	57.2019	-2.1978	Aberdeen
ACA	16.7571	-99.7538	Acapulco
ACC	5.5964	-0.1700	Accra
ACE	28.9455	-13.6052	Lanzarote
ACH	47.4850	9.5619	Altenrhein
ACI	49.7061	-2.2147	Alderney
ACK	41.2531	-70.0602	Nantucket
ACP	37.7333	46.4500	Sahand
ACR	0.6007	-72.3980	Araracuara
ACT	31.6113	-97.2305	Waco Municipal Apt
ACU	9.1830	-78.0170	Achutupo
ACV	40.9781	-124.1086	Arcata/Eureka
ACX	25.0500	104.9833	Xingyi
ACY	39.4576	-74.5772	Atlantic City International
ACZ	31.0983	61.5439	Zabol
ADA	36.9825	35.2831	Adana
ADB	38.2892	27.1550	Izmir Adnan Menderes Apt
ADD	8.9750	38.7994	Addis Ababa
ADE	12.8289	45.0297	Aden
ADF	37.7308	38.4689	Adiyaman
ADH	58.6000	125.4000	Aldan
ADJ	31.9727	35.9916	AMMAN MARKA INTL
ADK	51.8780	-176.6460	Adak Island
ADL	-34.9450	138.5300	Adelaide International
ADP	8.3000	80.4767	ANURADHAPURA
ADQ	57.7500	-152.4939	Kodiak Apt
ADS	32.9697	-96.8386	DALLAS/ADDISON
ADU	38.3267	48.4242	Ardabil
ADW	38.8108	-76.8670	ANDREWS AFB
ADX	56.3733	-2.8683	LEUCHARS
ADZ	12.5836	-81.7108	San Andres Island
AEB	23.7200	106.9600	Baise
AEG	1.4001	99.4305	  Padang Sidempuan
AEH	13.8472	20.8488	ABECHE
AEO	16.7167	-9.6333	AIOUN-EL-ATROUSS
AEP	-34.5589	-58.4164	Buenos Aires Aeroparque J. Newbery
AER	43.4450	39.9483	Sochi
AES	62.5625	6.1197	Alesund
AET	66.5518	-152.6222	Allakaket
AEX	31.3274	-92.5486	Alexandria International Apt
AEY	65.6586	-18.0722	Akureyri
AFA	-34.5883	-68.4033	San Rafael
AFB	46.8433	6.9167	PAYERNE AFB
AFL	-9.8661	-56.1044	Alta Floresta
AFS	41.6133	64.2328	Zarafshan
AFT	-9.1911	160.9492	  Afutara
AFW	32.9876	-97.3188	FORT WORTH ALLIANCE
AFY	38.7339	30.5953	AFYON
AFZ	36.1681	57.5953	Sabzevar
AGA	30.3250	-9.4131	Agadir
AGB	48.4252	10.9318	Munich Augsburg Apt
AGC	40.3544	-79.9302	PITTSBURH/ALLEGHENY CO
AGF	44.1747	0.5906	Agen
AGH	56.2911	12.8550	Angelholm/Helsingborg Angelholm Apt
AGL	-9.3330	149.1500	  Wanigela
AGM	65.6122	-37.6183	Tasiilaq
AGN	57.5036	-134.5851	Angoon
AGP	36.6750	-4.4992	Malaga
AGQ	38.6020	21.3512	AGRINION
AGR	27.1500	77.9500	Agra
AGS	33.3367	-81.9645	Augusta Bush Field
AGT	-25.4558	-54.8437	Ciudad del Este
AGU	21.7047	-102.3175	Aguascalientes
AGV	9.5500	-69.2333	ACARIGUA
AGX	10.8237	72.1760	Agatti Island
AGZ	-29.2792	18.8175	AGGENEYS
AHB	18.2404	42.6565	Abha
AHE	-14.4278	-146.2550	Ahe
AHN	33.9486	-83.3263	Athens
AHO	40.6322	8.2894	Alghero
AHS	15.4722	-84.3522	  Ahu�s
AHU	35.1806	-3.8317	Al Hoceima
AIA	42.0532	-102.8037	Alliance
AIC	7.1000	171.2333	XXX
AID	40.1087	-85.6130	ANDERSON MUN DARLINGTON FLD
AIF	-22.6394	-50.4525	ASSIS
AIM	10.2000	169.9833	XXX
AIN	70.6380	-159.9948	Wainwright
AIR	-10.2500	-59.3833	Aripuana Airport
AIT	-18.8309	-159.7642	Aitutaki Island
AIU	-19.9678	-158.1192	Atiu Island
AJA	41.9239	8.8025	Ajaccio
AJF	29.7852	40.0996	Jouf
AJI	39.6627	43.0232	Agri
AJL	23.7333	92.8000	Aizawl
AJN	-12.1317	44.4303	Anjouan
AJR	65.5903	19.2819	Arvidsjaur
AJU	-10.9853	-37.0733	Aracaju
AJY	16.9622	7.9903	AGADEZ/MANU DAYAK
AKA	32.7081	108.9314	  Ankang
AKB	52.2203	-174.2063	Atka
AKC	41.0375	-81.4669	AKRON
AKD	20.6978	77.0589	AKOLA
AKF	24.1767	23.3150	Kufra
AKH	35.2026	-81.1498	GASTONIA MUNI
AKI	60.9029	-161.2306	Akiak
AKJ	43.6707	142.4475	Asahikawa
AKK	56.9387	-154.1826	Akhiok
AKL	-37.0081	174.7917	Auckland International Apt
AKN	58.6768	-156.6492	King Salmon
AKP	68.1336	-151.7433	Anaktuvuk Pass
AKR	7.2500	5.3042	AKURE
AKS	-8.6978	160.6808	Auki (SB)
AKT	34.5903	32.9878	AKROTIRI
AKU	41.2625	80.2917	Aksu
AKV	60.8186	-78.1486	Akulivik
AKX	50.2458	57.2067	Aktobe
AKY	20.1329	92.8760	Sittwe
ALA	43.3519	77.0406	Almaty
ALB	42.7483	-73.8017	Albany International Airport
ALC	38.2822	-0.5582	Alicante
ALF	69.9761	23.3717	Alta
ALG	36.6944	3.2169	Algiers
ALH	-34.9433	117.8083	Albany
ALI	27.7417	-98.0267	ALICE INTL
ALJ	-28.5733	16.5350	ALEXANDER BAY
ALL	44.0467	8.1264	ALBENGA
ALM	32.8399	-105.9906	  Alamogordo
ALN	38.8900	-90.0467	ALTON/ST. LOUIS REGIONAL
ALO	42.5572	-92.4033	Waterloo
ALP	36.1797	37.2261	ALEPPO INTL
ALR	-45.2117	169.3733	ALEXANDRA
ALS	37.4349	-105.8666	Alamosa
ALW	46.0946	-118.2879	Walla Walla
ALY	31.1817	29.9464	ALEXANDRIA INTL
ALZ	56.8958	-154.2458	Alitak
AMA	35.2194	-101.7059	Amarillo International Apt
AMD	23.0712	72.6264	Ahmedabad
AMH	6.0394	37.5905	Arba Minch
AMI	-8.5620	116.0994	MATARAM/SELAPARANG
AMJ	-16.1833	-40.6667	ALMENARA
AMM	31.7226	35.9932	Amman Queen Alia International Apt
AMQ	-3.7070	128.0897	Ambon
AMS	52.3081	4.7642	Amsterdam
AMV	69.7633	61.5633	AMDERMA
AMY	-17.6830	45.6170	  Ambatomainty
AMZ	-37.0297	174.9733	ARDMORE
ANB	33.5881	-85.8581	ANNISTON METROPOLITAN
ANC	61.1744	-149.9964	Anchorage International Apt
AND	34.4950	-82.7097	ANDERSON
ANE	47.5603	-0.3122	ANGERS/MARCE
ANF	-23.4444	-70.4450	Antofagasta
ANG	45.7294	0.2192	Angouleme
ANI	61.5816	-159.5430	Aniak
ANJ	46.4792	-84.3684	SAULT STE MARIE MUNI/SANDERSON
ANK	39.9575	32.6744	ANKARA/ETIMESGUT
ANM	-14.9994	50.3202	Antalaha
ANN	55.0425	-131.5722	ANNETTE ISLAND
ANO	-16.1833	39.9333	ANGOCHE
ANR	51.1894	4.4603	Antwerp
ANS	-13.7042	-73.3481	Andahuaylas
ANU	17.1367	-61.7928	Antigua
ANV	62.6467	-160.1907	Anvik
ANW	42.5800	-99.9933	AINSWORTH
ANX	69.2925	16.1442	Andenes
AOC	50.9818	12.5064	ALTENBURG-NOBITZ
AOE	39.8117	30.5286	Eskisehir
AOG	41.1053	122.8539	Anshan
AOI	43.6167	13.3603	Ancona
AOJ	40.7347	140.6908	Aomori
AOK	35.4167	27.1500	Karpathos
AOL	-29.6881	-57.1522	PASO DE LOS LIBRES
AOO	40.2964	-78.3200	Altoona
AOQ	72.8869	-55.5961	Aappilattoq
AOR	6.1944	100.4008	Alor Setar
AOS	57.4667	-153.8333	Amook
AOT	45.7386	7.3681	AOSTA
AOU	14.8000	106.8167	ATTOPEU
AOX	46.0525	63.2492	YUBILEYNYI/BAJKONUR
APA	39.5701	-104.8493	DENVER/ARAPAHOE/CENTENNIAL
APC	38.2131	-122.2806	NAPA CO
APF	26.1526	-81.7753	Naples
APG	39.4662	-76.1688	PHILLIPS AAF (ABERDEEN PG)
API	4.0761	-73.5627	GOMEZ NINO APIAY AB
APK	-15.5736	-146.4153	Apataki
APL	-15.1000	39.2833	Nampula
APN	45.0781	-83.5603	Alpena
APO	7.0330	-77.2000	Apartado
APS	-16.3619	-48.9275	ANAPOLIS
APU	-23.6117	-51.3844	APUCARANA
APV	34.5753	-117.1862	APPLE VALLEY
APW	-13.8297	-171.9972	Apia Faleolo Apt
APX	-23.3625	-51.4792	ARAPONGAS
AQA	-21.8039	-48.1397	Araraquara
AQG	30.5822	117.0503	Anqing
AQI	28.3352	46.1249	Qaisumah
AQJ	29.6116	35.0181	Aqaba
AQP	-16.3403	-71.5728	Arequipa
ARA	30.0378	-91.8839	NEW IBERIA/ACADIANA RGNL
ARC	68.1147	-145.5794	Arctic Village
ARH	64.6000	40.7183	Arkhangelsk
ARI	-18.3486	-70.3386	Arica
ARK	-3.3678	36.6333	Arusha
ARM	-30.5300	151.6175	Armidale
ARN	59.6519	17.9186	Stockholm Arlanda Apt
ARS	-15.8989	-52.2403	ARAGARCAS
ART	43.9919	-76.0217	Watertown
ARU	-21.1436	-50.4258	Aracatuba
ARV	45.9279	-89.7309	  Minocqua-Woodruff
ARW	46.1765	21.2620	Arad
ARY	-37.3119	142.9906	ARARAT
ASA	13.0667	42.6333	ASSAB
ASB	37.9917	58.3633	Ashgabat International
ASD	24.6983	-77.7956	  Andros Town
ASE	39.2232	-106.8688	Aspen
ASF	46.2833	48.0083	Astrakhan
ASI	-7.9700	-14.3933	ASCENSION AUX AB WIDEAWAKE
ASJ	28.4308	129.7126	Amami
ASK	6.9061	-5.3626	YAMOUSSOUKRO
ASM	15.2842	38.9000	Asmara
ASO	10.0185	34.5863	Asosa
ASP	-23.8067	133.9017	Alice Springs Airport
ASR	38.7703	35.4953	Kayseri
AST	44.8373	-117.8075	ASTORIA
ASU	-25.2411	-57.5168	Asuncion
ASV	-2.6330	37.2500	Amboseli
ASW	23.9644	32.8200	Aswan
ATA	-9.3436	-77.5958	Anta
ATB	17.7097	34.0574	ATBARA
ATC	24.6700	-75.7500	Arthur's Town
ATD	-8.8733	161.0114	Atoifi
ATF	-1.2119	-78.5747	AMBATO/CHACHOAN
ATH	37.9367	23.9445	Athens
ATK	70.4673	-157.4357	Atqasuk
ATL	33.6367	-84.4281	Atlanta Hartsfield-Jackson Intl Apt
ATM	-3.2506	-52.2517	Altamira
ATN	-3.6670	152.4330	  Namatanai
ATQ	31.7044	74.8021	Amritsar
ATR	20.5008	-13.0467	ATAR
ATT	60.8667	-162.2731	Atmautluak
ATW	44.2581	-88.5191	Appleton
ATY	44.9140	-97.1547	Watertown
ATZ	27.0464	31.0119	Asyut
AUA	12.5014	-70.0152	Aruba
AUC	7.0689	-70.7369	Arauca
AUF	47.8464	3.4967	AUXERRE/BRANCHES
AUG	44.3200	-69.7967	Augusta
AUH	24.4367	54.6508	Abu Dhabi International Apt
AUK	62.6800	-164.6599	Alakanuk
AUL	8.1333	171.1667	XXX
AUQ	-9.7667	-139.0167	Hiva Oa
AUR	44.8975	2.4167	Aurillac
AUS	30.1950	-97.6700	Austin-Bergstrom International Apt
AUU	-13.3539	141.7208	Aurukun
AUW	44.9285	-89.6266	WAUSAU DOWNTOWN
AUX	-7.2281	-48.2403	Araguaina
AUY	-20.2492	169.7714	Aneityum
AVA	26.2606	105.8731	Anshun
AVB	45.9250	12.4292	AVIANO
AVI	22.0269	-78.7894	CIEGO DE AVILA MAXIMO GOMEZ
AVL	35.4367	-82.5417	Asheville
AVN	43.9067	4.9019	Avignon Caumont Airport
AVP	41.3384	-75.7234	Wilkes-Barre Scranton International Apt
AVR	38.8855	-9.0281	ALVERCA-DGMFA
AVU	-9.8670	160.4000	  Avu Avu
AVV	-38.0394	144.4694	Melbourne Avalon Airport
AWB	-8.0000	142.7500	  Awaba
AWD	-19.2400	169.6050	Aniwa
AWK	19.2819	166.6386	WAKE ISLAND AAF
AWZ	31.3375	48.7603	Ahwaz
AXA	18.2047	-63.0539	Anguilla
AXD	40.8558	25.9561	Alexandroupolis
AXK	14.5333	46.8167	Ataq
AXM	4.4533	-75.7658	Armenia
AXN	45.8663	-95.3947	ALEXANDRIA/CHANDLER FIELD
AXP	22.4418	-73.9709	Spring Point
AXR	-15.2464	-146.6203	Arutua
AXT	39.6156	140.2185	Akita
AXU	14.1371	38.7761	Axum
AYK	50.3250	66.9600	ARKALYK
AYP	-13.1511	-74.2017	Ayacucho
AYQ	-25.1867	130.9750	Ayers Rock
AYR	-19.5958	147.3258	AYR
AYS	31.2491	-82.3955	WAYCROSS WARE CO
AYT	36.9008	30.7947	Antalya
AZA	33.3078	-111.6555	Phoenix Williams Gateway Airport
AZD	31.9061	54.2764	Yazd
AZI	24.4283	54.4581	Abu Dhabi Bateen Apt
AZN	40.7267	72.2933	Andizhan
AZO	42.2349	-85.5521	Kalamazoo
AZR	27.8392	-0.1853	Adrar
AZS	19.1986	-69.4298	Samana
BAB	39.1362	-121.4365	BEALE AFB MARYSVILLE
BAD	32.5018	-93.6627	BOSSIER CITY/BARKSDALE AFB
BAF	42.1575	-72.7158	WESTFIELD/BARNES MUNI
BAG	16.3767	120.6189	BAGUIO
BAH	26.2708	50.6336	Bahrain
BAL	37.9322	41.1164	Batman
BAM	40.5990	-116.8743	BATTLE MOUNTAIN
BAQ	10.8894	-74.7806	Barranquilla
BAS	-6.9670	155.8830	Balalae
BAT	-20.5850	-48.5953	BARRETOS/CHAFEI AMSEI
BAU	-22.3436	-49.0539	BAURU
BAV	40.5600	109.9969	Baotou
BAX	53.3633	83.5417	Barnaul
BAY	47.6583	23.4662	Baia Mare
BAZ	-0.9808	-62.9189	Barcelos
BBA	-45.9186	-71.6972	Balmaceda
BBH	54.3382	12.7101	BARTH
BBI	20.2467	85.8185	Bhubaneshwar
BBJ	49.9453	6.5650	BITBURG
BBK	-17.8297	25.1631	Kasane
BBM	13.1030	103.2294	BATTAMBANG
BBN	3.7339	115.4786	Bario
BBO	10.3833	44.9500	Berbera
BBQ	17.6275	-61.8269	  Codrington
BBS	51.3239	-0.8475	BLACKBUSH
BBT	4.2261	15.7856	BERBERATI
BBU	44.5035	26.1036	BUCHAREST/BANEASA-AUREL VLAICU
BBW	41.4367	-99.6417	BROKEN BOW
BCA	20.3647	-74.5067	Baracoa
BCD	10.6425	122.9296	Bacolod
BCH	-8.4854	126.3993	BAUCAU
BCI	-23.5650	145.3094	Barcaldine
BCL	10.7687	-83.5856	  Barra del Colorado
BCM	46.5219	26.9103	BACAU
BCN	41.2971	2.0785	Barcelona Apt
BCR	-8.8333	-67.3117	BOCA DO ACRE/NOVO CAMPO
BCT	26.3784	-80.1076	BOCA RATON
BCV	17.2694	-88.7761	Belmopan
BCW	-23.7333	35.1167	Benguera Island
BDA	32.3640	-64.6787	Bermuda
BDB	-24.9053	152.3175	Bundaberg
BDD	-10.1500	142.1742	  Badu Island
BDE	48.7284	-94.6122	BAUDETTE INTL
BDH	26.5314	54.8275	Bandar Lengeh
BDJ	-3.4397	114.7528	Banjarmasin
BDL	41.9389	-72.6832	Hartford Bradley International Apt
BDM	40.3156	27.9828	BALIKESIR/BANDIRMA
BDO	-6.9019	107.5761	Bandung
BDP	26.5703	88.0758	Bhadrapur
BDQ	22.3294	73.2194	Vadodara
BDR	41.1607	-73.1245	BRIDGEPORT/IGOR I. SIKORSKY
BDS	40.6606	17.9481	Brindisi
BDT	4.2500	20.9667	GBADOLITE
BDU	69.0558	18.5403	Bardufoss
BEB	57.4811	-7.3628	Benbecula
BED	42.4700	-71.2900	BEDFORD/LAURENCE G.HANSCOM FLD
BEG	44.8194	20.3125	Belgrade
BEJ	2.1533	117.4311	Tanjung Redeb
BEL	-1.3847	-48.4789	Belem
BEN	32.0975	20.2708	Benghazi
BEP	15.1628	76.8828	  Bellary
BES	48.4472	-4.4217	Brest
BET	60.7798	-161.8380	Bethel Municipal Apt
BEU	-24.3467	139.4600	Bedourie
BEV	31.2881	34.7231	BEER SHEBA-TEYMAN
BEW	-19.7947	34.8992	Beira
BEX	51.6147	-1.0939	BENSON
BEY	33.8206	35.4900	Beirut
BFD	41.8030	-78.6402	Bradford
BFF	41.8740	-103.5956	Scottsbluff
BFI	47.5300	-122.3020	Seattle Boeing Field
BFJ	27.3003	105.3014	Bijie
BFL	35.4333	-119.0567	Bakersfield
BFM	30.6267	-88.0681	MOBILE DOWNTOWN
BFN	-29.0938	26.3040	Bloemfontein
BFO	-21.0086	31.5794	CHIREDZI/BUFFALO RANGE
BFP	40.7725	-80.3915	BEAVER CO
BFQ	7.5830	-78.2000	Bahia Pina
BFS	54.6575	-6.2158	Belfast International Apt
BFV	15.2267	103.2511	Buriram
BFX	5.5347	10.3558	BAFOUSSAM
BGA	7.1269	-73.1850	Bucaramanga
BGC	41.8567	-6.7075	BRAGANCA
BGF	4.3977	18.5198	Bangui
BGG	38.8600	40.5939	Bingol
BGI	13.0746	-59.4921	Barbados
BGM	42.2087	-75.9731	Binghamton
BGN	51.2000	6.1333	Belaya Gora
BGO	60.2936	5.2181	Bergen
BGR	44.8074	-68.8281	Bangor
BGU	4.7833	22.7833	BANGASSOU
BGW	33.3500	44.4170	Baghdad
BGX	-31.3908	-54.1097	BAGE/GUSTAVO KRAEMER
BGY	45.6689	9.7003	Milan Bergamo/Orio al Serio Apt
BHA	-0.6050	-80.4042	SAN VICENTE
BHB	44.4498	-68.3616	Bar Harbor
BHD	54.6181	-5.8725	Belfast George Best City Apt
BHE	-41.5183	173.8703	Blenheim
BHG	15.7350	-84.5425	  Brus Laguna
BHH	19.9842	42.6231	Bisha
BHI	-38.7203	-62.1575	Bahia Blanca
BHJ	23.2867	69.6700	Bhuj
BHK	39.7750	64.4833	Bukhara
BHM	33.5629	-86.7535	Birmingham
BHO	23.2869	77.3369	Bhopal
BHQ	-32.0017	141.4717	Broken Hill
BHR	27.6781	84.4294	Bharatpur
BHS	-33.4111	149.6528	Bathurst
BHU	21.7542	72.1906	Bhavnagar
BHV	29.3444	71.7125	Bahawalpur
BHX	52.4539	-1.7480	Birmingham Airport
BHY	21.5394	109.2939	Beihai
BIA	42.5500	9.4847	Bastia
BIC	57.6600	-157.5800	Big Creek
BID	41.1681	-71.5778	  Block Island
BIE	40.3017	-96.7533	BEATRICE
BIF	31.8495	-106.3800	BIGGS AAF
BIG	63.9945	-145.7216	DELTA JUNCTION/FT GREELY ALLEN
BIH	37.3731	-118.3636	BISHOP E. SIERRA REGNL
BII	11.5225	165.5650	  Bikini Atoll
BIK	-1.1919	136.1100	Biak
BIL	45.8077	-108.5429	Billings
BIM	25.6999	-79.2647	Bimini
BIO	43.3011	-2.9106	Bilbao
BIQ	43.4683	-1.5311	Biarritz
BIR	26.4840	87.2643	Biratnagar
BIS	46.7740	-100.7467	Bismarck
BIV	6.5267	21.9900	BRIA
BIX	30.4113	-88.9236	KEESLER AFB/BILOXI
BIY	-32.8950	27.2850	BHISHO
BJA	36.7119	5.0694	Bejaia
BJB	37.4892	57.3064	Bojnurd
BJC	39.9083	-105.1167	DENVER JEFFCO
BJF	70.6003	29.6925	Batsfjord
BJI	47.5094	-94.9337	Bemidji
BJL	13.3425	-16.6578	Banjul
BJM	-3.3178	29.3172	Bujumbura
BJR	11.6063	37.3197	Bahar Dar
BJT	6.4833	79.9833	Bentota River
BJV	37.2472	27.6814	Bodrum Milas Airport
BJX	20.9933	-101.4810	Leon/Guanajuato
BJY	44.9236	20.2790	BEOGRAD/BATAJNICA
BJZ	38.8912	-6.8213	Badajoz
BKA	55.6172	38.0600	Moscow Bykovo Apt
BKC	65.9816	-161.1491	Buckland
BKE	44.8373	-117.8091	BAKER CITY MUNI
BKF	39.7017	-104.7517	AURORA/BUCKLEY AFB
BKG	36.5321	-93.2005	Branson
BKI	5.9447	116.0531	Kota Kinabalu
BKK	13.6811	100.7473	Bangkok Suvarnabhumi International Apt
BKL	41.5250	-81.6833	CLEVELAND BURKE
BKM	3.9740	115.6180	Bakelalan
BKO	12.5379	-7.9433	Bamako
BKQ	-24.4267	145.4233	Blackall
BKS	-3.8611	102.3394	Bengkulu
BKW	37.7867	-81.1244	Beckley
BKY	-2.3090	28.8088	Bukavu
BKZ	-1.3000	31.8000	Bukoba
BLA	10.1167	-64.6833	Barcelona
BLB	8.9148	-79.5996	BALBOA/HOWARD AFB
BLD	35.9475	-114.8611	Las Vegas Boulder City Airport
BLE	60.4222	15.5150	Borlange/Falun
BLF	37.2958	-81.2077	BLUEFIELD
BLH	33.6192	-114.7168	BLYTHE
BLI	48.7927	-122.5375	Bellingham
BLJ	35.7592	6.3225	Batna
BLK	53.7716	-3.0286	Blackpool
BLL	55.7403	9.1518	Billund
BLQ	44.5306	11.2969	Bologna Guglielmo Marconi
BLR	12.9522	77.6646	Bengaluru
BLT	-23.6000	148.8167	BLACKWATER
BLV	38.5452	-89.8352	Belleville
BLZ	-15.6798	34.9676	Blantyre
BMA	59.3544	17.9422	Stockholm Bromma Apt
BMC	41.5524	-112.0622	BRIGHAM CITY
BMD	-19.6867	44.5419	  Belo sur Tsiribihina
BME	-17.9500	122.2317	Broome
BMI	40.4767	-88.9167	Bloomington-Normal
BMK	53.5955	6.7092	  Borkum
BMO	24.2690	97.2462	Bhamo
BMU	-8.5408	118.6906	Bima
BMV	12.6661	108.1145	Ban Me Thuot
BMW	21.3750	0.9239	Bordj Mokhtar
BMY	-19.7206	163.6611	Ile Art
BNA	36.1245	-86.6782	Nashville
BNB	-0.2860	20.8840	Boende
BNC	0.5750	29.4739	Beni
BND	27.2186	56.3778	Bandar Abbas
BNE	-27.3858	153.1183	Brisbane
BNI	6.2331	5.5992	Benin City
BNJ	50.7319	7.0967	Bonn Stn. (DE)
BNK	-28.8333	153.5617	Ballina
BNN	65.4611	12.2175	Bronnoysund
BNO	43.5919	-118.9554	BURNS
BNP	32.9667	70.5333	BANNU
BNS	8.6167	-70.2167	Barinas
BNX	44.9417	17.3033	Banja Luka
BNY	-11.3022	159.7981	Bellona
BOA	-5.8540	13.0640	  Boma
BOB	-16.4436	-151.7525	Bora Bora
BOC	9.3408	-82.2508	Bocas del Toro
BOD	44.8286	-0.7153	Bordeaux Merignac Apt
BOG	4.7031	-74.1383	Bogota
BOH	50.7800	-1.8425	Bournemouth
BOI	43.5644	-116.2228	Boise
BOJ	42.5703	27.5153	Burgas
BOM	19.0908	72.8667	Mumbai
BON	12.1311	-68.2769	Bonaire
BOO	67.2692	14.3653	Bodo
BOP	5.9667	15.6333	BOUAR
BOS	42.3643	-71.0052	Boston Logan International Apt
BOT	-7.2330	141.0830	  Boset
BOU	47.0644	2.3789	BOURGES
BOX	-16.0753	136.3022	BORROLOOLA
BOY	11.1675	-4.3211	Bobo Dioulasso
BPE	21.1812	94.9287	BAGAN
BPF	-8.5830	158.1170	  Batuna
BPG	-15.8603	-52.3889	BARRO DO GARCAS
BPH	8.1885	126.3270	BISLIG
BPI	42.5851	-110.1112	BIG PINEY
BPL	44.9038	82.0708	Bole
BPM	34.9463	69.2650	BAGRAM
BPN	-1.2672	116.8939	Balikpapan
BPS	-16.4381	-39.0733	Porto Seguro
BPT	29.9508	-94.0207	Beaumont Jefferson County Apt
BPX	30.5536	97.1083	Qamdo/Changdu
BPY	-16.7419	44.4814	  Besalampy
BQA	15.7331	121.5022	BALER
BQB	-33.6867	115.4000	Busselton
BQH	51.3308	0.0325	BIGGIN HILL
BQK	31.2588	-81.4665	Brunswick Glynco Jetport
BQL	-22.9133	139.9000	Boulia
BQN	18.4948	-67.1295	Aguadilla
BQQ	-22.4831	-48.5239	BARRA BONITA/FAZ SANTA LUIZA
BQS	50.4250	127.4117	Blagoveschensk
BQT	52.1083	23.8981	BREST
BRA	-12.0794	-45.0094	Barreiras
BRB	-2.7958	-57.0556	BARREIRINHA
BRC	-41.1511	-71.1578	San Carlos de Bariloche
BRD	46.3983	-94.1381	Brainerd
BRE	53.0474	8.7867	Bremen
BRI	41.1392	16.7658	Bari
BRK	-30.0403	145.9528	BOURKE
BRL	40.7832	-91.1255	Burlington
BRM	10.0456	-69.3564	Barquisimeto
BRN	46.9122	7.4992	Berne Belp
BRO	25.9068	-97.4259	Brownsville
BRQ	49.1514	16.6939	Brno
BRR	57.0170	-7.4330	Barra
BRS	51.3827	-2.7191	Bristol
BRT	-11.7664	130.6167	BATHURST ISLAND
BRU	50.9014	4.4844	Brussels Airport
BRV	53.5071	8.5729	BREMERHAVEN
BRW	71.2854	-156.7660	Barrow Wiley Post/Will Rogers Memorial
BRX	18.2517	-71.1219	BARAHONA/MARIA MONTEZ
BSA	11.2753	49.1494	Bosaso
BSB	-15.8692	-47.9208	Brasilia
BSC	6.2031	-77.3947	Bahia Solano
BSD	25.1500	99.1500	Baoshan
BSG	1.9022	9.8028	Bata
BSJ	-37.8883	147.5683	BAIRNSDALE
BSK	34.7933	5.7382	Biskra
BSL	47.5900	7.5292	Basel
BSO	20.4522	121.9772	Basco
BSR	30.5491	47.6621	Basrah
BSS	-7.5250	-46.0528	BALSAS
BST	31.5590	64.3641	Lashkar Gah
BSX	16.8152	94.7799	  Bassein
BSZ	58.2336	-157.3503	Bartletts
BTC	7.7033	81.6783	Batticaloa
BTH	1.1189	104.1142	Batam
BTI	70.1340	-143.5819	Barter Island
BTJ	5.5169	95.4200	Banda Aceh
BTK	56.3700	101.6983	Bratsk
BTL	42.3075	-85.2517	BATTLE CREEK W K KELLOGG
BTM	45.9548	-112.4975	Butte
BTR	30.5331	-91.1496	Baton Rouge Metropolitan Apt
BTS	48.1700	17.2128	Bratislava
BTT	66.9139	-151.5290	Bettles
BTU	3.1241	113.0197	Bintulu
BTV	44.4718	-73.1532	Burlington
BTZ	40.2489	29.5494	BURSA/YENISEHIR
BUA	-5.4223	154.6727	Buka
BUC	-17.7483	139.5350	Burketown
BUD	47.4393	19.2618	Budapest
BUF	42.9405	-78.7322	Buffalo
BUG	-12.6099	13.4037	BENGUELA
BUJ	35.3314	4.2044	BOU-SAADA
BUL	-7.2170	146.6330	Bulolo
BUN	3.8197	-76.9897	Buenaventura
BUO	9.5170	45.5670	  Burao
BUQ	-20.0183	28.6247	Bulawayo
BUR	34.2006	-118.3587	Burbank
BUS	41.6100	41.5997	Batumi
BUW	-5.4869	122.5690	Baubau
BUX	1.5658	30.2206	Bunia
BUY	-33.3783	115.6767	BUNBURY
BUZ	28.9494	50.8303	Bushehr
BVA	49.4544	2.1128	Paris Beauvais-Tille Airport
BVB	2.8414	-60.6922	Boa Vista
BVC	16.1364	-22.8886	Boa Vista Island
BVE	45.1494	1.4744	Brive-la-Gaillarde
BVG	70.8714	29.0342	Berlevag
BVH	-12.7014	-60.0931	Vilhena
BVI	-25.8989	139.3486	Birdsville
BVM	-15.8708	-38.8719	BELMONTE
BVS	-1.6383	-50.4408	BREVES
BVV	44.9200	147.6217	Iturup Island
BVY	42.5842	-70.9165	BEVERLY MUNI
BWA	27.5073	83.4179	Bhairawa
BWB	-20.8658	115.4047	BARROW ISLAND
BWE	52.3192	10.5561	BRAUNSCHWEIG-WOLFSBURG
BWG	36.9645	-86.4197	BOWLING GREEN/WARREN CO. RGNL
BWH	5.4661	100.3911	BUTTERWORTH
BWI	39.1754	-76.6683	Baltimore Washington International Apt
BWK	43.2857	16.6797	Brac
BWN	4.9442	114.9284	Bandar Seri Begawan
BWO	51.8617	47.7500	BALAKOVO
BWQ	-29.9756	146.8156	BREWARRINA
BWT	-41.0003	145.7300	Burnie
BWU	-33.9244	150.9900	SYDNEY/BANKSTOWN
BWW	22.6200	-79.1400	Cayo las Brujas
BXB	-2.5322	133.4389	Irarutu
BXE	14.8667	-12.4833	BAKEL
BXH	46.8933	75.0050	BALKHASH
BXR	29.0842	58.4497	Bam
BXU	8.9586	125.4917	Butuan
BYC	-21.9494	-63.6481	Yacuiba
BYF	49.9700	2.6928	Meaulte
BYH	35.9643	-89.9440	BLYTHEVILLE ARKANSAS INTL
BYI	42.5433	-113.7717	BURLEY MUNI AIRPORT
BYK	7.7525	-5.0678	BOUAKE
BYM	20.3972	-76.6175	BAYAMO/BAYAMO
BYN	46.1633	100.7041	Bayankhongor
BYO	-21.2294	-56.4561	Bonito
BYR	57.2772	11.0001	  L�s�
BYU	49.9844	11.6386	BAYREUTH
BZB	-18.7167	36.3333	Bazaruto Island
BZC	-22.7656	-41.9650	BUZIOS/UMBERTO MODIANO
BZD	-34.6250	143.5769	BALRANALD
BZE	17.5361	-88.3083	Belize City Goldson Intl Apt
BZG	53.0968	17.9777	Bydgoszcz
BZI	39.6156	27.9328	BALIKESIR
BZK	53.2133	34.1783	BRYANSK
BZL	22.7989	90.3012	Barisal
BZN	45.7775	-111.1530	Bozeman
BZO	46.4603	11.3267	Bolzano/Bozen
BZR	43.3233	3.3533	Beziers
BZV	-4.2556	15.2483	Brazzaville
BZY	47.8383	27.7817	BALTI INTL
BZZ	51.7495	-1.5822	BRIZE NORTON
C27	53.1042	-4.3406	CAERNARFON
CAB	-5.5970	12.1884	Cabinda
CAC	-25.0022	-53.5019	Cascavel
CAE	33.9387	-81.1195	Columbia Metropolitan Apt
CAG	39.2472	9.0564	Cagliari
CAH	9.1877	105.1750	Ca Mau
CAI	30.1114	31.4139	Cairo
CAJ	6.2500	-62.8333	Canaima
CAK	40.9160	-81.4421	Akron/Canton Ohio Regional
CAL	55.4372	-5.6864	Campbeltown
CAN	23.3900	113.3067	Guangzhou
CAO	36.4462	-103.1500	CLAYTON MUNI ARPK AIRPORT
CAP	19.7333	-72.2000	Cap Haitien
CAR	46.8714	-68.0178	CARIBOU MUNI AIRPORT
CAS	33.5533	-7.6614	CASABLANCA/ANFA
CAU	-18.2842	-36.0106	CARUARU
CAV	-11.9000	22.9000	CAZOMBO
CAW	-21.7006	-41.3072	Campos
CAX	54.9375	-2.7250	CARLISLE
CAY	4.8197	-52.3619	Cayenne
CAZ	-31.5383	145.7933	COBAR
CBB	-17.4211	-66.1769	Cochabamba
CBD	9.1532	92.8194	CARNICOBAR
CBG	52.2050	0.1750	CAMBRIDGE
CBH	31.6500	-2.2500	Bechar
CBJ	17.6500	-71.6500	CABO ROJO/ PEDERNALES
CBL	8.1333	-63.5350	CIUDAD BOLIVAR
CBO	7.1608	124.2125	Cotabato
CBQ	4.9761	8.3472	Calabar
CBR	-35.3067	149.1950	Canberra
CBS	10.3301	-71.3225	Cabimas
CBT	-12.4792	13.4869	Catumbela
CBU	51.8908	14.5336	COTTBUS-DREWITZ
CBW	-24.0069	-52.3561	CAMPO MOURAO
CBX	-33.0650	147.2083	CONDOBOLIN
CCC	22.4611	-78.3286	Cayo Coco
CCE	18.1006	-63.0489	SAINT MARTIN/GRAND CASE
CCF	43.2158	2.3086	Carcassonne
CCH	-46.5475	-71.6961	CHILE CHICO
CCJ	11.1381	75.9504	Kozhikode
CCK	-12.1883	96.8300	Cocos Islands
CCL	-26.7750	150.6167	CHINCHILLA
CCM	-28.7239	-49.4208	Criciuma
CCN	34.5267	65.2717	Chaghcharan
CCP	-36.7728	-73.0631	Concepcion
CCS	10.6012	-66.9912	Caracas
CCU	22.6531	88.4492	Kolkata
CCV	-16.2650	167.9244	Craig Cove
CCZ	25.4171	-77.8808	  Chub Cay
CDB	55.2061	-162.7238	Cold Bay
CDC	37.7010	-113.0988	Cedar City
CDG	49.0097	2.5478	Paris Charles de Gaulle Apt
CDH	33.6233	-92.7633	CAMDEN HARRELL FIELD
CDI	-20.8361	-41.1869	CACHOEIRO DO ITAPEMIIM
CDJ	-8.3483	-49.3025	CONCEICAO DO ARAGUAIA
CDR	42.8376	-103.0953	Chadron
CDS	34.4337	-100.2879	CHILDRESS
CDU	-34.0419	150.6861	CAMDEN
CDV	60.4917	-145.4775	Cordova Mudhole Smith Airport
CDW	40.8752	-74.2814	Caldwell
CEB	10.3075	123.9794	Cebu
CEC	41.7796	-124.2409	Crescent City
CED	-32.1300	133.7100	Ceduna
CEE	59.2733	38.0400	Cherepovets
CEF	42.1940	-72.5348	CHICOPEE/WESTOVER ARB
CEG	53.1781	-2.9778	Chester
CEI	19.9522	99.8831	Chiang Rai
CEK	55.3050	61.5050	Chelyabinsk
CEM	65.5739	-144.7809	Central
CEN	27.3930	-109.8334	Ciudad Obregon
CEQ	43.5464	6.9542	CANNES/MANDELIEU
CER	49.6508	-1.4753	CHERBOURG/MAUPERTUS
CES	-32.7875	151.3417	CESSNOCK
CET	47.0819	-0.8772	CHOLET/LE PONTREAU
CEW	30.7788	-86.5221	BOB SIKES
CEZ	37.3030	-108.6281	Cortez
CFA	58.2200	-157.5000	Coffee Point
CFB	-22.9217	-42.0743	Cabo Frio
CFC	-26.8063	-50.9399	Cacador
CFE	45.7858	3.1625	Clermont-Ferrand
CFF	66.7031	-119.7072	GLENDON/GREAT BEAR LAKE
CFG	22.1500	-80.4142	CIENFUEGOS JAIME GONZALES
CFK	36.2100	1.3300	Chlef
CFN	55.0442	-8.3409	Donegal
CFR	49.1733	-0.4500	Caen
CFS	-30.3200	153.1167	Coffs Harbour
CFU	39.6019	19.9122	Kerkyra
CGA	55.4788	-133.1478	Craig
CGB	-15.6500	-56.1175	Cuiaba
CGD	28.9189	111.6403	Changde
CGH	-23.6261	-46.6564	Sao Paulo Congonhas Apt
CGI	37.2253	-89.5708	Cape Girardeau
CGK	-6.1239	106.6611	Jakarta Soekarno-Hatta Apt
CGM	9.2535	124.7071	Camiguin
CGN	50.8659	7.1427	Cologne/Bonn Apt
CGO	34.5183	113.8417	Zhengzhou
CGP	22.2570	91.8222	Chittagong
CGQ	43.9983	125.6883	Changchun
CGR	-20.4694	-54.6703	Campo Grande
CGY	8.4162	124.6114	Cagayan de Oro
CHA	35.0353	-85.2038	Chattanooga Lovell Field Apt
CHC	-43.4894	172.5344	Christchurch
CHE	59.4467	24.7528	Tallinn Heliport
CHG	41.5381	120.4350	Chaoyang
CHH	-6.2000	-77.8833	CHACHAPOYAS
CHM	-9.1447	-78.5208	CHIMBOTE/TNT.J.A DE MONTREUIL
CHN	36.7178	127.4961	CHONGJU
CHO	38.1386	-78.4529	Charlottesville
CHQ	35.5314	24.1511	Chania
CHR	46.8603	1.7211	CHATEAUROUX DEOLS
CHS	32.8986	-80.0405	Charleston
CHT	-43.8100	-176.4572	CHATHAM ISLANDS
CHU	61.5791	-159.2156	Chuathbaluk
CHX	9.4589	-82.5153	Changuinola
CHY	-6.7119	156.3961	Choiseul Bay
CIA	41.7994	12.5972	Rome Ciampino Apt
CIC	39.7954	-121.8584	Chico
CID	41.8847	-91.7108	Cedar Rapids
CIF	42.2350	118.9083	Chifeng
CIG	40.4950	-107.5214	CRAIG-MOFFAT AIRPORT
CIH	36.2475	113.1258	Changzhi
CIJ	-11.0428	-68.7833	Cobija
CIK	66.6450	-143.7399	Chalkyitsik
CIN	37.5939	-83.3172	JACKSON JULIAN CARROLL
CIP	-13.5667	32.5911	Chipata
CIS	-2.7700	-171.7133	CANTON ISLAND
CIT	42.3642	69.4789	Shymkent
CIU	46.2508	-84.4724	Sault Ste Marie Chippewa County Apt
CIW	12.6990	-61.3424	  Canouan Island
CIX	-6.7875	-79.8281	Chiclayo
CIY	36.9953	14.6081	Comiso
CIZ	-4.1339	-63.1311	Coari
CJA	-7.1322	-78.4889	Cajamarca
CJB	11.0269	77.0418	Coimbatore
CJC	-22.4947	-68.9019	Calama
CJJ	36.7166	127.4991	Cheongju
CJL	35.8861	71.7999	Chitral
CJM	10.7118	99.3609	Chumphon
CJS	31.6364	-106.4288	Ciudad Juarez
CJT	16.1767	-92.0506	COMITAN
CJU	33.5122	126.4928	Jeju International
CKB	39.2966	-80.2281	Clarksburg
CKC	49.4161	31.9908	CHERKASSY
CKD	61.8679	-158.1349	Crooked Creek
CKG	29.7167	106.6400	Chongqing
CKH	70.6250	147.8967	Chokurdakh
CKL	55.8800	38.0633	CHKALOVSKIY
CKO	-23.1522	-50.6022	CORNELIO PROCOPIO
CKS	-6.1175	-50.0036	Carajas
CKT	36.4881	61.0700	SARAKHS
CKX	64.0713	-141.9523	Chicken
CKY	9.5769	-13.6120	Conakry
CKZ	40.1361	26.4247	Canakkale
CLA	23.4377	91.1895	COMILLA
CLD	33.1283	-117.2800	San Diego McClellan-Palomar Arpt
CLE	41.4117	-81.8498	Cleveland Hopkins International Apt
CLI	44.6133	-88.7317	CLINTONVILLE
CLJ	46.7851	23.6861	Cluj-Napoca
CLL	30.5885	-96.3637	College Station
CLM	48.1202	-123.4997	Port Angeles
CLN	-7.3333	-47.4333	CAROLINA
CLO	3.5431	-76.3817	Cali
CLP	58.8337	-158.5294	Clarks Point
CLQ	19.2770	-103.5776	Colima
CLT	35.2140	-80.9431	Charlotte
CLU	39.2617	-85.8967	COLUMBUS MUNICIPAL
CLV	-17.7247	-48.6100	Caldas Novas
CLY	42.5203	8.7931	Calvi
CLZ	8.9283	-67.4133	CALABOZO
CMA	-28.0300	145.6222	Cunnamulla
CMB	7.1802	79.8853	Bandaranaike Intl
CMD	-34.6233	148.0283	COOTAMUNDRA
CME	18.6522	-91.8011	Ciudad Del Carmen
CMF	45.6392	5.8800	CHAMBERY/AIX-LES-BAINS
CMG	-19.0119	-57.6714	Corumba
CMH	39.9980	-82.8919	Columbus Port Columbus Intl Apt
CMI	40.0393	-88.2781	Champaign
CMK	-14.3069	35.1325	  Club Makokola
CMN	33.3642	-7.5817	Casablanca Mohammed V Apt
CMP	-9.3350	-50.3497	SANTANA DO ARAGUAIA
CMQ	-22.7694	147.6194	CLERMONT
CMR	48.1103	7.3592	COLMAR/HOUSSEN
CMU	-6.0243	144.9705	Kundiawa
CMW	21.4203	-77.8475	Camaguey
CMX	47.1683	-88.4883	Hancock
CNB	-30.9833	148.3742	COONAMBLE
CNC	-10.0500	143.0667	  Poruma
CND	44.3621	28.4885	Constanta
CNF	-19.6244	-43.9719	Belo Horizonte Tancredo Neves Int Apt
CNG	45.6583	-0.3175	COGNAC/CHATEAUBERNARD
CNJ	-20.6731	140.5008	Cloncurry
CNK	39.5493	-97.6523	CONCORDIA/BLOSSER MUNI AIRPORT
CNL	57.5035	10.2294	SINDAL
CNM	32.3383	-104.2633	Carlsbad
CNP	70.7433	-22.6606	Neerlerit Inaat
CNQ	-27.4456	-58.7619	CORRIENTES
CNR	-26.3222	-70.6111	CHANARAL
CNS	-16.8867	145.7550	Cairns
CNU	37.6683	-95.4850	CHANUTE
CNW	31.6378	-97.0740	WACO
CNX	18.7714	98.9628	Chiang Mai
CNY	38.7550	-109.7548	Moab
COC	-31.3033	-58.0081	CONCORDIA/COM.J.J.PIERRESTEGUI
COD	44.5202	-109.0238	Cody
COE	47.7743	-116.8196	COEUR D ALENE AIR TERMINAL
COF	28.2349	-80.6101	PATRICK AFB
COH	26.3303	89.4167	COOCH BEHAR
COJ	-31.3350	149.2700	COONABARABRAN
COK	10.1539	76.4069	Kochi
COL	56.6000	-6.6170	  Coll Island
CON	43.2033	-71.5017	CONCORD
COO	6.3564	2.3833	Cotonou
COQ	48.1500	114.6667	Choibalsan
COR	-31.3100	-64.2083	Cordoba
COS	38.8058	-104.7002	Colorado Springs Peterson Field
COT	28.4567	-99.2183	COTULLA LA SALLE CO
COU	38.8183	-92.2200	Columbia
COZ	18.9000	-70.7167	CONSTANZA
CPA	4.3676	-7.7001	  Cape Palmas
CPC	-40.0819	-71.1458	San Martin de Los Andes
CPD	-29.0400	134.7194	Coober Pedy
CPE	19.6681	-90.5003	Campeche
CPH	55.6179	12.6560	Copenhagen Kastrup Apt
CPO	-27.2967	-70.4136	Copiapo
CPQ	-22.8586	-47.1075	CAMPINAS/AMARAIS
CPR	42.9079	-106.4643	Casper
CPT	-33.9681	18.6046	Cape Town
CPV	-7.2692	-35.8950	Campina Grande
CPX	18.3133	-65.3043	Culebra
CQD	32.2972	50.8422	SHAHRE KORD
CQF	50.9608	1.9514	CALAIS/DUNKERQUE
CQM	38.8564	-3.9700	  Ciudad Real
CQS	-12.4214	-64.2511	COSTA MARQUES
CRA	44.3181	23.8885	Craiova
CRC	4.7583	-75.9558	CARTAGO/SANTANA
CRD	-45.7853	-67.4656	Comodoro Rivadavia
CRE	33.8118	-78.7239	NORTH MYRTLE BEACH/GRAN.STRAND
CRI	22.7456	-74.1824	Crooked Island
CRK	15.1860	120.5603	Angeles/Mabalacat
CRL	50.4600	4.4528	Brussels S. Charleroi Airport
CRM	12.5022	124.6359	Catarman
CRP	27.7704	-97.5012	Corpus Christi International Apt
CRQ	-17.6500	-39.2539	CARAVELAS
CRS	45.4203	22.2522	CARANSEBES
CRU	12.4769	-61.4722	CARRIACOU IS/LAURISTON
CRV	38.9978	17.0797	CROTONE
CRW	38.3732	-81.5932	Charleston
CRZ	39.0833	63.6133	TURKMENABAT
CSA	56.0590	-6.2440	  Machrins
CSF	49.2536	2.5192	CREIL
CSG	32.5163	-84.9389	Columbus Metropolitan Apt
CSH	65.0500	35.6667	Solovetsky
CSI	-28.8833	153.0583	CASINO
CSK	12.3889	-16.7416	Cap Skiring
CSM	35.3400	-99.2000	CLINTON-SHERMAN
CSO	51.8559	11.4180	COCHSTEDT/SCHNEIDLINGEN
CSV	35.9513	-85.0850	CROSSVILLE MEM WHITSON FLD
CSX	28.1867	113.2217	Changsha
CSY	56.0900	47.3483	Cheboksary
CTA	37.4664	15.0642	Catania
CTB	48.6083	-112.3761	CUT BANK MUNI
CTC	-28.5864	-65.7533	Catamarca
CTE	9.4500	-78.9670	  Carti
CTG	10.4425	-75.5128	Cartagena
CTL	-26.4133	146.2617	Charleville
CTM	18.5046	-88.3267	Chetumal
CTN	-15.4461	145.1831	COOKTOWN
CTO	40.9067	-72.7917	CALVERTON/NAVAL WEAPONS INDUS.
CTS	42.7752	141.6923	Sapporo New Chitose Apt
CTT	43.2522	5.7836	LE CASTELLET
CTU	30.5783	103.9483	Chengdu
CTY	29.6350	-83.1050	CROSS CITY
CTZ	34.9750	-78.3656	CLINTON/SAMPSON
CUC	7.9314	-72.5142	Cucuta
CUE	-2.8894	-78.9844	Cuenca
CUF	44.5483	7.6222	Cuneo
CUG	-33.2783	148.7633	CUDAL
CUK	17.7347	-88.0325	Caye Caulker
CUL	24.7651	-107.4752	Culiacan
CUM	10.4539	-64.1297	Cumana
CUN	21.0375	-86.8770	Cancun
CUP	10.6667	-63.2500	CARUPANU
CUQ	-13.7625	143.1125	Coen
CUR	12.1889	-68.9597	Curacao
CUT	-38.9333	-69.2500	CUTRALCO
CUU	28.7023	-105.9630	Chihuahua
CUZ	-13.5358	-71.9388	Cuzco
CVG	39.0488	-84.6678	Cincinnati Northern Kentucky Intl Apt
CVJ	18.8345	-99.2616	CUERNAVACA
CVM	23.7025	-98.9558	Ciudad Victoria
CVN	34.4251	-103.0793	  Clovis
CVQ	-24.8800	113.6717	CARNAVON
CVS	34.3995	-103.3222	CANNON AFB/CLOVIS
CVT	52.3697	-1.4797	COVENTRY
CVU	39.6714	-31.1136	Corvo Island
CWA	44.7776	-89.6668	Wausau Central Wisconsin Apt
CWB	-25.5317	-49.1761	Curitiba Afonso Pena
CWC	48.2600	25.9817	CHERNIVTSI
CWF	30.2133	-93.1433	LAKE CHARLES CHENNAULT INTL
CWL	51.3967	-3.3433	Cardiff
CWT	-33.8467	148.6494	COWRA
CWW	-35.9936	146.3533	COROWA
CXA	7.6167	-66.1667	CAICARA
CXB	21.4498	91.9648	Cox's Bazar
CXF	67.2522	-150.2039	Coldfoot
CXH	49.2897	-123.1158	Vancouver Coal Harbour SPB
CXI	1.9911	-157.3586	Kiritimati
CXJ	-29.1950	-51.1892	Caxias Do Sul
CXR	12.2275	109.1922	Nha Trang Cam Ranh Airport
CXT	-20.0447	146.2719	CHARTERS TOWERS
CYB	19.6870	-79.8828	Cayman Brac
CYC	17.7008	-88.0411	  Caye Chapel
CYF	60.1492	-164.2856	Chefornak
CYI	23.4667	120.3833	CHIAYI/JIAYI
CYO	21.6161	-81.5456	Cayo Largo del Sur
CYP	12.0770	124.5478	Calbayog
CYR	-34.4514	-57.7669	COLONIA
CYS	41.1557	-104.8118	Cheyenne Municipal Apt
CYU	10.8581	121.0694	  Cuyo
CYW	20.5460	-100.8866	  Celaya
CYX	68.7433	161.3367	Chersky
CYZ	15.9319	121.7556	Cauayan
CZA	20.6413	-88.4462	CHICHEN ITZA
CZE	11.4167	-69.6667	Coro
CZF	61.7809	-166.0395	CAPE ROMANZOF LRRS AIRPORT
CZH	18.3670	-88.4000	Corozal
CZJ	9.5700	-79.3600	Corazon De Jesus
CZL	36.2853	6.6192	Constantine
CZM	20.5222	-86.9297	Cozumel
CZN	62.0712	-142.0484	  Chisana
CZS	-7.5994	-72.7694	Cruzeiro Do Sul
CZU	9.3333	-75.2833	Corozal
CZW	50.8850	19.2047	CZESTOCHOWA RUDNIKI
CZX	31.9197	119.7786	Changzhou
DAB	29.1798	-81.0581	Daytona Beach
DAC	23.8433	90.3978	Dhaka
DAD	16.0439	108.2004	Da Nang
DAG	34.8537	-116.7867	BARSTOW DAGGETT
DAK	25.4117	29.0017	DAKHLA
DAL	32.8470	-96.8517	Dallas/Fort Worth Love Field
DAM	33.4108	36.5133	Damascus
DAN	36.5729	-79.3361	DANVILLE REGIONAL
DAR	-6.8781	39.2026	Dar es Salaam
DAT	40.0603	113.4822	Datong
DAU	-9.0893	143.2131	Daru
DAV	8.3895	-82.4357	David
DAX	31.3000	107.5000	Dazhou
DAY	39.9024	-84.2194	Dayton Intl Apt
DBA	28.8792	64.4042	Dalbandin
DBB	30.9245	28.4614	AL ALAMAIN
DBO	-32.2167	148.5750	Dubbo
DBQ	42.4020	-90.7095	Dubuque
DBU	7.8559	80.6567	Dambula
DBV	42.5614	18.2682	Dubrovnik
DBY	-27.1550	151.2667	DALBY ARP
DCA	38.8521	-77.0377	Washington Ronald Reagan National Apt
DCF	15.3861	-61.4006	CANEFIELD
DCI	39.3547	8.9728	DECIMOMANNU
DCM	43.5550	2.2906	Castres
DCN	-17.5814	123.8283	Derby
DCY	29.3231	100.0533	Daocheng
DDC	37.7634	-99.9656	Dodge City
DDG	40.2000	124.2500	Dandong
DEA	29.9606	70.4853	Dera Ghazi Khan
DEB	47.4889	21.6153	Debrecen
DEC	39.8347	-88.8663	Decatur
DED	30.1872	78.1800	Dehra Dun
DEE	43.9670	145.6830	Yuzhno-Kurilsk
DEF	32.3803	48.4047	Dezful
DEL	28.5687	77.1121	Delhi
DEN	39.8617	-104.6732	Denver Intl Apt
DET	42.4092	-83.0099	DETROIT COLEMAN A.YOUNG MUNI
DEZ	35.2855	40.1761	DEIR ZZOR
DFW	32.8968	-97.0380	Dallas/Fort Worth Intl Apt
DGA	17.1830	-88.5830	Dangriga
DGE	-32.5650	149.6094	MUDGEE
DGO	24.1250	-104.5278	Durango
DGT	9.3361	123.2994	Dumaguete
DGX	51.4048	-3.4358	ST. ATHAN
DHA	26.2643	50.1525	KING ABDULAZIZ AIR BASE DHARAN
DHB	48.6160	-123.0000	Deer Harbor
DHF	24.2500	54.5500	AL DHAFRA
DHI	28.7533	80.5819	Dhangarhi
DHM	32.1651	76.2634	Dharamsala
DHN	31.3213	-85.4497	Dothan
DHR	52.9244	4.7808	DEN HELDER/DE KOOY
DHT	36.0226	-102.5473	DALHART MUNI
DIB	27.4810	95.0180	Dibrugarh
DIE	-12.3528	49.2950	Antsiranana
DIG	27.7936	99.6772	Deqen
DIJ	47.2658	5.0950	Dijon
DIK	46.7967	-102.8017	Dickinson
DIL	-8.5439	125.5219	Dili
DIN	21.3977	103.0091	Dien Bien Phu
DIO	65.7586	-168.9531	  Diomede
DIQ	-20.1814	-44.8694	DIVINOPOLIS
DIR	9.6378	41.8489	Dire Dawa
DIU	20.7170	70.9170	Diu
DIW	6.9667	81.0000	Dicwella SPB
DIY	37.8925	40.2011	Diyarbakir
DJB	-1.6356	103.6431	Jambi
DJE	33.8756	10.7772	Djerba
DJG	24.2931	9.4519	Djanet
DJJ	-2.5719	140.5114	Jayapura
DKA	13.0078	7.6605	Katsina
DKB	41.9337	-88.7057	DE KALB
DKO	42.4324	20.4267	DAKOVICA/AMIKO
DKR	14.7439	-17.4794	Dakar
DKS	73.5167	80.3817	DIKSON
DLA	4.0117	9.7083	Douala
DLC	38.9600	121.5300	Dalian
DLE	47.0428	5.4350	Dole
DLF	29.3595	-100.7780	LAUGHLIN AFB/AIRPORT
DLG	59.0446	-158.5054	Dillingham
DLH	46.8421	-92.1936	Duluth International Apt
DLI	11.7505	108.3739	Dalat
DLM	36.7126	28.7915	Dalaman
DLS	45.6185	-121.1673	COLUMBIA GORGE RGNL/DALLES MUN
DLU	25.6494	100.3194	Dali
DLY	-18.7694	169.0014	Dillons Bay
DLZ	43.5917	104.4299	Dalanzadgad
DMA	32.1665	-110.8832	DAVIS MONTHAN AFB
DMB	42.8533	71.3033	Taraz
DMD	-17.9333	138.8167	Doomadgee Mission
DME	55.4083	37.9083	Moscow Domodedovo Apt
DMK	13.9126	100.6068	Bangkok Don Mueang International Arpt
DMM	26.4712	49.7979	Dammam
DMN	32.2623	-107.7206	DEMING MUNI AIRPORT
DMT	-18.2328	-43.6506	DIAMANTINA
DMU	25.8850	93.7700	Dimapur
DNA	26.3557	127.7675	KADENA
DND	56.4525	-3.0258	Dundee
DNH	40.1611	94.8092	Dunhuang
DNK	48.3572	35.1006	Dnipropetrovsk
DNQ	-35.5597	144.9472	DENILIQUIN
DNR	48.5878	-2.0800	Dinard/St-Malo
DNV	40.1992	-87.5959	DANVILLE/VERMILION COUNTY APT
DNX	12.5333	35.0583	DINDER/GALEGU
DNZ	37.7878	29.7050	Denizli
DOB	-5.7722	134.2125	Dobo
DOD	-6.1704	35.7494	DODOMA
DOG	19.1526	30.4302	DONGOLA
DOH	25.2611	51.5651	Doha
DOK	48.0736	37.7397	Donetsk
DOL	49.3633	0.1600	Deauville
DOM	15.5414	-61.3011	Dominica Melville Hall Apt
DOP	28.9857	82.8191	  Dolpa
DOU	-22.1978	-54.9242	Dourados
DOV	39.1295	-75.4659	DOVER AFB
DOY	37.4544	118.4719	Dongying
DPA	41.9067	-88.2483	CHICAGO - DUPAGE
DPL	8.6011	123.3431	Dipolog
DPO	-41.1700	146.4289	Devonport
DPS	-8.7475	115.1692	Denpasar-Bali
DQA	46.5833	125.0000	Daqing
DRA	36.6194	-116.0328	MERCURY DESERT ROCK
DRB	-17.3714	123.6594	DERBY
DRG	66.0696	-162.7664	Deering
DRK	8.7189	-83.6417	Drake Bay
DRO	37.1517	-107.7533	Durango La Plata Apt
DRS	51.1328	13.7672	Dresden
DRT	29.3742	-100.9272	DEL RIO INTL
DRV	5.1583	73.1306	Dharavandhoo Island
DRW	-12.4161	130.8767	Darwin International
DSA	53.4747	-1.0044	Doncaster/Sheffield
DSK	31.9094	70.8966	Dera Ismail Khan
DSM	41.5341	-93.6506	Des Moines
DSN	39.8500	110.0330	Ordos
DTD	0.7170	116.4830	Datadawai
DTE	14.1333	122.9861	DAET
DTI	-18.2287	-43.6478	Diamantina
DTM	51.5183	7.6122	Dortmund
DTW	42.2124	-83.3534	Detroit Wayne County
DUB	53.4214	-6.2700	Dublin
DUC	34.4709	-97.9599	HALLIBURTON FLD
DUD	-45.9281	170.1983	Dunedin
DUG	31.4727	-109.6021	DOUGLAS/BISBEE-DOUGLAS
DUJ	41.1783	-78.8983	Dubois
DUR	-29.9656	30.9493	Durban King Shaka International Apt
DUS	51.2809	6.7573	Duesseldorf International Airport
DUT	53.9000	-166.5435	Dutch Harbor
DVD	-22.1111	43.2706	Andavadoaka
DVK	64.5113	-110.2895	DIAVIK DIAMOND MINE
DVL	48.1142	-98.9088	DEVILS LAKE MUNI
DVO	7.1255	125.6458	Davao
DWB	-16.0830	45.3670	  Soalala
DWC	24.8861	55.1722	Dubai Al Maktoum Intl
DWD	24.5000	44.4000	Dawadmi
DXB	25.2528	55.3644	Dubai International
DYA	-22.6217	148.3633	DYSART
DYG	29.1028	110.4433	Zhangjiajie
DYR	64.7350	177.7383	Anadyr
DYS	32.4222	-99.8597	DYESS AFB
DYU	38.5433	68.8250	Dushanbe
DZA	-12.8067	45.2806	Dzaoudzi
DZN	47.7089	67.7392	Zhezkazgan
DZO	-33.3564	-56.4961	DURAZNO/SANTA BERNARDINA
EAA	64.7781	-141.1496	Eagle
EAE	-17.0900	168.3420	Emae
EAL	9.3300	166.8420	Kwajalein Atoll MH
EAM	17.6111	44.4200	Nejran
EAR	40.7238	-99.0068	Kearney
EAS	43.3565	-1.7906	San Sebastian
EAT	47.3984	-120.2062	Wenatchee
EAU	44.8658	-91.4843	Eau Claire
EBA	42.7628	10.2406	Elba Island
EBB	0.0408	32.4405	Entebbe
EBD	13.1529	30.2327	El Obeid
EBH	33.6861	1.0139	El Bayadh
EBJ	55.5264	8.5525	Esbjerg Airport
EBL	36.2376	43.9632	Erbil
EBM	31.7167	9.2667	EL BORMA
EBO	4.6000	168.7500	XXX
EBU	45.5342	4.2972	St-Etienne
ECA	-50.2803	-72.0532	EL CALAFATE
ECG	36.2606	-76.1746	ELISABETH CITY CGAS
ECH	-36.1567	144.7617	ECHUCA
ECN	35.1489	33.4997	Ercan
ECP	30.3582	-85.7956	Panama City NW Florida Beaches Intl
EDA	55.9540	-133.6580	Edna Bay
EDB	18.0250	30.9583	DEBBA
EDF	61.2531	-149.7939	ANCHORAGE ELMENDORF AFB
EDI	55.9500	-3.3725	Edinburgh
EDL	0.4045	35.2389	Eldoret
EDM	46.7025	-1.3817	LA ROCHE SUR YON/LES AJONCS
EDO	39.5614	27.0247	Edremit
EDR	-14.8967	141.6094	Pormpuraaw
EDW	34.9054	-117.8837	EDWARDS AFB
EED	34.7667	-114.6233	NEEDLES
EEK	60.2184	-162.0235	Eek
EFD	29.6073	-95.1587	HOUSTON/ELLINGTON FIELD
EFG	-9.1500	147.6500	  Efogi
EFL	38.1200	20.5006	Kefallinia
EGC	44.8244	0.5206	Bergerac
EGD	51.1583	-1.7400	BOSCOMBE DOWN
EGE	39.6425	-106.9176	Vail/Eagle County Apt
EGM	-8.5667	157.8667	Seghe
EGN	13.4835	22.4725	Geneina
EGO	50.6433	36.5917	Belgorod
EGS	65.2833	-14.4014	Egilsstadir
EGV	45.9323	-89.2683	  Eagle River
EGX	58.1855	-157.3754	Egegik
EHL	-41.9667	-71.5167	EL BOLSON
EHM	58.6465	-162.0628	CAPE NEWENHAM
EIE	58.4742	92.1125	  Yeniseysk
EIK	46.6700	38.1800	Eisk
EIL	64.6657	-147.1015	EIELSON AFB/FAIRBANKS
EIN	51.4500	5.3744	Eindhoven Airport
EIS	18.4458	-64.5411	Tortola
EJA	7.0244	-73.8069	Barrancabermeja
EJH	26.1986	36.4761	Wedjh
EJT	6.1333	171.9167	XXX
EKA	40.8056	-124.1156	EUREKA
EKB	51.5900	75.2200	EKIBASTUZ
EKI	37.0007	-101.8800	ELKHART
EKN	38.8900	-79.8567	ELKINS
EKO	40.8249	-115.7917	Elko
EKS	49.1830	142.0830	Shakhtersk
EKT	59.3522	16.7083	ESKILSTUNA
ELC	-12.0208	135.5722	Elcho Island
ELD	33.2210	-92.8133	El Dorado
ELF	13.6149	25.3246	El Fasher
ELG	30.5689	2.8647	El Golea
ELH	25.4749	-76.6835	North Eleuthera
ELI	64.6150	-162.2705	Elim
ELL	-23.7261	27.6878	Ellisras
ELM	42.1599	-76.8916	Elmira/Corning
ELO	47.8250	-91.8300	ELY MUNI
ELP	31.8067	-106.3778	El Paso International Apt
ELQ	26.3028	43.7741	Gassim
ELS	-33.0347	27.8222	East London
ELT	28.2089	33.6456	EL TOR
ELU	33.5131	6.7825	El Oued
ELV	58.1952	-136.3474	Elfin Cove
ELY	39.2997	-114.8418	ELY AIRPORT YELLAND FIELD
EMA	52.8311	-1.3281	Nottingham East Midlands Airport
EMD	-23.5675	148.1806	Emerald
EME	53.3910	7.2256	EMDEN
EMK	62.7861	-164.4907	Emmonak
EML	47.0933	8.3067	EMMEN
EMP	38.3317	-96.1917	EMPORIA MUNI
ENA	60.5731	-151.2450	Kenai
ENC	48.6922	6.2261	NANCY/ESSEY
ENE	-8.8493	121.6606	Ende
ENF	68.3644	23.4275	ENONTEKIO
ENH	30.3203	109.4850	Enshi
ENI	11.2020	119.4170	  El Nido
ENK	54.3989	-7.6517	ENNISKILLEN/ST ANGELO
ENL	38.5151	-89.0911	CENTRALIA MUNI
ENN	64.5473	-149.0740	NENANA
ENO	-34.5631	-58.7903	MARIANO MORENO
ENQ	14.3817	-87.6217	CORONEL ENRIQUE SOTO CANO AB
ENS	52.2758	6.8892	ENSCHEDE/TWENTHE
ENT	11.3400	162.3283	ENEWETAK AUX AAF
ENU	5.4672	7.5589	Enugu
ENV	40.7186	-114.0308	WENDOVER
ENY	36.6369	109.5539	Yan'an
EOH	6.2203	-75.5906	Medellin Enrique Olaya Herrerra Apt
EOI	59.1914	-2.7739	Eday
EOR	6.7333	-61.5833	EL DORADO
EOZ	7.0597	-69.4967	  Elorza
EPH	47.3075	-119.5158	EPHRATA MUNI
EPL	48.3250	6.0667	EPINAL/MIRECOURT
EPR	-33.6858	121.8211	Esperance
EPU	58.4190	24.4728	P�rnu
EQS	-42.9333	-71.1442	Esquel
ERC	39.7131	39.5206	Erzincan
ERF	50.9797	10.9581	Erfurt
ERH	31.9482	-4.4007	ERRACHIDIA MOULAY ALI CHERIF
ERI	42.0819	-80.1761	Erie
ERL	43.6600	112.0000	Erenhot
ERM	-27.6619	-52.2683	Erechim
ERN	-6.6667	-69.9167	Eirunepe
ERS	-22.6075	17.0792	Windhoek Eros Apt
ERZ	39.9561	41.1694	Erzurum
ESB	40.1281	32.9950	Ankara Esenboga Apt
ESC	45.7227	-87.0937	Escanaba
ESD	48.7082	-122.9105	Eastsound
ESE	31.7947	-116.6008	ENSENADA
ESF	31.3947	-92.2958	ALEXANDRIA ESLER REGIONAL
ESH	50.8356	-0.2972	SHOREHAM
ESK	39.7822	30.5828	ESKISEHIR
ESL	46.3733	44.3317	Elista
ESM	0.9786	-79.6267	Esmeraldas
ESR	-26.3133	-69.7658	EL SALVADOR/RICARDO GARCIA P.
ESS	-37.7281	144.9019	Essendon
ESU	31.3972	-9.6819	Essaouira
ETH	29.5594	34.9592	Eilat
ETR	3.4330	-79.9830	Santa Rosa
ETZ	48.9783	6.2467	Metz/Nancy Lorraine
EUA	-21.3783	-174.9575	  Eua
EUG	44.1245	-123.2120	Eugene
EUN	27.1517	-13.2192	Laayoune
EUX	17.4924	-62.9750	St Eustatius
EVE	68.4889	16.6783	Harstad-Narvik
EVG	62.0478	14.4242	Sveg
EVN	40.1473	44.3959	Yerevan
EVV	38.0370	-87.5324	Evansville
EVX	49.0286	1.2200	EVREUX/FAUVILLE
EWB	41.6825	-70.9617	New Bedford
EWD	56.4500	-159.7600	Wildman Lake
EWN	35.0731	-77.0431	New Bern
EWR	40.6925	-74.1687	New York Newark Liberty International Apt
EXI	58.4205	-135.4490	Excursion Inlet
EXT	50.7344	-3.4139	Exeter
EYK	63.6800	66.6800	Beloyarsky
EYP	5.3191	-72.3841	Yopal
EYW	24.5562	-81.7595	Key West International Apt
EZE	-34.8222	-58.5358	Buenos Aires Ministro Pistarini
EZS	38.6050	39.2939	Elazig
EZV	63.5600	65.0300	Berezovo (RU)
F47	29.6460	-84.9166	APALACHICOLA / ST. GEORGE ISL
FAA	10.0060	-10.7599	FARANAH
FAB	51.2758	-0.7764	FARNBOROUGH
FAC	-16.6867	-145.3328	Faaite
FAE	62.0636	-7.2772	Faroe Islands
FAH	32.3656	62.1651	Farah
FAI	64.8137	-147.8597	Fairbanks International Apt
FAK	-16.0500	-145.6500	FAKARAVA
FAN	58.1003	6.6250	FARSUND/LISTA
FAO	37.0144	-7.9659	Faro
FAR	46.9207	-96.8158	Fargo
FAT	36.7762	-119.7181	Fresno Yosemite International Airport
FAV	-16.0542	-145.6570	Fakarava
FAY	34.9911	-78.8803	Fayetteville Municipal Apt
FBA	-2.5315	-66.0714	Fonte Boa
FBD	37.1219	70.5186	Faizabad
FBE	-26.0589	-53.0633	Francisco Beltrao
FBK	64.8365	-147.6168	FAIRBANKS/FORT WAINWRIGHT AAF
FBM	-11.5913	27.5309	Lubumbashi
FBS	48.5436	-123.0061	Friday Harbor SPB
FCA	48.3105	-114.2560	Kalispell
FCN	53.7683	8.6642	NORDHOLZ
FCO	41.8003	12.2389	Rome Fiumicino Apt
FCS	38.6784	-104.7566	BUTTS ARMY AFLD FT CARSON
FDE	61.3911	5.7569	Forde
FDF	14.5922	-60.9964	Fort de France
FDH	47.6713	9.5115	Friedrichshafen
FDK	39.4178	-77.3744	FREDERICK MUNI
FDY	41.0120	-83.6686	FINDLAY
FEC	-12.2025	-38.9061	FEIRA DE SANTANA/J.D.CARNEIRO
FEG	40.3583	71.7450	Fergana
FEL	48.2057	11.2670	FUERSTENFELDBRUCK
FEN	-3.8500	-32.4167	Fernando De Noronha
FEP	42.2462	-89.5820	FREEPORT ALBERTUS
FEZ	33.9272	-4.9792	Fes
FFD	51.6833	-1.7833	FAIRFORD (RAF)
FGD	22.6667	-12.7333	FDERIK
FGU	-15.8231	-140.8833	Fangatau
FHU	31.5885	-110.3444	FORT HUACHUCA/SIERRA VISTA
FHZ	-15.9922	-140.1647	Fakahina
FIH	-4.3856	15.4447	Kinshasa N'Djili Intl Apt
FJR	25.1097	56.3306	Fujairah
FKB	48.7794	8.0805	Karlsruhe/Baden-Baden Baden Airpark
FKI	0.4817	25.3380	Kisangani
FKJ	36.1428	136.2239	FUKUI
FKL	41.3778	-79.8603	Franklin Chess Lamberton Apt
FKQ	-2.9202	132.2670	Fak Fak
FKS	37.2275	140.4281	Fukushima
FLA	1.5889	-75.5639	Florencia
FLB	-6.8458	-43.0775	FLORIANO/CANGAPARA
FLG	35.1386	-111.6711	Grand Canyon Pulliam Field Airport
FLL	26.0727	-80.1527	Fort Lauderdale/Hollywood Intl Apt
FLN	-27.6703	-48.5522	Florianopolis
FLO	34.1854	-79.7239	Florence
FLR	43.8097	11.2039	Florence Amerigo Vespucci
FLS	-40.0903	147.9933	Flinders Island
FLV	39.3683	-94.9150	FT LEAVENWORTH SHERMAN AAF
FLW	39.4580	-31.1321	Flores Island
FMA	-26.2128	-58.2281	Formosa
FMH	41.6583	-70.5217	FALMOUTH/OTIS AFB
FMI	-5.8755	29.2494	Kalemie
FMM	47.9888	10.2395	Memmingen
FMN	36.7420	-108.2298	Farmington
FMO	52.1346	7.6848	Muenster/Osnabrueck
FMY	26.5867	-81.8633	FT MYERS PAGE FLD
FNA	8.6165	-13.1956	Freetown Lungi International Apt
FNB	53.6037	13.3101	NEUBRANDENBURG
FNC	32.6942	-16.7781	Funchal
FNE	-8.5500	147.0830	  Fane
FNI	43.7575	4.4164	Nimes
FNJ	39.2436	125.6758	Pyongyang
FNL	40.4518	-105.0113	  Fort Collins/Loveland
FNT	42.9654	-83.7436	Flint
FOA	38.6649	-88.4530	FLORA MUNI
FOC	25.9333	119.6617	Fuzhou
FOD	42.5512	-94.1918	  Fort Dodge
FOE	38.9509	-95.6636	Topeka Forbes AFB
FOG	41.4339	15.5358	Foggia
FOM	5.6444	10.7564	FOUMBAN
FON	10.4744	-84.5817	Fortuna
FOR	-3.7761	-38.5325	Fortaleza
FOS	-30.8394	128.1136	FORREST
FPM	48.6053	2.6708	MELUN/VILLAROCHE
FPO	26.5587	-78.6956	Freeport
FPR	27.4950	-80.3683	FT PIERCE ST LUCIE CO INTL
FRA	50.0333	8.5705	Frankfurt International Apt
FRB	-33.3633	147.9350	FORBES
FRC	-20.5897	-47.3819	FRANCA
FRD	48.5220	-123.0244	Friday Harbor
FRE	-8.1075	159.5772	Fera Island
FRG	40.7288	-73.4134	FARMINGDALE/REPUBLIC
FRL	44.1964	12.0706	FORLI
FRO	61.5836	5.0247	Floro
FRS	16.9233	-89.8700	Flores
FRU	43.0617	74.4783	Bishkek
FRW	-21.1608	27.4821	Francistown
FRZ	51.1145	9.2858	FRITZLAR
FSC	41.5022	9.0967	Figari
FSD	43.5820	-96.7419	Sioux Falls
FSK	37.7984	-94.7694	FORT SCOTT MUNI
FSM	35.3366	-94.3674	Fort Smith
FSP	46.7632	-56.1743	St Pierre
FSS	57.6500	-3.5517	KINLOSS
FSZ	34.7961	138.1894	Shizuoka
FTA	-19.5164	170.2319	Futuna Island
FTE	-50.2803	-72.0531	El Calafate
FTG	39.7852	-104.5431	FRONT RANGE DENVER
FTK	37.9071	-85.9720	GODMAN AAF (FT. KNOX)
FTU	-25.0381	46.9561	Tolanaro
FTW	32.8198	-97.3624	FORT WORTH/MEACHAM INTL
FTY	33.7792	-84.5222	ATLANTA/FULTON COUNTY
FUE	28.4527	-13.8638	Fuerteventura
FUG	32.8817	115.7339	Fuyang
FUJ	32.6664	128.8328	Fukue
FUK	33.5844	130.4517	Fukuoka
FUN	-8.5250	179.1950	Funafuti
FUO	23.0833	113.0708	Foshan
FUT	-14.3114	-178.0661	Futuna
FVM	-0.3090	73.4320	Fuvahmulak Island
FWA	40.9785	-85.1951	Fort Wayne Baer Field
FWC	38.3786	-88.4128	FAIRFIELD MUNI
FWH	32.7683	-97.4417	CARSWELL AFB
FXE	26.1973	-80.1707	FORT LAUDERDALE EXECUTIVE
FYT	17.9161	19.1089	FAYA LARGEAU
FYU	66.5715	-145.2504	Fort Yukon
FYV	36.0053	-94.1700	FAYETTEVILLE DRAKE FLD
FZO	51.5194	-2.5908	BRISTOL/FILTON
GAD	33.9726	-86.0890	NE ALABAMA RGNL AIRPORT
GAE	33.8833	10.1167	Gabes
GAF	34.4156	8.8136	Gafsa
GAH	-25.6153	151.6228	GAYNDAH
GAJ	38.4119	140.3711	Yamagata
GAL	64.7362	-156.9373	Galena
GAM	63.7668	-171.7328	Gambell
GAN	-0.6933	73.1556	Gan Island
GAO	20.0853	-75.1583	Guantanamo Bay NS
GAQ	16.2483	0.0058	GAO
GAU	26.1044	91.5886	Guwahati
GAX	-2.7670	9.9830	  Gamba
GAY	24.7481	84.9425	GAYA
GBB	40.8088	47.7252	Gabala
GBD	38.3443	-98.8592	  Great Bend
GBE	-24.5558	25.9189	Gaborone
GBJ	15.8686	-61.2722	MARIE GALANTE
GBT	36.9094	54.4014	Gorgan
GCC	44.3489	-105.5394	Gillette
GCH	30.3376	50.8280	Gachsaran
GCI	49.4350	-2.6020	Guernsey
GCJ	-25.9871	28.1405	GRAND CENTRAL
GCK	37.9275	-100.7243	Garden City
GCM	19.2924	-81.3592	Grand Cayman
GCN	35.9523	-112.1470	Grand Canyon National Park Apt
GCO	-23.4400	-57.4267	CONCEPCION/CARMELO PERALTA
GCW	35.9903	-113.8164	Grand Canyon West
GDE	5.9351	43.5786	Gode
GDG	53.4667	125.8133	MAGDAGACHI
GDL	20.5214	-103.3108	Guadalajara
GDN	54.3776	18.4662	Gdansk
GDO	7.2333	-70.8000	GUASDUALITO
GDQ	12.5199	37.4340	Gonder
GDT	21.4445	-71.1423	Grand Turk
GDV	47.1386	-104.8072	Glendive
GDX	59.9100	150.7183	Magadan
GDZ	44.5703	38.0122	Gelendzhik
GEA	-22.2631	166.4681	Noumea Magenta Apt
GEC	35.2333	33.7328	GECITKALE
GEG	47.6198	-117.5337	Spokane International Apt
GEL	-28.2817	-54.1683	Santo Angelo
GEO	6.4989	-58.2544	Georgetown
GER	21.8383	-82.7792	NUEVA GERONA
GES	6.1075	125.2328	General Santos
GET	-28.7975	114.7061	Geraldton
GEV	67.1331	20.8122	Gallivare
GEY	44.5168	-108.0828	SOUTH BIG HORN CO.
GFA	47.5046	-111.1873	GREAT FALLS/MALMSTROM AFHP
GFF	-34.2517	146.0667	Griffith
GFK	47.9493	-97.1761	Grand Forks
GFL	43.3411	-73.6103	GLENS FALLS FLOYD BENNETT MEML
GFN	-29.7633	153.0286	Grafton
GFY	-19.6000	18.1333	GROOTFONTEIN
GGG	32.3840	-94.7115	Longview
GGM	0.2664	34.7833	Kakamega
GGS	-48.7836	-70.1608	GOBERNADOR GREGORES
GGT	23.5626	-75.8780	George Town
GGW	48.2125	-106.6147	Glasgow
GHA	32.3817	3.7994	Ghardaia
GHB	25.2847	-76.3310	Governors Harbour
GHC	25.7383	-77.8401	  Bullock Harbour
GHE	8.0670	-78.3670	Garachine
GHF	49.6483	9.9667	GIEBELSTADT AAF
GHT	25.1369	10.1450	Ghat
GHU	-33.0108	-58.6125	GUALEGUAYCHU
GIB	36.1500	-5.3500	Gibraltar
GIC	-9.2333	142.2183	  Boigu Island
GIG	-22.8100	-43.2506	Rio de Janeiro International Apt
GII	11.4011	-9.1868	SIGUIR
GIL	35.9244	74.3403	Gilgit
GIR	4.2761	-74.7958	GIRARDOT / SANTIAGO VILA
GIS	-38.6633	177.9783	Gisborne
GIU	7.9558	80.7281	Sigiriya
GIZ	16.9011	42.5858	Jazan
GJA	16.4454	-85.9066	Guanaja
GJL	36.7944	5.8736	JIJEL/FERHAT ABBAS
GJM	-10.7881	-65.2811	GUAJARA-MIRIM
GJT	39.1224	-108.5267	Grand Junction
GKA	-6.0844	145.3966	Goroka
GKE	50.9608	6.0425	GEILENKIRCHEN
GKK	0.7308	73.4331	Kooddoo Island
GKN	62.1549	-145.4566	GULKANA
GLA	55.8719	-4.4331	Glasgow International Airport
GLD	39.3706	-101.6989	GOODLAND RENNER FLD (GOD.MUNI)
GLE	33.6514	-97.1969	GAINESVILLE MUNI
GLF	8.6538	-83.1805	Golfito
GLH	33.4828	-90.9856	Greenville
GLI	-29.6767	151.6917	GLEN INNES
GLK	6.7808	47.4547	Galcaio
GLN	29.0267	-10.0503	Guelmime
GLO	51.8942	-2.1672	Gloucester/Cheltenham
GLS	29.2653	-94.8604	GALVESTON INTL-SCHOLES FLD
GLT	-23.8714	151.2217	Gladstone
GLV	64.5505	-163.0072	Golovin
GLZ	51.5681	4.9331	BREDA/GILZE-RIJEN
GMA	3.2667	19.7667	Gemena
GMB	8.1173	34.5634	Gambela
GME	52.5272	31.0183	GOMEL
GMI	-6.2711	150.3306	  Gasmata Island
GML	50.5983	30.1967	KYIV/ANTONOV-GOSTOMEL
GMN	-42.4617	171.1900	GREYMOUTH
GMO	10.2894	11.1717	Gombe
GMP	37.5569	126.7975	Seoul Gimpo International Airport
GMR	-23.0833	-134.8833	Totegegie
GMU	34.8481	-82.3500	GREENVILLE DOWNTOWN
GMZ	28.0296	-17.2146	San Sebastian/Gomera
GNA	53.6017	24.0550	GRODNO
GNB	45.3631	5.3328	GRENOBLE ST GEOIRS
GND	12.0039	-61.7861	Grenada
GNE	-21.7000	21.6667	GHANZI
GNI	22.6744	121.4583	LYUDAO
GNM	-14.2064	-42.7506	GUANAMBI
GNR	-38.9833	-67.6000	GENERAL ROCA/FUERTE GRAL ROCA
GNS	1.1664	97.7047	Gunung Sitoli
GNT	35.1653	-107.9006	GRANTS-MILAN MUNI
GNU	59.1174	-161.5774	Goodnews Bay
GNV	29.6900	-82.2719	Gainesville
GNY	37.0919	38.8462	Sanliurfa
GOA	44.4131	8.8378	Genoa
GOH	64.1909	-51.6781	Nuuk
GOI	15.3797	73.8278	Goa
GOJ	56.2300	43.7833	Nizhny Novgorod
GOM	-1.6709	29.2384	Goma
GON	41.3300	-72.0451	GROTON/NEW LONDON
GOO	-28.5217	150.3200	GOONDIWINDI
GOP	26.7397	83.4497	Gorakhpur
GOQ	34.6333	98.8667	Golmud
GOT	57.6600	12.2911	Goteborg Landvetter Apt
GOU	9.3367	13.3811	Garoua
GOV	-12.2700	136.8183	Nhulunbuy
GOY	-29.1000	-59.2500	GOYA
GOZ	43.1517	25.7117	GORNA/ORYAHOVITSA
GPA	38.1500	21.4167	Patrai
GPB	-25.3881	-51.5244	GUARAPUAVA
GPI	2.5701	-77.8986	Guapi
GPO	-35.6875	-63.7417	GENERAL PICO
GPS	-0.4539	-90.2658	Baltra Island
GPT	30.4073	-89.0701	Gulfport/Biloxi
GPZ	47.2111	-93.5098	GRAND RAPIDS/ITASCA CO NEWSTRO
GRB	44.4851	-88.1296	Green Bay
GRF	47.0792	-122.5807	GRAY AAF AIRPORT FT LEWIS
GRI	40.9675	-98.3096	Grand Island
GRJ	-34.0111	22.3806	George
GRK	31.0672	-97.8289	Killeen Gray AAF
GRO	41.9010	2.7605	Girona
GRP	-11.7433	-49.1250	GURUPI
GRQ	53.1250	6.5833	Groningen
GRR	42.8808	-85.5228	Grand Rapids
GRS	42.7597	11.0719	GROSSETO
GRU	-23.4356	-46.4731	Sao Paulo Guarulhos Intl Apt
GRV	43.3330	45.7000	Grozny
GRW	39.0922	-28.0298	Graciosa Island
GRX	37.1887	-3.7774	Granada
GRY	66.5547	-18.0175	GRIMSEY
GRZ	46.9931	15.4392	Graz
GSB	35.3393	-77.9607	GOLDSBORO/SEYMOUR JOHNSON AFB
GSE	57.7756	11.8706	Goteborg City Apt
GSM	26.7519	55.8972	Gheshm Island
GSO	36.0977	-79.9373	Greensboro/High Point
GSP	34.8956	-82.2188	Greenville/Spartanburg Apt
GSQ	22.5833	28.7161	SHARK EL-OWINAT
GST	58.4243	-135.7073	Gustavus Apt
GSU	14.1333	35.3167	GEDAREF
GTA	-8.7500	158.2000	Gatokae SB
GTB	44.0556	-75.7195	WHEELER SACK AAF
GTE	-13.9750	136.4600	Groote Eylandt
GTF	47.4820	-111.3707	Great Falls International Apt
GTH	30.1167	30.9167	CAIRO WEST MIL
GTO	0.6383	122.8522	Gorontalo
GTR	33.4503	-88.5914	Columbus Golden Triangle Regional Apt
GTS	-26.9500	133.6000	The Granites
GTZ	-2.0169	34.2210	Grumeti
GUA	14.5817	-90.5267	Guatemala City
GUC	38.5339	-106.9330	Gunnison
GUH	-30.9611	150.2506	GUNNEDAH
GUI	10.5800	-62.3183	GUIRIA ALMIRANTE/C. COLON
GUJ	-22.7911	-45.2039	GUARATINGUETA
GUL	-34.8089	149.7278	GOULBURN
GUM	13.4839	144.7972	Guam Antonio B Won Pat International
GUP	35.5111	-108.7893	GALLUP MUNI
GUQ	9.0167	-69.7333	GUANARE
GUR	-10.3104	150.3341	Alotau
GUT	51.9237	8.3075	GUTERSLOH
GUW	47.1219	51.8214	Atyrau
GUY	36.6853	-101.5078	GUYMON MUNI
GUZ	-20.6500	-40.4917	GUARAPARI
GVA	46.2383	6.1094	Geneva
GVE	38.1567	-78.1650	GORDONSVILLE MUNI
GVN	48.5800	140.1800	Sovetskaya Gavan
GVR	-18.8947	-41.9817	Governador Valadares
GVT	33.0678	-96.0653	GREENVILLE MAJORS
GVX	60.5933	16.9514	GAVLE
GWD	25.2333	62.3295	Gwadar
GWE	-19.4417	29.8583	GWERU/THORNHILL
GWL	26.2933	78.2278	Gwalior
GWO	33.4950	-90.0850	GREENWOOD/LEFLORE
GWT	54.9116	8.3424	Westerland
GWY	53.3002	-8.9412	GALWAY
GXF	15.9636	48.7850	Sayun
GXG	-7.7667	15.3000	NEGAGE
GXH	34.8106	102.6447	Xiahe
GXQ	-45.5928	-72.1019	COYHAIQUE/TENIENTE VIDAL
GYA	-10.8217	-65.3458	Guayaramerin
GYD	40.4675	50.0467	Baku Heydar Aliyev International Apt
GYE	-2.1581	-79.8839	Guayaquil
GYH	34.7583	-82.3764	DONALDSON CENTER AIRPORT
GYI	-1.6772	29.2589	  Gisenyi
GYL	-16.6369	128.4500	ARGYLE
GYM	27.9693	-110.9178	GUAYMAS
GYN	-16.6297	-49.2267	Goiania
GYP	-26.2833	152.7000	GYMPIE
GYR	33.4237	-112.3745	PHOENIX GOODYEAR
GYS	32.3911	105.7017	Guangyuan
GYY	41.6163	-87.4128	GARY/CHICAGO INTL
GZA	31.2464	34.2761	GAZA INTL
GZO	-8.0970	156.8630	Gizo
GZP	36.2992	32.3006	Gazipasa
GZT	36.9489	37.4792	Gaziantep
HAA	70.4867	22.1397	Hasvik
HAC	33.1150	139.7856	Hachijojima
HAD	56.6908	12.8200	Halmstad
HAE	36.1916	-113.0924	  Supai Village
HAH	-11.5365	43.2713	Moroni Prince Said Ibrahim
HAJ	52.4602	9.6835	Hannover
HAK	19.9333	110.4567	Haikou
HAM	53.6303	9.9883	Hamburg Airport
HAN	21.2217	105.8056	Hanoi
HAQ	6.7464	73.1686	Hanimaadhoo Island
HAS	27.4398	41.6863	Hail
HAU	59.3432	5.2125	Haugesund
HAV	22.9892	-82.4092	Havana
HAW	51.8331	-4.9611	HAVERFORDWEST
HBA	-42.8367	147.5100	Hobart
HBE	30.9181	29.6958	Alexandria Borg el Arab
HBR	34.9914	-99.0514	HOBART
HBU	48.8556	103.4722	Bulgan (Khovd)
HBX	15.3617	75.0849	Hubli
HCN	22.0411	120.7302	Hengchun
HCQ	-18.2333	127.6700	HALLS CREEK
HCR	62.1883	-159.7749	Holy Cross
HDB	49.3933	8.6517	HEIDELBERG AAF
HDD	25.3000	68.3833	HYDERABAD
HDF	53.8787	14.1523	Heringsdorf
HDG	36.6000	114.4600	Handan
HDM	34.8694	48.5506	Hamadan
HDN	40.5203	-107.3047	Hayden
HDO	29.3594	-99.1767	HONDO MUNI
HDS	-24.3546	31.0504	Hoedspruit
HDY	6.9328	100.3950	Hat Yai
HEA	34.2161	62.2264	Herat
HEH	20.7433	96.7930	Heho
HEI	54.1550	8.9033	  Heide-B�sum
HEK	50.2500	127.3000	Heihe
HEL	60.3172	24.9633	Helsinki-Vantaa
HEM	60.2539	25.0442	HELSINKI/MALMI
HEN	60.1478	24.9242	Helsinki Heliport
HER	35.3397	25.1803	Irakleion
HET	40.8517	111.8250	Hohhot
HEW	37.8958	23.7278	ATHENS/CENTRAL
HEZ	31.6133	-91.2967	HARDY-ANDERS FLD/NATCHEZ-ADAMS
HFA	32.8094	35.0431	Haifa
HFD	41.7367	-72.6333	HARTFORD BRAINARD
HFE	31.7833	117.3000	Hefei
HFN	64.2956	-15.2272	HOFN/HORNAFFJOROUR
HFS	60.0211	13.5789	Hagfors
HFT	70.6797	23.6686	Hammerfest
HGA	9.4878	44.0875	Hargeisa
HGD	-20.8164	144.2242	HUGHENDEN
HGH	30.2283	120.4317	Hangzhou
HGL	54.1853	7.9158	HELGOLAND-DUENE
HGN	19.3017	97.9750	Mae Hong Son
HGR	39.7085	-77.7265	Hagerstown
HGU	-5.8333	144.3000	Mount Hagen
HHA	28.1892	113.2196	  Changsha
HHE	40.5522	141.4672	HACHINOHE
HHH	32.2244	-80.6975	Hilton Head Island
HHN	49.9487	7.2639	Frankfurt Hahn Airport
HHP	22.2500	114.1833	H K Heliport
HHQ	12.6303	99.9533	Hua Hin
HHR	33.9233	-118.3350	NORTHROP/HAWTHORNE MUNICIPAL
HHZ	-17.5447	-142.6144	Hikueru
HIA	33.5300	119.2300	Huai'an
HIB	47.3867	-92.8389	Hibbing/Chisholm
HID	-10.5881	142.2889	Horn Island
HIF	41.1239	-111.9730	OGDEN/HILL AFB
HIJ	34.4360	132.9194	Hiroshima
HIK	21.3187	-157.9224	HICKAM
HIL	6.0775	44.7639	  Shilabo
HIN	35.0914	128.0761	Jinju
HIO	45.5404	-122.9498	PORTLAND/HILLSBORO
HIR	-9.4183	160.0533	Honiara
HIS	-20.0600	148.8814	  Hayman Island
HIW	34.3668	132.4139	HIROSHIMANISHI
HIX	-9.7722	-139.0147	HIVA-HOA
HJJ	27.1100	109.0400	Huaihua
HJR	24.8194	79.9200	Khajuraho
HKB	63.8676	-148.9688	Healy Lake
HKD	41.7700	140.8219	Hakodate
HKG	22.3089	113.9146	Hong Kong International Apt
HKK	-42.7136	170.9853	Hokitika
HKN	-5.4622	150.4049	Hoskins
HKT	8.1125	98.3093	Phuket
HKY	35.7411	-81.3894	HICKORY REGIONAL
HLA	-25.9333	27.9222	Johannesburg Lanseria International Apt
HLC	39.3789	-99.8314	HILL CITY MUNI
HLD	49.2050	119.8250	Hailar
HLF	57.5258	15.8233	HULTSFRED-VIMMERBY
HLG	40.1750	-80.6464	WHEELING OHIO CO
HLH	46.0830	122.0170	Ulanhot
HLN	46.6067	-111.9827	Helena
HLP	-6.2675	106.8864	JAKARTA HALIM INTL
HLT	-37.6450	142.0583	HAMILTON
HLU	-21.2564	165.6175	HOUAILOU-NESSON
HLZ	-37.8664	175.3353	Hamilton
HMA	61.0283	69.0867	Khanty-Mansiysk
HMB	22.5806	28.7207	Sohag
HME	31.6739	6.1406	Hassi Messaoud
HMI	42.8414	93.6692	Hami
HMJ	49.3597	26.9334	  Khmelnitskiy
HMN	32.8517	-106.1017	HOLLOMAN AFB
HMO	29.0958	-111.0479	Hermosillo
HMV	65.8061	15.0828	Hemavan/Tarnaby
HNA	39.4286	141.1353	Hanamaki
HND	35.5533	139.7812	Tokyo Intl (Haneda)
HNH	58.0961	-135.4097	Hoonah
HNL	21.3187	-157.9224	Honolulu International Apt
HNM	20.7956	-156.0144	Hana
HNS	59.2438	-135.5235	Haines
HOB	32.6875	-103.2169	Hobbs Lea County Apt
HOD	14.7514	42.9761	Hodeidah
HOE	20.5000	103.7500	Houeisay
HOF	25.2854	49.4853	Hofuf
HOG	20.7856	-76.3150	Holguin
HOH	47.3853	9.7006	HOHENEMS/DORNBIRN
HOI	-18.0644	-140.9569	Hao
HOM	59.6456	-151.4766	Homer
HON	44.3852	-98.2285	Huron
HOP	36.6686	-87.4961	CAMPBELL AAF (FT CAMPBELL)
HOQ	50.2888	11.8549	HOF-PLAUEN
HOR	38.5200	-28.7164	Horta
HOT	34.4781	-93.0961	Hot Springs
HOU	29.6454	-95.2789	Houston Hobby Apt
HOV	62.1800	6.0743	Orsta/Volda
HPA	-19.7781	-174.3467	HA APAI
HPB	61.5239	-166.1466	Hooper Bay
HPH	20.8207	106.7245	Haiphong
HPN	41.0670	-73.7076	Westchester County
HQM	46.9712	-123.9365	HOQUIAM/BOWERMAN
HRB	45.6167	126.2500	Harbin
HRE	-17.9328	31.0939	Harare
HRG	27.1786	33.8008	Hurghada
HRI	6.2845	81.1241	Hambantota
HRK	49.9250	36.2917	Kharkiv
HRL	26.2285	-97.6544	Harlingen
HRM	32.9327	3.2981	Hassi R'mel
HRO	36.2614	-93.1547	Harrison
HRR	18.4697	-69.9694	HERRERA INTL
HSA	30.3678	-89.4547	BAY ST LOUIS / STENNIS
HSB	37.8113	-88.5503	HARRISBURG-RALEIGH
HSE	35.2328	-75.6178	HATTERAS BILLY MITCHELL
HSG	33.1497	130.3022	Saga
HSI	40.6053	-98.4278	HASTINGS MUNI
HSK	42.0809	-0.3235	  Huesca
HSL	65.6979	-156.3514	Huslia
HSM	-36.6711	142.1733	HORSHAM
HSN	29.9342	122.3622	Zhoushan
HST	25.4886	-80.3833	HOMESTEAD
HSV	34.6372	-86.7751	Huntsville International Airport
HSZ	24.8167	120.9333	HSINCHU
HTA	52.0267	113.3050	Chita
HTG	71.9783	102.4933	KHATANGA
HTI	-20.3583	148.9517	Hamilton Island
HTL	44.3597	-84.6711	HOUGHTON LAKE ROSCOMMON CO
HTM	50.4519	100.1670	Khatgal
HTN	37.0333	79.8667	Hotan
HTS	38.3667	-82.5580	Huntington
HTY	36.5736	36.1539	Hatay
HUA	34.6787	-86.6848	REDSTONE AAF(REDSTONE ARSENAL)
HUE	14.2500	36.5830	  Humera
HUF	39.4633	-87.3125	TERRE HAUTE INTL-HULMAN FLD
HUH	-16.6881	-151.0261	Huahine
HUI	16.3992	107.7064	Hue
HUL	46.1233	-67.7917	HOULTON
HUN	24.0233	121.6100	Hualien
HUQ	29.1101	15.9656	  Houn
HUS	66.0391	-154.2647	Hughes
HUT	38.0654	-97.8606	HUTCHINSON MUNI-BUTLER FLD ARP
HUU	-9.9000	-76.2167	Huanuco
HUV	61.7683	17.0806	HUDIKSVAL
HUW	-7.5336	-63.0505	Coari/Aeroporto de Humaita
HUX	15.7753	-96.2626	Huatulco
HUY	53.5744	-0.3508	Humberside
HVA	-14.6297	47.7638	  Analalava
HVB	-25.3250	152.8900	Hervey Bay
HVD	47.9541	91.6282	Khovd
HVG	71.0097	25.9836	Honningsvag
HVN	41.2638	-72.8868	New Haven
HVR	48.5431	-109.7622	Havre
HWD	37.6589	-122.1217	HAYWARD EXECUTIVE
HWN	-18.6339	27.0081	HWANGE NATIONAL PARK
HXX	-34.5317	144.8300	HAY
HYA	41.6694	-70.2803	Hyannis
HYD	17.4534	78.4624	Hyderabad Rajiv Gandhi Intl Arpt
HYG	55.2063	-132.8283	Hydaburg
HYL	55.4816	-132.6461	Hollis
HYN	28.5622	121.4286	Taizhou
HYS	38.8422	-99.2732	HAYS REGIONAL
HZB	50.6167	2.6400	MERVILLE/CALONNE
HZD	51.7678	13.1677	HOLZDORF
HZG	33.0636	107.0081	  Hanzhong
HZH	26.3350	109.1500	Liping
HZK	65.9525	-17.4258	HUSAVIK
IAA	67.4417	86.6233	Igarka
IAB	37.6229	-97.2733	MC CONNELL AFB
IAD	38.9445	-77.4558	Washington Dulles International Apt
IAG	43.1073	-78.9462	Niagara Falls
IAH	29.9844	-95.3414	Houston George Bush Intercontinental Ap
IAM	28.0514	9.6428	In Amenas
IAN	66.9760	-160.4365	Kiana
IAO	9.8591	126.0140	Siargao
IAR	57.5600	40.1567	Yaroslavl
IAS	47.1788	27.6200	Iasi
IBA	7.3608	3.9781	Ibadan
IBE	4.4214	-75.1325	Ibague
IBL	-21.7058	35.4514	Indigo Bay Lodge
IBR	36.1817	140.4147	Ibaraki
IBZ	38.8729	1.3731	Ibiza
ICA	4.3333	-61.7333	ICABARU
ICI	-17.7433	-179.3422	Cicia Island
ICK	5.9628	-57.0333	NIEUW NICKERIE/MAJ. FERNANDES
ICN	37.4625	126.4392	Seoul Incheon International Airport
ICR	20.6833	-75.5333	NICARO
ICT	37.6499	-97.4331	Wichita Mid-Continent Apt
IDA	43.5145	-112.0702	Idaho Falls
IDB	61.8697	12.6894	IDRE
IDO	-11.5731	-50.6678	CRISTALANDIA/STA ISABEL DO MOR
IDR	22.7228	75.8064	Indore
IEG	52.1385	15.7986	ZIELONA GORA/BABIMOST
IEJ	26.7226	127.7866	IEJIMA
IEV	50.4017	30.4517	Kiev Zhuliany Intl Apt
IFJ	66.0581	-23.1353	Isafjordur
IFL	-17.5611	146.0106	INNISFAIL
IFN	32.7508	51.8628	Esfahan
IFO	48.8850	24.6867	Ivano-Frankivsk
IFP	35.1611	-114.5595	LAUGHLIN BULLHEAD INTL
IGA	20.9750	-73.6669	Inagua
IGD	39.9744	43.8800	Igdir
IGG	59.3240	-155.9018	Igiugig
IGH	-18.6656	146.1475	INGHAM
IGL	38.5119	27.0108	IZMIR/CIGLI
IGM	35.2594	-113.9381	Kingman
IGN	8.1500	124.2083	ILIGAN
IGQ	41.5349	-87.5295	LANSING MUNI CHICAGO
IGR	-25.7372	-54.4733	Iguazu
IGS	48.7157	11.5340	INGOLSTADT MANCHING
IGU	-25.6003	-54.4850	Foz do Iguacu
IHR	27.2360	60.7196	Iran Shahr
IIA	53.0919	-9.5700	INISHMAAN
IIL	33.5867	46.4047	Ilam
IIS	-4.4997	154.2261	  Nissan Island
IJK	56.8333	53.4567	Izhevsk
IJX	39.7744	-90.2386	JACKSONVILLE MUNI
IKA	35.4161	51.1522	Tehran Imam Khomeini International Apt
IKE	70.4956	-51.3031	Ikerasak
IKI	33.7491	129.7858	Iki
IKK	41.0714	-87.8464	KANKAKEE GREATER KANKAKEE
IKO	52.9416	-168.8490	Nikolski
IKS	71.6950	128.9000	Tiksi
IKT	52.2667	104.3950	Irkutsk
IKV	41.6913	-93.5663	ANKENY REGL
ILA	13.6970	-89.1166	ILOPANGO INTL
ILB	-20.4228	-51.3311	PEREIRA BARRETO/ILHA SOLTEIRA
ILD	41.7278	0.5358	Lleida
ILF	56.0614	-95.6139	ILFORD
ILG	39.6787	-75.6065	Wilmington Greater Wilmington Apt
ILI	59.7544	-154.9110	Iliamna
ILM	34.2706	-77.9025	Wilmington
ILN	39.4279	-83.7921	WILMINGTON AIRBORNE PARK
ILO	10.7300	122.5449	Ilo-Ilo
ILP	-22.5889	167.4558	Ile des Pins
ILQ	-17.6908	-71.3408	ILO
ILR	8.4400	4.4939	Ilorin
ILY	55.6819	-6.2567	Islay
ILZ	49.2333	18.6136	ZILINA
IMF	24.7636	93.9031	Imphal
IMK	29.9711	81.8189	  Simikot
IML	40.5105	-101.6201	IMPERIAL MUNI
IMO	5.4247	7.2094	OWERRI
IMP	-5.5303	-47.4578	Imperatriz
IMT	45.8184	-88.1145	Iron Mountain
INB	16.5170	-88.4330	Independence
INC	38.4819	106.0092	Yinchuan
IND	39.7173	-86.2944	Indianapolis
INE	30.3833	-9.5500	AGADIR/INEZGANE
INF	19.5689	5.7489	IN GUEZZAM
INH	-23.8667	35.4167	Inhambane
INI	43.3373	21.8537	NIS
INK	31.7797	-103.2014	WINKLER CO
INL	48.5662	-93.4031	International Falls
INN	47.2603	11.3439	Innsbruck
INT	36.1336	-80.2219	WINSTON SALEM SMITH REYNOLDS
INU	-0.5467	166.9167	Nauru Island
INV	57.5425	-4.0475	Inverness
INW	35.0218	-110.7225	WINSLOW
INZ	27.2536	2.5100	In Salah
IOA	39.6983	20.8225	Ioannina
IOM	54.0833	-4.6239	Isle Of Man
ION	1.5894	18.0467	  Impfondo
IOQ	65.5300	-38.9800	Isortoq
IOS	-14.8150	-39.0333	Ilheus
IOT	71.2417	-53.5667	Illorsuit
IPA	-18.8783	169.3081	Ipota
IPC	-27.1647	-109.4219	Easter Island
IPG	-2.9333	-69.6942	SANTO ANTONIO DO ICA
IPH	4.5692	101.0931	Ipoh
IPI	0.8619	-77.6717	Ipiales
IPJ	35.4833	-81.1613	LINCOLTON CO REGIONAL
IPL	32.8342	-115.5787	Imperial County Apt
IPN	-19.4706	-42.4878	Ipatinga
IPT	41.2418	-76.9211	Williamsport
IPU	-14.1333	-39.7333	IPIAU
IQA	33.7856	42.4412	AL ASAD AB
IQM	38.1494	85.5328	  Qiemo
IQN	35.7997	107.6028	Qingyang
IQQ	-20.5353	-70.1814	Iquique
IQT	-3.7847	-73.3088	Iquitos
IRA	-10.4490	161.8970	Kirakira
IRC	65.8279	-144.0762	Circle
IRD	24.1526	89.0494	Ishurdi
IRE	-11.3394	-41.8522	IRECE
IRG	-12.7883	143.3047	Lockhart River
IRI	-7.6686	35.7521	Iringa
IRJ	-29.3892	-66.8025	La Rioja
IRK	40.0930	-92.5440	Kirksville
IRM	63.2000	64.4333	IGRIM
IRN	36.6633	51.4647	NOSHAHR
IRO	10.2333	22.7167	BIRAO
IRP	2.8276	27.5883	Isiro
IRZ	-0.3803	-64.9960	Santa Isabel Rio Negro
ISA	-20.6633	139.4883	Mount Isa
ISB	33.6172	73.1000	Islamabad
ISC	49.9133	-6.2917	Isles of Scilly St Mary's Apt
ISE	37.8650	30.3819	Isparta
ISG	24.3434	124.1850	New Ishigaki
ISI	-24.2583	144.4250	ISISFORD
ISK	19.9637	73.8076	  Nasik
ISM	28.2898	-81.4370	KISSIMMEE GATEWAY A/P ORLANDO
ISN	48.1783	-103.6417	Williston
ISO	35.3314	-77.6088	KINGSTON RGNL JETPORT
ISP	40.7953	-73.1002	Long Island MacArthur
IST	40.9761	28.8139	Istanbul Ataturk Airport
ISU	35.5609	45.3147	Sulaymaniyah
ITA	-3.1261	-58.4811	ITACOATIARA
ITB	-4.2419	-56.0003	Itaituba
ITH	42.4911	-76.4586	Ithaca
ITK	-9.2000	148.2500	  Itokama
ITM	34.7844	135.4391	Osaka Intl (Itami)
ITN	-14.8097	-39.2914	ITABUNA
ITO	19.7203	-155.0485	Hilo
ITR	-18.4444	-49.2136	ITUMBIARA/HIDROELECTRICA
IUE	-19.0800	-169.9250	Niue
IUI	73.1997	-56.0472	Innarsuit
IVC	-46.4150	168.3200	Invercargill
IVL	68.6108	27.4139	Ivalo
IVR	-29.8894	151.1469	INVERELL
IWA	56.9394	40.9408	Ivanovo
IWD	46.5275	-90.1314	  Ironwood
IWJ	34.6762	131.7906	Masuda
IWK	34.1450	132.2442	Iwakuni
IWO	24.7911	141.3211	IWOJIMA
IXA	23.8770	91.2400	Agartala
IXB	26.6833	88.3333	Bagdogra
IXC	30.6667	76.7833	Chandigarh
IXD	25.4400	81.7367	Allahabad
IXE	12.9619	74.8900	Mangalore
IXG	15.8586	74.6177	Belgaum
IXH	24.3078	92.0094	KAILASHAHAR
IXI	27.2906	94.0969	NORTH LAKHIMPUR/LILABARI
IXJ	32.6891	74.8374	Jammu
IXK	21.3144	70.2694	KESHOD/JUNAGADH
IXL	34.1359	77.5465	Leh
IXM	9.8336	78.0894	Madurai
IXN	24.0617	91.6075	KHOWAI
IXP	32.2338	75.6346	  Pathankot
IXQ	24.1317	91.8142	KAMALPUR
IXR	23.3143	85.3211	Ranchi
IXS	24.9117	92.9800	Silchar
IXT	28.1000	95.3833	PASIGHAT
IXU	19.8636	75.3986	Aurangabad
IXW	22.8167	86.1667	JAMSHEDPUR
IXY	23.1117	70.1014	KANDLA/GANDHIDHAM
IXZ	11.6467	92.7350	Port Blair
IYK	35.6588	-117.8295	  Inyokern
IZA	-21.5131	-43.1731	Juiz De Fora
IZO	35.4137	132.8899	Izumo
JAA	34.3972	70.4950	JALALABAD
JAB	-12.6583	132.8933	JABIRU
JAC	43.6073	-110.7378	Jackson
JAD	-32.0992	115.8792	PERTH/JANDAKOT
JAF	9.7919	80.0750	KANKESANTURAI/JAFFNA
JAG	28.2842	68.4497	JACOBABAD
JAI	26.8239	75.8033	Jaipur
JAL	19.4751	-96.7975	Jalapa
JAN	32.3111	-90.0759	Jackson-Evers International Airport
JAQ	-5.6525	151.5069	  Jacquinot Bay
JAU	-11.7833	-75.4833	Jauja
JAV	69.2432	-51.0571	Ilulissat
JAX	30.4941	-81.6879	Jacksonville International Apt
JBQ	18.5725	-69.9856	Santo Domingo Dr. J Balaguer
JBR	35.8317	-90.6464	Jonesboro
JCA	43.5380	7.0390	  Cannes
JCB	-27.1727	-51.5516	Joacaba
JCH	68.8172	-51.1747	  Qasigiannguit
JCK	-20.6703	141.7208	Julia Creek
JCM	-10.1633	-40.5525	JACOBINA
JCR	-6.2353	-57.7758	JACAREACANGA
JCT	30.5114	-99.7636	JUNCTION KIMBLE CO
JCU	35.8992	-5.3383	Ceuta
JDF	-21.7925	-43.3850	JUIZ DE FORA/FRANCISC DE ASSIS
JDH	26.2667	73.0500	Jodhpur
JDN	47.3287	-106.9527	JORDAN
JDO	-7.2181	-39.2714	Juazeiro Do Norte
JDR	-21.0863	-44.2263	Sao Joao Del Rei
JDZ	29.3386	117.1758	Jingdezhen
JED	21.6811	39.1555	Jeddah
JEG	68.7218	-52.7847	Aasiaat
JEJ	7.5830	168.9170	  Jeh
JEQ	-13.8767	-40.0714	JEQUIE
JER	49.2079	-2.1955	Jersey
JFK	40.6397	-73.7789	New York J F Kennedy International Apt
JFR	61.9922	-49.6625	Paamiut
JGA	22.4667	70.1667	Jamnagar
JGC	35.9670	-112.1330	Grand Canyon H/P
JGD	50.3750	124.1170	Jiagedaqi
JGN	39.8569	98.3414	Jiayuguan
JGO	69.2511	-53.5381	  Qeqertarsuaq
JGS	26.8990	114.7370	Ji'an
JHB	1.6389	103.6692	Johor Bahru
JHG	21.9750	100.7600	Jinghong
JHM	20.9636	-156.6730	Kapalua
JHS	66.9513	-53.7293	Sisimiut
JHW	42.1533	-79.2581	Jamestown
JIA	-11.5000	-58.8833	Juina Airport
JIB	11.5473	43.1593	Djibouti
JIC	31.5000	102.5000	Jinchang
JIJ	9.3330	42.7170	Jijiga
JIK	37.6836	26.3478	Ikaria Island
JIM	7.6710	37.8258	Jimma
JIN	2.8000	32.2667	JINJA
JIQ	29.5252	108.7552	Qianjiang
JIU	29.7330	115.9830	Jiujiang
JJA	-8.1500	159.3000	Jajao
JJI	-7.1667	-76.7283	JUANJUI
JJM	0.0831	37.6497	Meru-Kiina
JJN	24.7964	118.5897	Quanzhou
JJU	60.7158	-46.0294	Qaqortoq
JKG	57.7583	14.0692	Jonkoping
JKH	38.3408	26.1389	Chios
JKL	36.9600	26.9600	Kalymnos Island
JKR	26.7107	85.9245	Janakpur
JLN	37.1519	-94.4983	Joplin
JLR	23.1833	80.0617	Jabalpur
JLS	-20.2589	-50.5486	JALES
JMK	37.4373	25.3473	Mykonos
JMO	28.7822	83.7225	  Jomsom
JMS	46.9297	-98.6782	JAMESTOWN REGIONAL
JMU	46.8400	130.4617	Jiamusi
JNA	-15.4742	-44.3858	JANUARIA
JNB	-26.1337	28.2423	Johannesburg O.R. Tambo International
JNG	35.2928	116.3464	Jining
JNN	60.1400	-45.2317	Nanortalik
JNS	60.9167	-46.0586	Narsaq
JNU	58.3550	-134.5763	Juneau
JNX	37.0800	25.3680	Naxos Is
JNZ	41.1014	121.0617	Jinzhou
JOE	62.6589	29.6244	Joensuu
JOG	-7.7833	110.4333	Yogyakarta
JOI	-26.2231	-48.7975	Joinville
JOK	56.7006	47.9047	Yoshkar-Ola
JOL	6.0542	121.0083	Jolo
JOM	-9.3500	34.8000	Njombe
JOS	9.6397	8.8692	Jos
JOT	41.5178	-88.1756	JOLIET REGIONAL
JPA	-7.1189	-34.9508	Joao Pessoa
JPR	-10.8703	-61.8461	Ji-Parana
JQA	70.7342	-52.6962	Qaarsut
JQE	7.5178	-78.1572	Jaque
JQF	35.3878	-80.7091	CONCORD REGIONAL
JRB	40.7012	-74.0090	  New York
JRF	21.3074	-158.0703	KAPOLEI/KALAELOA/JOHN ROGERS
JRH	26.7315	94.1755	  Jorhat
JRO	-3.4294	37.0745	Kilimanjaro
JRS	31.8647	35.2192	JERUSALEM
JSA	26.8887	70.8650	  Jaisalmer
JSH	35.2222	26.1028	Siteia
JSI	39.1783	23.5042	Skiathos
JSR	23.1838	89.1609	Jessore
JST	40.3161	-78.8339	Johnstown
JSU	65.4125	-52.9394	Maniitsoq
JSY	37.4236	24.9500	Syros Island
JTC	-22.1577	-49.0683	Bauru
JTI	-17.8294	-51.7747	JATAI
JTR	36.3992	25.4792	Thira
JTY	36.5799	26.3758	Astypalaia Island
JUA	-11.3333	-57.4666	Juara Airport
JUB	4.8720	31.6011	Juba
JUH	30.7403	117.6867	Chizhou
JUI	53.6811	7.0564	  Juist
JUJ	-24.3928	-65.0978	Jujuy
JUK	71.0553	-51.8833	Ukkusissat
JUL	-15.4669	-70.1578	Juliaca
JUM	29.2742	82.1933	  Jumla
JUU	71.5500	-53.2200	Nuugaatsiaq
JUV	72.7902	-56.1306	Upernavik
JUZ	28.9658	118.8994	Quzhou
JVA	-18.8000	45.2830	  Ankavandra
JVR	53.5337	7.8923	JEVER
JWA	-24.6000	24.6667	JWANENG
JWN	36.7747	48.3592	ZANJAN 2
JXA	45.6580	132.4615	Jixi
JXN	42.2598	-84.4594	JACKSON/REYNOLDS FLD
JYR	27.7500	58.0000	Jiroft
JYV	62.4008	25.6728	Jyvaskyla
JZH	32.8369	103.6819	Jiuzhaigou
KAA	-10.2164	31.1395	Kasama
KAB	-16.5192	28.8856	KARIBA
KAC	37.0306	41.2052	KAMISHLY
KAD	10.6958	7.3203	Kaduna
KAE	56.9614	-133.9103	Kake
KAJ	64.2842	27.6875	Kajaani
KAL	64.3190	-158.7413	Kaltag
KAN	12.0480	8.5237	Kano
KAO	65.9903	29.2319	Kuusamo
KAT	-35.0700	173.2853	Kaitaia
KAU	63.1242	23.0514	KAUHAVA
KAW	10.0518	98.5463	Kawthaung
KAX	-27.6900	114.2617	  Kalbarri
KAZ	1.1853	127.8961	Kau
KBC	66.2740	-145.8240	Birch Creek
KBL	34.5658	69.2125	Kabul
KBP	50.3450	30.8947	Kiev Borispol Intl Apt
KBR	6.1661	102.2925	Kota Bharu
KBT	8.9000	170.8500	XXX
KBU	-3.3333	116.3333	Kotabaru
KBV	8.0989	98.9872	Krabi
KCA	41.7181	82.9869	Kuqa
KCC	56.0148	-132.8339	Coffman Cove
KCF	27.1667	69.3167	Kadanwari
KCG	56.3178	-158.5909	Chignik Fisheries Apt
KCH	1.4847	110.3378	Kuching
KCK	57.7725	108.0589	Kirensk
KCL	56.3112	-158.5359	Chignik Lagoon Apt
KCM	37.5397	36.9536	Kahramanmaras
KCO	40.7350	30.0833	Kocaeli
KCQ	56.3115	-158.3732	Chignik Lake Apt
KCT	5.9939	80.3206	Koggala
KCU	1.7500	31.7500	MASINDI
KCZ	33.5444	133.6713	Kochi
KDC	11.1500	2.9500	KANDI
KDD	27.7926	66.6430	KHUZDAR
KDH	31.5136	65.8611	Kandahar
KDI	-4.0842	122.4131	Kendari
KDL	58.9908	22.8308	Kardla
KDM	0.4883	72.9961	Kaadedhdhoo Island
KDO	1.8583	73.5197	Kadhdhoo Island
KDR	-6.1830	149.5330	  Kandrian
KDU	35.3500	75.5333	Skardu
KDV	-19.0581	178.1569	Kadavu Island
KDZ	7.2000	80.4333	Kandy Polgolla Reservoir SPB
KEB	59.3521	-151.9252	Nanwalek
KED	16.1500	-13.5167	KAEDI
KEF	63.9850	-22.6056	Reykjavik Keflavik International Apt
KEH	47.7548	-122.2593	Kenmore Air Harbor
KEJ	55.2700	86.1083	Kemerovo
KEK	59.3568	-157.4711	Ekwok
KEL	54.3794	10.1451	KIEL-HOLTENAU
KEM	65.7792	24.5847	Kemi/Tornio
KEP	28.1017	81.6662	Nepalganj
KER	30.2744	56.9511	Kerman
KET	21.3034	99.6323	Kengtung
KEV	61.8564	24.7892	HALLI
KEW	52.9922	-92.8389	Keewaywin
KFA	16.5833	-11.4000	KIFFA
KFP	54.8474	-163.4103	False Pass
KFS	41.3056	33.7911	Kastamonu
KGA	-5.9000	22.4692	Kananga
KGC	-35.7158	137.5214	Kingscote
KGD	54.8900	20.5950	Kaliningrad
KGE	-7.3330	157.5830	Kagau Island
KGF	49.6708	73.3344	Karaganda
KGG	12.5667	-12.2167	KEDOUGOU
KGI	-30.7900	121.4617	Kalgoorlie-Boulder
KGJ	-9.9547	33.8958	KARONGA
KGK	59.7266	-157.2595	Koliganek
KGL	-1.9676	30.1335	Kigali
KGP	62.1900	74.5350	Kogalym
KGQ	72.3800	-55.5453	Kangersuatsiaq
KGS	36.7947	27.0911	Kos
KGT	30.0500	102.0330	Kangding
KGW	-9.1000	147.6500	  Kagi
KGX	62.8946	-160.0649	Grayling
KGY	-26.5800	151.8417	KINGAROY
KHC	45.3731	36.4044	KERCH INTL
KHD	33.4386	48.2808	Khorramabad
KHG	39.5433	76.0217	Kashi
KHH	22.5769	120.3503	Kaohsiung
KHI	24.9014	67.1500	Karachi
KHJ	62.4633	22.3911	KAUHAJOKI
KHK	29.2603	50.3239	KHARK ISLAND
KHM	25.9883	95.6744	  Khamti
KHN	28.8650	115.9000	Nanchang
KHQ	74.5794	-57.2353	Kullorsuaq
KHR	47.2467	102.8261	  Kharkhorin
KHS	26.1710	56.2406	Khasab
KHV	48.5267	135.1867	Khabarovsk
KHY	38.4275	44.9736	Khoy
KHZ	-15.7667	-145.1167	Kauehi
KIA	-6.3039	155.7228	KIETA
KID	55.9206	14.0853	Kristianstad
KIF	53.0125	-89.8553	Kingfisher Lake
KIH	26.5275	53.9792	Kish Island
KIJ	37.9557	139.1117	Niigata
KIK	35.4695	44.3489	KIRKUK
KIM	-28.8017	24.7636	Kimberley
KIN	17.9357	-76.7875	Norman Manley Intl
KIO	5.6500	169.2000	XXX
KIR	52.1809	-9.5238	Kerry
KIS	-0.0853	34.7300	Kisumu
KIT	36.2917	23.0250	Kythira
KIV	46.9283	28.9333	Chisinau
KIW	-12.9000	28.1500	SOUTHDOWNS KITWE
KIX	34.4273	135.2441	Osaka Kansai International Airport
KJA	56.1717	92.4933	Krasnoyarsk
KJI	47.7000	86.8700	Buerjin City
KJK	50.8172	3.2047	KORTRIJK/WEVELGEM
KKA	64.9395	-161.1543	Koyuk
KKB	58.1909	-152.3705	Kitoi Bay
KKC	16.4644	102.7822	Khon Kaen
KKD	-8.8830	147.7170	  Kokoda
KKE	-35.2628	173.9119	Kerikeri
KKH	59.9608	-162.8812	Kongiganak
KKI	60.9079	-161.4351	Akiachak
KKJ	33.8456	131.0350	Kitakyushu
KKM	14.8746	100.6634	LOP BURI/KHOK KATHIAM
KKN	69.7251	29.8877	Kirkenes
KKQ	65.7195	82.4699	Krasnoselkup
KKR	-15.6667	-146.8833	Kaukura
KKU	58.8112	-158.5588	Ekuk
KKW	-5.0333	18.7833	KIKWIT
KKX	28.3213	129.9281	KIKAI
KLC	14.1500	-16.0500	KAOLACK
KLD	56.8250	35.7583	TVER/MIGALOVO
KLG	61.5363	-160.3413	Kalskag
KLH	16.6653	74.2914	KOLHAPUR
KLL	59.1281	-156.8586	Levelock
KLM	37.3833	55.4520	  Kalaleh
KLN	57.5300	-154.0000	Larsen Bay
KLO	11.6811	122.3758	Kalibo
KLR	56.6856	16.2875	Kalmar
KLU	46.6428	14.3372	Klagenfurt
KLV	50.2031	12.9150	Karlovy Vary
KLW	55.5792	-133.0760	Klawock
KLX	37.0684	22.0253	Kalamata
KLZ	-29.6830	17.0931	KLEINSEE
KMA	-7.9636	145.7714	  Kerema
KMC	27.9009	45.5282	KING KHALED MIL CITY
KME	-2.4531	28.9096	Cyangugu
KMG	25.0000	102.7500	Kunming
KMI	31.8771	131.4484	Miyazaki
KMJ	32.8373	130.8551	Kumamoto
KMN	-8.6267	25.2481	KAMINA
KMO	58.9902	-159.0499	Manokotak
KMP	-26.5389	18.1117	KEETMANSHOOP
KMQ	36.3936	136.4079	Komatsu
KMS	6.7167	-1.5833	Kumasi
KMU	-0.3458	42.4672	Kisimayu
KMV	23.1888	94.0511	  Kalemyo
KMW	57.7986	41.0188	KOSTROMA SOKERINO
KMX	18.3011	42.8009	KHAMIS MUSHAIT/KING KHALED AB
KMY	57.0256	-154.1459	  Moser Bay
KNA	-32.9497	-71.4786	VINA DEL MAR
KND	-2.9192	25.9154	Kindu
KNF	52.6484	0.5504	MARHAM
KNG	-3.6445	133.6956	Utarom
KNH	24.4319	118.3594	Kinmen
KNK	59.4331	-154.8037	Kakhonak
KNQ	-21.0533	164.8378	Kone
KNR	27.8219	52.3522	JAM/JAM
KNS	-39.8775	143.8833	King Island
KNU	26.4403	80.3647	Kanpur
KNW	59.4515	-157.3732	New Stuyahok
KNX	-15.7783	128.7067	Kununurra
KOA	19.7389	-156.0457	Kona
KOC	-20.5464	164.2556	Koumac
KOE	-10.1778	123.6636	Kupang
KOI	58.9578	-2.9050	Kirkwall
KOJ	31.8034	130.7194	Kagoshima
KOK	63.7203	23.1392	Kokkola/Pietarsaari
KOO	-5.3944	26.9900	Kongolo
KOP	14.1006	99.9228	Nakhon Phanom
KOS	10.5797	103.6368	Sihanoukville
KOT	63.0306	-163.5326	Kotlik
KOU	-1.1846	12.4413	  Koulamoutou
KOV	53.3286	69.5956	Kokshetau
KOW	25.8258	114.9119	Ganzhou
KOY	57.1615	-154.2298	  Olga Bay
KOZ	57.9229	-152.5005	Ouzinkie
KPB	56.3519	-133.6226	Point Baker
KPC	65.2537	-166.8585	  Port Clarence
KPN	59.9330	-164.0305	Kipnuk
KPO	35.9883	129.4200	Pohang
KPR	58.4901	-152.5822	Port Williams
KPS	-31.0600	152.7897	KEMPSEY
KPV	55.9067	-159.1608	Perryville
KPY	57.9301	-153.0406	Port Bailey
KQA	54.1325	-165.7853	Akutan
KQT	37.8622	68.8628	Qurghonteppa
KRB	-17.4558	140.8303	  Karumba
KRC	-1.7000	101.2670	  Kerinci
KRF	63.0486	17.7694	Kramfors/Solleftea
KRG	-1.4375	31.1736	Karagwe
KRI	-7.4170	144.2330	  Kikori
KRK	50.0777	19.7848	Krakow
KRL	41.6978	86.1289	Korla
KRN	67.8214	20.3356	Kiruna
KRO	55.4750	65.4167	Kurgan
KRP	56.2975	9.1246	Karup
KRR	45.0350	39.1700	Krasnodar
KRS	58.2039	8.0850	Kristiansand Kjevik Airport
KRT	15.5904	32.5532	Khartoum
KRW	40.0633	53.0072	TURKMENBASHI
KRY	45.6170	84.8830	Karamay
KSA	5.3570	162.9584	Kosrae
KSC	48.6631	21.2411	Kosice
KSD	59.4447	13.3375	Karlstad
KSE	0.1831	30.1014	Kasese
KSF	51.4084	9.3776	Kassel
KSH	34.3469	47.1564	Kermanshah
KSJ	35.4214	26.9100	Kasos Island
KSK	59.3444	14.4947	KARLSKOGA
KSL	15.3875	36.3288	KASSALA
KSM	62.0608	-163.3018	St Marys
KSN	53.2069	63.5503	Kostanay
KSO	40.4463	21.2822	Kastoria
KSQ	38.8000	65.7667	Karshi
KSR	56.2333	-160.2331	Sandy River
KSS	11.5982	-5.7989	SIKASSO-DIGNANGAN
KSU	63.1119	7.8261	Kristiansund
KSY	40.5586	43.0989	Kars
KSZ	61.2358	46.6975	  Kotlas
KTA	-20.7117	116.7733	Karratha
KTB	55.6880	-132.5367	Thorne Bay
KTD	25.9480	131.3216	KITADAITO
KTE	4.5375	103.4267	Kerteh
KTG	-1.8166	109.9635	Ketapang
KTL	0.8972	34.9508	Kitale
KTM	27.6973	85.3579	Kathmandu
KTN	55.3556	-131.7137	Ketchikan International Apt
KTP	17.9886	-76.8238	  Kingston
KTQ	62.1661	30.0756	KITEE
KTR	-14.5217	132.3783	TINDAL
KTS	65.3333	-166.4833	Teller Mission
KTT	67.6986	24.8481	Kittila
KTU	25.1597	75.8489	KOTA
KTW	50.4743	19.0800	Katowice
KUA	3.7753	103.2081	Kuantan
KUD	6.9170	116.8330	Kudat
KUF	53.5017	50.1550	Samara
KUG	-10.2250	142.2183	  Kubin Island
KUH	43.0383	144.1969	Kushiro
KUK	60.8733	-162.5243	Kasigluk
KUL	2.7433	101.6981	Kuala Lumpur International Airport
KUM	30.3856	130.6591	YAKUSHIMA
KUN	54.9639	24.0848	Kaunas
KUO	63.0086	27.7944	Kuopio
KUS	65.5736	-37.1236	Kulusuk Island
KUT	42.1768	42.4827	Kutaisi
KUU	31.8769	77.1554	Kullu
KUV	35.9039	126.6158	Gunsan
KUZ	65.8500	-37.0700	Kuummiut
KVA	40.9139	24.6197	Kavala
KVB	58.4561	13.9728	SKOEVDE
KVC	55.1163	-162.2662	King Cove
KVD	40.7350	46.3183	Ganja
KVG	-2.5812	150.8180	Kavieng
KVK	67.5756	33.5828	Kirovsk/Apatity
KVL	67.7362	-164.5635	Kivalina
KVR	44.2700	135.0200	Kavalerovo
KVX	58.5033	49.3483	Kirov
KWA	8.7201	167.7316	Kwajalein Island
KWE	26.5367	106.8033	Guiyang
KWF	55.2963	-133.2433	Waterfall
KWG	48.0433	33.2100	KRIVYI RIH/LOZOVATKA
KWI	29.2266	47.9689	Kuwait
KWJ	35.1264	126.8089	Gwangju
KWK	59.8367	-163.1403	Kwigillingok
KWL	25.2167	110.0400	Guilin
KWM	-15.4875	141.7483	Kowanyama
KWN	59.7551	-161.8454	Quinhagak
KWP	57.7701	-153.5489	West Point
KWT	60.8000	-161.4500	Kwethluk
KWZ	-10.7667	25.5000	KOLWEZI
KXF	-17.3458	179.4219	  Koro Island
KXK	50.4100	136.9383	KOMSOMOLSK-NA-AMURE HURBA
KXU	-16.1191	-146.3688	Katiu
KYA	37.9822	32.5664	Konya
KYE	34.5861	36.0028	KLEYATE RENE MOUAWAD
KYK	57.5661	-154.4539	Karluk
KYP	19.4255	93.5356	Kyaukpyu
KYS	14.4817	-11.4047	KAYES/DAG-DAG
KYU	64.8758	-157.7304	Koyukuk
KYZ	51.6694	94.4006	Kyzyl
KZB	57.5500	-153.7500	Zachar Bay
KZI	40.2858	21.8417	Kozani
KZN	55.6067	49.2817	Kazan
KZO	44.7061	65.5917	Kyzylorda
KZR	39.1114	30.1300	Kutahya
KZS	36.1278	29.5667	Megisti
LAD	-8.8577	13.2283	Luanda
LAE	-6.5719	146.7326	Lae
LAF	40.4123	-86.9369	LAFAYETTE/PURDUE UNIV
LAH	-0.6330	127.5000	  Labuha
LAI	48.7550	-3.4744	Lannion
LAJ	-27.7828	-50.2806	LAGES
LAK	68.2233	-135.0058	  Aklavik
LAL	27.9889	-82.0186	LAKELAND LINDER REGIONAL
LAM	33.7900	-118.0520	Los Alamos
LAN	42.7783	-84.5867	Lansing
LAO	18.1778	120.5313	Laoag
LAP	24.0727	-110.3625	La Paz
LAQ	32.7942	21.9639	Beida
LAR	41.3119	-105.6750	Laramie
LAS	36.0804	-115.1523	Las Vegas McCarran International Apt
LAU	-2.2524	40.9131	Lamu
LAW	34.5677	-98.4166	Lawton
LAX	33.9425	-118.4081	Los Angeles International Apt
LAZ	-13.2611	-43.4072	BOM JESU DA LAPA
LBA	53.8659	-1.6606	Leeds Bradford
LBB	33.6633	-101.8233	Lubbock Preston Smith International Apt
LBC	53.8054	10.7192	Hamburg Luebeck-Blankensee Airport
LBD	40.2150	69.6967	Khujand
LBE	40.2761	-79.4047	Latrobe
LBF	41.1262	-100.6837	North Platte
LBG	48.9694	2.4414	PARIS/LE BOURGET
LBI	43.9133	2.1167	ALBI/LE SEQUESTRE
LBJ	-8.4867	119.8891	Labuan Bajo
LBL	37.0442	-100.9599	Liberal
LBP	3.1833	115.4500	Long Banga
LBR	-7.2500	-64.7833	LABREA
LBS	-16.4667	179.3399	Labasa
LBU	5.3003	115.2444	Labuan
LBV	0.4584	9.4123	Libreville
LBX	13.8600	120.1050	LUBANG
LCA	34.8789	33.6303	Larnaca
LCC	40.2386	18.1331	GALATINA/LECCE
LCD	-23.1600	29.7017	MAKHADO
LCE	15.7417	-86.8561	La Ceiba
LCG	43.3021	-8.3773	A Coruna
LCH	30.1261	-93.2234	Lake Charles
LCI	43.5736	-71.4189	LACONIA MUNICIPAL
LCJ	51.7219	19.3981	LODZ/LUBLINEK
LCK	39.8138	-82.9278	Columbus Rickenbacker Apt
LCL	22.3350	-83.6433	PINA DEL RIO/LA COLOMA
LCQ	30.1820	-82.5769	LAKE CITY MUNI
LCR	-1.0000	-73.0000	La Chorrera
LCX	25.6758	116.7464	Longyan
LCY	51.5053	0.0544	London City Apt
LDB	-23.3297	-51.1361	Londrina
LDE	43.1856	-0.0028	Lourdes/Tarbes
LDG	64.9000	45.7667	Leshukonskoye
LDH	-31.5386	159.0764	Lord Howe Island
LDK	58.4653	13.1744	LIDKOPING
LDN	27.2531	86.6700	  Lamidanda
LDS	47.7149	128.8143	Yichun
LDU	5.0331	118.3211	Lahad Datu
LDV	48.5303	-4.1517	LANDIVISIAU
LDY	55.0428	-7.1608	Derry
LEA	-22.2350	114.0883	Learmonth
LEB	43.6261	-72.3042	Lebanon
LEC	-12.4822	-41.2769	Lencois
LED	59.8000	30.2650	St Petersburg Pulkovo Apt
LEH	49.5339	0.0881	Le Havre
LEI	36.8439	-2.3701	Almeria
LEJ	51.4240	12.2364	Leipzig/Halle
LEK	11.3261	-12.2868	LABE/TATA
LEN	42.5886	-5.6562	Leon
LEP	-21.4714	-42.7325	LEOPOLDINA
LEQ	50.1028	-5.6706	Land's End
LER	-27.8433	120.7033	LEINSTER
LET	-4.1931	-69.9428	Leticia
LEV	-17.7111	178.7586	  Bureta
LEX	38.0365	-84.6059	Lexington Blue Grass Apt
LEY	52.4603	5.5272	LELYSTAD
LFB	-15.0331	40.6717	Lumbo
LFI	37.0828	-76.3604	LANGLEY AFB
LFK	31.2339	-95.7500	LUFKIN ANGELINA CO
LFM	27.3728	53.1889	Lamerd
LFR	8.2500	-72.2817	La Fria
LFT	30.2052	-91.9876	Lafayette Regional Apt
LFW	6.1658	1.2542	Lome
LGA	40.7773	-73.8727	New York La Guardia Apt
LGB	33.8177	-118.1516	Long Beach Apt
LGC	33.0089	-85.0726	LA GRANGE-CALLAWAY
LGG	50.6364	5.4428	Liege Apt
LGH	-30.5983	138.4250	LEIGH CREEK
LGI	23.1790	-75.0936	Deadmans Cay
LGK	6.3261	99.7247	Langkawi
LGL	3.4210	115.1540	Long Lellang
LGP	13.1675	123.7300	Legaspi
LGQ	0.0922	-76.8694	Lago Agrio
LGR	-47.2436	-72.5847	COCHRANE
LGS	-35.4797	-69.5850	MALARGUE
LGU	41.7878	-111.8528	LOGAN-CACHE
LGW	51.1481	-0.1903	London Gatwick Apt
LHA	48.3693	7.8277	LAHR
LHE	31.5216	74.4046	Lahore
LHG	-29.4567	147.9850	LIGHTNING RIDGE
LHR	51.4775	-0.4614	London Heathrow Apt
LHW	36.0500	103.6830	Lanzhou Zhongchuan Apt
LIC	39.2728	-103.6664	LIMON MUNI
LID	52.1672	4.4183	LEIDEN/VALKENBURG
LIF	-20.7750	167.2397	Lifou
LIG	45.8608	1.1803	Limoges
LIH	21.9760	-159.3390	Kauai Island Lihue Municipal Apt
LIK	9.8167	169.3167	XXX
LIL	50.5633	3.0869	Lille Lesquin Airport
LIM	-12.0219	-77.1143	Lima
LIN	45.4494	9.2783	Milan Linate Apt
LIO	9.9581	-83.0219	LIMON INTL
LIP	-21.6622	-49.7306	LINS
LIR	10.5933	-85.5444	Liberia
LIS	38.7742	-9.1342	Lisbon
LIT	34.7294	-92.2242	Little Rock
LIW	19.6934	97.2158	LOIKAW
LIZ	46.9504	-67.8859	LIMESTONE/LORING AFB
LJA	-3.4631	23.6156	Lodja
LJG	26.6792	100.2458	Lijiang
LJU	46.2245	14.4560	Ljubljana
LKB	-18.1992	-178.8169	Lakeba Island
LKE	47.6290	-122.3387	Seattle Lake Union SPB
LKG	4.2000	34.3500	Lokichogio
LKH	3.3167	114.7833	Long Akah
LKL	70.0667	24.9739	Lakselv
LKN	68.1525	13.6094	Leknes
LKO	26.7617	80.8853	Lucknow
LKY	-3.3763	35.8183	Lake Manyara
LKZ	52.4093	0.5610	LAKENHEATH
LLA	65.5433	22.1236	Lulea
LLB	25.1333	107.9500	Libo
LLF	26.7008	111.9575	Yongzhou
LLI	11.9750	38.9800	Lalibela
LLK	38.7536	48.8511	Lankaran
LLU	60.4644	-45.5778	Alluitsup Paa
LLW	-13.7834	33.7776	Lilongwe
LMA	63.8860	-152.3019	Lake Minchumina
LMC	3.3170	-73.9000	La Macarena
LME	47.9486	0.2017	LE MANS/ARNAGE
LML	8.9167	166.2500	XXX
LMM	25.6861	-109.0812	Los Mochis
LMN	4.8081	115.0103	Limbang
LMO	57.7050	-3.3383	LOSSIEMOUTH
LMP	35.4989	12.6189	Lampedusa
LMS	33.1462	-89.0625	LOUISVILLE-WINSTON COUNTY
LMT	42.1561	-121.7332	Klamath Falls
LMY	-7.0000	141.4830	  Lake Murray
LNB	-16.5842	168.1592	Lamen Bay
LND	42.8152	-108.7298	LANDER
LNE	-15.8650	168.1710	Lonorore
LNJ	23.9000	100.0333	Lincang
LNK	40.8510	-96.7592	Lincoln
LNO	-28.8783	121.3150	LEONORA
LNS	40.1217	-76.2961	Lancaster
LNV	-3.0436	152.6289	Lihir Island
LNY	20.7856	-156.9514	Lanai City
LNZ	48.2353	14.1881	Linz Blue Danube
LOD	-15.3067	167.9672	Longana
LOE	17.4392	101.7219	Loei
LOH	-3.9959	-79.3719	Loja
LOI	-27.1597	-49.5428	LONTRAS/HELMUTH BAUNGARTEM
LOK	3.1220	35.6087	Lodwar
LOL	40.0664	-118.5652	LOVELOCK
LOO	33.7640	2.9273	LAGHOUAT AFB
LOP	-8.7573	116.2767	Praya
LOS	6.5787	3.3227	Lagos
LOT	41.6073	-88.0962	CHICAGO/ROMEOVILLE LEWIS UNI.
LOU	38.2280	-85.6637	LOUISVILLE/BOWMAN FIELD
LOV	26.9557	-101.4701	  Monclova
LOZ	37.0870	-84.0773	LONDON-CORBIN ARPT-MAGEE FLD
LPA	27.9319	-15.3866	Gran Canaria
LPB	-16.5136	-68.1828	La Paz
LPD	-1.3286	-69.5797	La Pedrera
LPG	-34.9672	-57.8947	LA PLATA
LPI	58.4064	15.6797	Linkoping
LPK	52.7033	39.5383	LIPETSK
LPL	53.3336	-2.8497	Liverpool
LPM	-16.4540	167.8230	Lamap
LPP	61.0458	28.1486	Lappeenranta
LPQ	19.9000	102.1500	Luang Prabang
LPS	48.4839	-122.9377	Lopez Island
LPT	18.2722	99.5042	Lampang
LPU	0.5830	115.6000	Long Apung
LPX	56.5175	21.0969	LIEPAYA
LPY	45.0797	3.7633	Le Puy
LQM	-0.1823	-74.7708	Puerto Leguizamo
LQN	34.9875	63.1183	  Qala I Naw
LRA	39.6486	22.4486	LARISSA
LRD	27.5437	-99.4615	Laredo
LRE	-23.4372	144.2772	Longreach
LRF	34.9165	-92.1463	JACKSONVILLE/LITTLE ROCK AFB
LRH	46.1792	-1.1953	La Rochelle
LRK	40.1597	-89.3353	LINCOLN
LRL	9.7775	1.0956	NIAMTOUGOU INTL
LRM	18.4507	-68.9118	La Romana
LRR	27.6731	54.3872	Lar
LRS	37.1847	26.8017	Leros
LRT	47.7606	-3.4400	Lorient
LRU	32.2936	-106.9256	LAS CRUCES INTL
LSA	-8.5000	151.0670	Losuia
LSC	-29.9164	-71.1994	La Serena
LSE	43.8797	-91.2569	La Crosse
LSF	32.3383	-84.9917	LAWSON AAF FORT BENNING
LSH	22.9792	97.7537	LASHIO
LSI	59.8789	-1.2956	Shetland Islands Sumburgh Apt
LSK	60.7167	114.8167	LENSK
LSP	11.7808	-70.1515	Las Piedras
LSQ	-37.3992	-72.4250	LOS ANGELES/MARIA DOLORES
LSS	15.8644	-61.5806	  Les Saintes
LST	-41.5456	147.2142	Launceston
LSV	36.2362	-115.0343	LAS VEGAS/NELLIS AFB
LSW	5.2267	96.9503	Lhok Seumawe
LSY	-28.8300	153.2600	Lismore
LSZ	44.5659	14.3932	LOSINJ
LTA	-23.8167	30.3267	TZANEEN
LTB	-38.2067	146.4700	LATROBE VALLEY
LTD	30.1517	9.7153	Ghadames
LTI	46.3830	96.2170	Altai
LTK	35.4097	35.9461	Latakia
LTN	51.8747	-0.3683	London Luton Apt
LTO	25.9806	-111.3494	Loreto
LTQ	50.5147	1.6275	LE TOUQUET/PARIS PLAGE
LTS	34.6503	-99.2667	ALTUS AFB
LTT	43.2064	6.4825	LA MOLE
LTU	18.4000	76.4500	Latur
LTX	-0.9069	-78.6158	Latacunga
LUA	27.6878	86.7314	  Lukla
LUC	-16.7481	-179.6669	  Laucala Island
LUD	-26.6853	15.2456	Luderitz
LUF	33.5350	-112.3832	GLENDALE/LUKE AFB
LUG	46.0036	8.9103	Lugano
LUH	30.8526	75.9567	Ludhiana
LUK	39.1033	-84.4186	Cincinnati Municipal Apt
LUM	24.4011	98.5317	Mangshi
LUN	-15.3267	28.4558	Lusaka
LUO	-11.7687	19.8971	Luena
LUP	21.2110	-156.9736	  Kalaupapa
LUQ	-33.2772	-66.3522	San Luis
LUR	68.8752	-166.1100	Cape Lisburne
LUV	-5.6616	132.7314	Langgur
LUW	-1.0389	122.7719	Luwuk
LUX	49.6233	6.2044	Luxembourg
LUZ	51.2319	22.6903	Lublin
LVA	48.0322	-0.7428	LAVAL/ENTRAMMES
LVI	-17.8123	25.8200	Livingstone
LVM	45.6994	-110.4483	LIVINGSTON MISSION FLD
LVO	-28.6133	122.4233	LAVERTON
LVP	26.8103	53.3561	LAVAN ISLAND
LVS	35.6542	-105.1422	LAS VEGAS MUNI
LWB	37.8583	-80.3995	Lewisburg
LWD	40.6333	-93.9022	LAMONI MUNI
LWM	42.7175	-71.1281	LAWRENCE MUNI
LWN	40.7505	43.8593	Gyumri
LWO	49.8125	23.9561	Lviv
LWR	53.2261	5.7539	LEEUWARDEN
LWS	46.3745	-117.0154	Lewiston
LWT	47.0493	-109.4667	LEWISTOWN MUNI
LWY	4.8492	115.4081	Lawas
LXA	29.2978	90.9119	Lhasa/Lasa
LXG	21.0500	101.4667	Luang Namtha
LXR	25.6708	32.7064	Luxor
LXS	39.9172	25.2364	Limnos
LXU	-14.3667	23.2583	LUKULU
LXV	39.2203	-106.3167	LEADVILLE LAKE CO
LYA	34.7411	112.3883	Luoyang
LYB	19.6670	-80.0830	Little Cayman
LYC	64.5475	18.7178	Lycksele
LYE	51.5052	-1.9934	LYNEHAM
LYG	34.5500	119.2500	Lianyungang
LYH	37.3269	-79.2004	Lynchburg
LYI	35.0461	118.4117	Linyi
LYN	45.7294	4.9389	LYON/BRON
LYP	31.3653	72.9955	Faisalabad
LYR	78.2461	15.4656	Longyearbyen
LYS	45.7256	5.0811	Lyon St-Exupery Apt
LYX	50.9561	0.9392	LYDD
LZC	18.0017	-102.2205	Lazaro Cardenas
LZH	24.2075	109.3911	Liuzhou
LZN	26.1598	119.9585	Nangan
LZO	28.8830	105.3500	Luzhou
LZU	34.0808	-84.0738	Lawrenceville
LZY	29.6200	94.3900	Nyingchi/Linzhi
MAA	12.9947	80.1755	Chennai
MAB	-5.3675	-49.1378	Maraba
MAD	40.4722	-3.5609	Madrid Barajas Apt
MAF	31.9425	-102.2020	Midland Odessa Regional Apt
MAG	-5.2092	145.7875	Madang
MAH	39.8626	4.2186	Menorca
MAJ	7.0650	171.2720	Majuro
MAK	9.5590	31.6522	MALAKAL
MAM	25.7706	-97.5250	Matamoros
MAN	53.3537	-2.2750	Manchester
MAO	-3.0411	-60.0506	Manaus
MAQ	16.6997	98.5436	Mae Sot
MAR	10.5667	-71.7333	Maracaibo
MAS	-2.0619	147.4242	Manus Island
MAT	-5.8000	13.4330	  Matadi
MAU	-16.4264	-152.2433	Maupiti Island
MAV	8.7500	171.1000	XXX
MAZ	18.2557	-67.1485	Mayaguez
MBA	-4.0288	39.5978	Mombasa
MBD	-25.8074	25.5445	MAFIKENG
MBE	44.3039	143.4040	Monbetsu
MBG	45.5464	-100.4081	MOBRIDGE MUNI
MBH	-25.5133	152.7150	MARYBOROUGH
MBI	-8.9151	33.4567	Mbeya
MBJ	18.5037	-77.9134	Montego Bay
MBL	44.2724	-86.2469	Manistee
MBO	13.2050	120.6072	MAMBURAO
MBS	43.5331	-84.0797	Saginaw
MBT	12.3653	123.6181	Masbate
MBU	-9.7475	159.8394	  Mbambanakira
MBW	-37.9772	145.1011	MELBOURNE/MOORABBIN
MBX	46.4799	15.6861	MARIBOR INTL
MBZ	-3.3567	-57.7117	MAUES
MCA	8.4844	-9.5368	MACENTA
MCB	31.1786	-90.4719	MCCOMB/PIKE CO/JOHN E LEWIS
MCE	37.2847	-120.5139	Merced Macready Regional Apt
MCF	27.8493	-82.5212	MAC DILL AFB
MCG	62.9528	-155.6058	McGrath
MCH	-3.2681	-79.9619	MACHALA/GENERAL M. SERRANO
MCI	39.2976	-94.7139	Kansas City International Apt
MCK	40.2063	-100.5921	McCook
MCM	43.7256	7.4203	Monaco
MCN	32.6929	-83.6492	Macon Lewis B Wilson Apt
MCO	28.4294	-81.3090	Orlando International Apt
MCP	0.0508	-51.0703	Macapa
MCS	-30.2700	-57.6400	MONTE CASEROS
MCT	23.5928	58.2817	Muscat
MCV	-16.4433	136.0783	Mcarthur River Mine
MCW	43.1578	-93.3314	MASON CITY MUNI
MCX	42.8150	47.6533	Makhachkala
MCY	-26.6028	153.0917	Sunshine Coast
MCZ	-9.5172	-35.7836	Maceio
MDC	1.5458	124.9250	Manado
MDE	6.1644	-75.4231	Medellin Jose Maria Cordova Intl
MDG	44.5278	129.5667	Mudanjiang
MDK	0.0225	18.2888	Mbandaka
MDL	21.7018	95.9736	Mandalay
MDQ	-37.9342	-57.5733	Mar del Plata
MDS	21.8330	-71.8170	  Middle Caicos
MDT	40.1935	-76.7633	Harrisburg International Apt
MDU	-6.1477	143.6572	Mendi
MDW	41.7860	-87.7524	Chicago Midway Apt
MDX	-29.2261	-53.0844	MERCEDES
MDY	28.2035	-177.3821	MIDWAY HENDERSON FIELD
MDZ	-32.8317	-68.7928	Mendoza
MEA	-22.3408	-41.7633	Macae
MEB	-37.7297	144.9006	Melbourne Essendon Apt
MEC	-0.9461	-80.6789	Manta
MED	24.5524	39.7056	Madinah
MEE	-21.4817	168.0378	Mare
MEG	-9.5167	16.3167	Malange
MEH	71.0297	27.8267	Mehamn
MEI	32.3326	-88.7518	Meridian
MEL	-37.6733	144.8433	Melbourne Airport
MEM	35.0435	-89.9767	Memphis International Apt
MEN	44.5042	3.5275	MENDE/BRENOUX
MEP	2.3833	103.8667	MERSING
MEQ	4.2500	96.2170	Cut Nyak Dien
MES	3.5592	98.6711	Medan
MEU	-0.8894	-52.6017	ALMEIRIM/MONTE DOURADO
MEX	19.4363	-99.0722	Mexico City Juarez Intl
MEY	27.5830	84.2330	  Meghauli
MFD	40.8217	-82.5167	MANSFIELD LAHM REGIONAL
MFE	26.1758	-98.2386	McAllen
MFF	-13.3333	13.2667	MOANDA
MFJ	-18.5667	179.9511	  Moala
MFK	26.2243	120.0028	MATSU/BEIGAN
MFM	22.1494	113.5914	Macau
MFQ	13.5000	7.1333	MARADI
MFR	42.3742	-122.8734	Medford
MFU	-13.2667	31.9333	Mfuwe
MGA	12.1406	-86.1711	Managua
MGB	-37.7450	140.7850	Mount Gambier
MGE	33.9150	-84.5167	DOBBINS AFB
MGF	-23.4794	-52.0122	Maringa
MGH	-30.8500	30.3500	Margate
MGL	51.2304	6.5045	MOENCHENGLADBACH
MGM	32.3006	-86.3939	Montgomery Dannelly Field
MGN	9.2847	-74.8461	MAGANGUE/BARACOA
MGQ	2.0133	45.3050	Mogadishu
MGS	-21.8956	-157.9053	Mangaia Island
MGT	-12.0944	134.8936	Milingimbi Island
MGW	39.6431	-79.9164	Morgantown
MGZ	12.4475	98.6258	Myeik
MHC	-12.1170	-73.7500	Castro
MHD	36.2342	59.6450	Mashhad
MHG	49.4727	8.5143	Mannheim
MHH	26.5114	-77.0835	Marsh Harbour
MHK	39.1412	-96.6708	Manhattan
MHP	53.8642	27.5414	MINSK-1
MHQ	60.1219	19.8964	Mariehamn
MHR	38.5539	-121.2976	SACRAMENTO MATHER
MHT	42.9326	-71.4357	Manchester
MHU	-37.0483	147.3350	MT HOTHAM AIRPORT
MHV	35.0594	-118.1519	MOJAVE/KERN COUNTY
MHZ	52.3619	0.4864	MILDENHALL
MIA	25.7933	-80.2906	Miami International Apt
MIB	48.4150	-101.3567	MINOT AFB
MID	20.9370	-89.6577	Merida
MIG	31.4281	104.7411	Mianyang
MII	-22.1950	-49.9264	Marilia
MIJ	6.0833	171.7500	XXX
MIK	61.6864	27.2000	MIKKELI
MIL	45.5406	9.2022	MILANO/BRESSO
MIM	-36.9106	149.9017	Merimbula
MIP	30.7761	34.6667	RAMON AFB
MIR	35.7581	10.7547	Monastir
MIS	-10.6929	152.8404	Misima Island
MIU	11.8817	13.1417	Maiduguri
MIV	39.3678	-75.0722	MILLVILLE MUNI
MJA	-21.4170	44.3170	  Manja
MJB	10.2833	170.8833	XXX
MJD	27.3352	68.1431	Mohenjodaro
MJE	7.8333	168.1667	XXX
MJF	65.7836	13.2153	Mosjoen
MJI	32.8944	13.2778	TRIPOLI/MITIGA
MJK	-25.8939	113.5772	  Monkey Mia
MJL	-1.8500	11.0667	MOUILLA
MJM	-6.1167	23.5667	Mbuji-Mayi
MJN	-15.6666	46.3511	Mahajanga
MJP	-34.2650	116.1400	MANJIMUP
MJT	39.0578	26.5986	Mytilini
MJU	-2.6830	118.9000	Mamuju
MJV	37.7750	-0.8124	Murcia
MJZ	62.5333	114.0333	Mirny
MKC	39.1232	-94.5927	KANSAS CITY CH.B.WHEELER DOWNT
MKE	42.9472	-87.8966	Milwaukee General Mitchell Intl Apt
MKG	43.1695	-86.2382	Muskegon
MKJ	-0.0192	15.5819	MAKOUA
MKK	21.1529	-157.0963	Hoolehua
MKL	35.5998	-88.9156	Jackson
MKM	2.9064	112.0800	Mukah
MKP	-16.5833	-143.6500	Makemo
MKQ	-8.5211	140.4169	Merauke
MKR	-26.6131	118.5464	MEEKATHARRA
MKU	0.5833	12.9167	MAKOKOU
MKW	-0.8936	134.0503	Manokwari
MKY	-21.1717	149.1800	Mackay
MKZ	2.2631	102.2525	MALACCA
MLA	35.8575	14.4775	Malta
MLB	28.1027	-80.6295	Melbourne
MLC	34.8822	-95.7833	MC ALESTER REGIONAL
MLD	42.1667	-112.2967	MALAD CITY
MLE	4.1917	73.5292	Male
MLF	38.4266	-113.0125	MILFORD MUNI/B&J BRISCOE FIELD
MLG	-7.9266	112.7145	Malang
MLH	47.6100	7.5292	Mulhouse
MLI	41.4485	-90.5075	Moline
MLL	61.8833	-162.0667	Marshall
MLM	19.8499	-101.0254	Morelia
MLN	35.2798	-2.9563	Melilla
MLO	36.6961	24.4775	Milos
MLP	7.6186	124.0544	MALABANG
MLS	46.4281	-105.8856	MILES CITY/FRANK WILEY
MLT	45.6483	-68.6850	MILLINOCKET MUNI
MLU	32.5117	-92.0383	Monroe
MLW	6.2843	-10.7668	Monrovia Spriggs Payne Apt
MLX	38.4322	38.0831	Malatya
MLY	64.9976	-150.6441	Manley Hot Springs
MLZ	-32.3425	-54.2219	MELO
MMB	43.8806	144.1641	Memambetsu
MMD	25.8500	131.2583	MINAMI DAITO
MME	54.5092	-1.4294	Durham
MMG	-28.1167	117.8431	MOUNT MAGNET
MMH	37.6240	-118.8378	Mammoth Lakes
MMJ	36.1668	137.9227	Matsumoto
MMK	68.7817	32.7467	Murmansk
MMM	-22.8025	148.7047	MIDDLEMOUNT
MMO	15.1558	-23.2136	Maio Island
MMT	33.9208	-80.8011	MC ENTIRE AIR NATIONAL GUARD
MMU	40.7992	-74.4150	Morristown
MMV	-9.0802	147.6028	Milei
MMX	55.5483	13.3533	Malmo Airport
MMY	24.7833	125.2944	Miyako
MMZ	35.9386	64.7692	Maimanah
MNA	4.0069	126.6731	Melangguane
MNB	-5.9309	12.3518	  Moanda
MNF	-17.6731	177.0983	  Mana Island
MNG	-12.0600	134.2333	Maningrida
MNH	8.0500	80.9711	MINNERIYA
MNI	16.7914	-62.1933	  Gerald's Park
MNJ	-21.2018	48.3583	  Mananjary
MNL	14.5099	121.0139	Manila Ninoy Aquino International Apt
MNQ	-24.8917	151.1083	MONTO
MNR	-15.2250	23.1528	MONGU
MNS	-11.1333	28.8667	Mansa
MNT	65.1437	-149.3700	Minto
MNU	16.4405	97.6572	MAWLAMYINE
MNX	-5.8167	-61.2833	MANICORE
MNY	-7.3500	155.5000	XXX
MOA	20.6542	-74.9219	Moa
MOB	30.6912	-88.2428	Mobile Municipal Apt
MOC	-16.7044	-43.8203	Montes Claros
MOD	37.6167	-120.9500	Modesto
MOE	23.0919	96.6531	MOMEIK
MOF	-8.6378	122.2375	Maumere
MOG	20.5344	99.2627	MONGHSAT
MOI	-19.8425	-157.7033	Mitiaro Island
MOL	62.7447	7.2625	Molde
MON	-43.7650	170.1333	MOUNT COOK
MOO	-28.1000	140.1967	MOOMBA
MOQ	-20.2847	44.3176	Morondava
MOT	48.2594	-101.2803	Minot International Apt
MOU	62.0954	-163.6821	Mountain Village
MOV	-22.0583	148.0767	Moranbah
MOZ	-17.4917	-149.7606	Moorea
MPA	-17.6342	24.1767	Katima Mulilo
MPH	11.9245	121.9541	Caticlan
MPI	9.1670	-77.9670	  Mamitupo
MPK	34.7589	126.3811	MOKPO
MPL	43.5833	3.9614	Montpellier Mediterranee Apt
MPM	-25.9319	32.5764	Maputo
MPN	-51.8233	-58.4467	Mount Pleasant
MPP	8.9330	-77.7330	Mulatupo
MPV	44.2035	-72.5623	EDWARD F KNAPP STATE/BARRE
MPW	47.0764	37.4511	MARIUPOL INTL
MQB	40.5203	-90.6522	MACOMB MUNI
MQF	53.3933	58.7567	Magnitogorsk
MQH	-13.5500	-48.2000	MINACU
MQJ	66.4558	143.2531	Khonuu
MQL	-34.2308	142.0842	Mildura
MQM	37.2328	40.6406	Mardin
MQN	66.2500	14.3014	Mo I Rana
MQP	-25.3832	31.1056	Nelspruit
MQQ	8.6203	16.0683	MOUNDOU
MQS	12.8877	-61.1800	MUSTIQUE
MQT	46.3536	-87.3954	Marquette
MQU	5.2125	-74.8836	MARIQUITA/MARQUITA
MQX	13.4733	39.5182	Mekele
MQY	36.0090	-86.5200	SMYRNA
MQZ	-33.9300	115.1000	MARGARET RIVER
MRA	32.3250	15.0610	Misurata
MRB	39.4019	-77.9844	MARTINSBURG EASTERN WV REG.
MRD	8.5833	-71.1667	Merida
MRE	-1.1670	35.0830	Masai Mara
MRG	-17.0708	145.4219	MAREEBA
MRM	-9.2000	147.6170	  Manare
MRO	-40.9733	175.6336	MASTERTON
MRQ	13.3286	121.8472	MARINDUQUE
MRR	-4.3783	-79.9411	MACARA
MRS	43.4367	5.2150	Marseille Provence Apt
MRU	-20.4300	57.6831	Mauritius
MRV	44.2250	43.0833	Mineralnye Vody
MRW	54.7000	11.4414	LOLLAND FALSTER/MARIBO
MRX	30.5589	49.1506	Bandar Mahshahr
MRY	36.5870	-121.8429	Monterey Peninsula Apt
MRZ	-29.4983	149.8453	Moree
MSA	53.4411	-91.7631	Muskrat Dam
MSE	51.3422	1.3461	MANSTON
MSJ	40.7052	141.3719	Misawa
MSL	34.7453	-87.6103	Muscle Shoals
MSN	43.1399	-89.3375	Madison
MSO	46.9163	-114.0906	Missoula
MSP	44.8820	-93.2218	Minneapolis International Apt
MSQ	53.8825	28.0325	Minsk International Apt
MSR	38.7447	41.6539	Mus
MSS	44.9358	-74.8456	Massena
MST	50.9158	5.7769	Maastricht/Aachen
MSU	-29.4437	27.5575	Maseru
MSW	15.6711	39.3680	Massawa
MSY	29.9934	-90.2580	New Orleans Louis Armstrong Intl Apt
MSZ	-15.2612	12.1468	Namibe
MTE	-1.9964	-54.0708	MONTE ALEGRE
MTH	24.7262	-81.0514	  Marathon
MTJ	38.5098	-107.8942	Montrose
MTL	-32.7033	151.4883	MAITLAND
MTM	55.1310	-131.5781	Metlakatla
MTN	39.3256	-76.4139	BALTIMORE MARTIN STATE
MTP	41.0765	-71.9208	MONTAUK
MTQ	-26.4917	147.9417	MITCHELL
MTR	8.8236	-75.8258	Monteria
MTS	-26.5239	31.3111	Manzini
MTT	18.1033	-94.5806	Minatitlan
MTV	-13.6660	167.7120	Mota Lava
MTY	25.7759	-100.1065	Monterrey Mariano Escobedo Intl
MUA	-8.3270	157.2630	Munda
MUB	-19.9725	23.4281	Maun
MUC	48.3538	11.7861	Munich International Airport
MUE	20.0013	-155.6681	Kamuela
MUH	31.3253	27.2217	MERSA-MATRUH
MUK	-20.1361	-157.3453	Mauke Island
MUN	9.7511	-63.1525	Maturin
MUO	43.0435	-115.8726	MOUNTAIN HOME AFB
MUR	4.1775	114.3219	Marudi
MUW	35.2169	0.1483	Mascara
MUX	30.2032	71.4191	Multan
MUZ	-1.4830	33.8000	  Musoma
MVB	-1.6519	13.4347	FRANCEVILLE/MVENGUE
MVD	-34.8378	-56.0303	Montevideo
MVF	-5.1964	-37.3619	MOSSORO/DIX SEPT ROSADO
MVP	1.2536	-70.2342	Mitu
MVQ	53.9556	30.0961	MOGILEV
MVR	10.4547	14.2531	Maroua
MVS	-18.0489	-39.8642	  Mucuri
MVT	-14.8658	-148.7161	Mataiva
MVY	41.3930	-70.6143	Martha's Vineyard
MVZ	-20.0595	30.8619	MASVINGO
MWA	37.7550	-89.0111	Marion
MWE	18.4554	31.8187	MEROWE
MWF	-14.9972	168.0811	Maewo
MWH	47.2077	-119.3202	MOSES LAKE/GRANT COUNTY INTL
MWL	32.7817	-98.0603	MINERAL WELLS
MWQ	20.1655	94.9412	  Magwe
MWX	34.9914	126.3828	Muan
MWZ	-2.4441	32.9319	Mwanza
MXF	32.4639	-86.3661	MAXWELL AFB
MXH	-6.3633	143.2381	Moro
MXJ	9.6394	6.4708	MINNA
MXL	32.6307	-115.2419	Mexicali
MXM	-21.7539	43.3755	  Morombe
MXN	48.6008	-3.8167	MORLAIX/PLOUJEAN
MXP	45.6300	8.7231	Milan Malpensa Apt
MXT	-18.0500	44.0330	  Maintirano
MXV	49.6583	103.6917	Moron
MXX	60.9586	14.5106	Mora
MXZ	24.3500	116.1330	Meixian
MYA	-35.9042	150.1394	Moruya
MYC	10.1833	-67.5667	MARACAY/EL LIBERTADOR
MYD	-3.2232	40.1005	Malindi
MYE	34.0722	139.5597	MIYAKEJIMA
MYG	22.3795	-73.0135	Mayaguana
MYI	-9.9167	144.0550	  Murray Island
MYJ	33.8272	132.6997	Matsuyama
MYL	44.8897	-116.1014	MC CALL MUNICIPAL
MYN	15.4681	45.3278	MARIB
MYP	37.6194	61.8967	MARY
MYQ	12.3072	76.6497	Mysore
MYR	33.6797	-78.9283	Myrtle Beach AFB
MYT	25.3882	97.3567	Myitkyina
MYU	60.3714	-166.2706	Mekoryuk
MYV	39.0983	-121.5700	YUBA COUNTY/MARYSVILLE
MYW	-10.3361	40.1820	Mtwara
MYY	4.3253	113.9883	Miri
MZA	29.4830	77.7000	  Muzaffarnagar
MZB	-11.3500	40.3500	MOCIMBOA DA PRAIA
MZG	23.5722	119.6222	Magong
MZH	40.8325	35.5164	Amasya
MZI	14.5086	-4.0842	MOPTI
MZJ	32.5098	-111.3253	MARANA/PINAL AIRPARK
MZL	5.0303	-75.4672	Manizales
MZM	49.0764	6.1339	METZ/FRESCATY
MZO	20.2881	-77.0892	MANZANILLO/CUBA
MZQ	-27.6333	32.0500	MKUZI
MZR	36.7042	67.2083	Mazar-e Sharif
MZT	23.1614	-106.2644	Mazatlan
MZU	26.1169	85.3150	MUZAFFARPUR
MZV	4.0483	114.8050	Mulu
MZW	33.5219	-0.2831	Mecheria
NAA	-30.3208	149.8261	NARRABRI
NAE	10.3833	1.3667	NATITINGOU
NAG	21.0919	79.0483	Nagpur
NAH	3.6832	125.5280	Tahuna
NAJ	39.1888	45.4584	Nakchivan
NAK	14.9494	102.3156	NAKHON RATCHASIMA
NAL	43.5133	43.6378	NALCHIK
NAN	-17.7564	177.4436	Nadi
NAO	30.7540	106.0620	Nanchong
NAP	40.8844	14.2908	Naples Capodichino Apt
NAQ	77.4887	-69.3887	Qaanaaq
NAS	25.0390	-77.4662	Nassau
NAT	-5.9083	-35.2492	Natal
NAU	-14.1768	-141.2673	Napuka
NAV	38.7764	34.5264	Nevsehir
NAW	6.5233	101.7447	Narathiwat
NAY	39.9608	116.2567	Beijing Nanyuan Apt
NAZ	-10.7833	162.3000	XXX
NBB	63.9183	65.0100	BERYOZOVO
NBC	55.5633	52.0950	Nizhnekamsk
NBE	36.0758	10.4386	Enfidha
NBG	29.8253	-90.0350	NEW ORLEANS NAS JRB
NBK	13.6857	100.7490	BANGKOK SUVARNABHUMI INTL
NBO	-1.3192	36.9278	Nairobi Jomo Kenyatta International Apt
NBS	42.0881	127.5489	Chang Bai Shan
NBW	19.9067	-75.2067	GUANTANAMO US-NAVAL AIR BASE
NBX	-3.3682	135.4964	Nabire
NCA	21.9176	-71.9396	NORTH CAICOS
NCE	43.6653	7.2150	Nice
NCL	55.0375	-1.6917	Newcastle
NCS	-27.7729	29.9764	NEWCASTLE
NCU	42.4883	59.6233	Nukus
NCY	45.9308	6.1064	ANNECY/MEYTHET
NDB	20.9283	-17.0311	Nouadhibou
NDC	19.1819	77.3186	  Nanded
NDE	3.9330	41.8500	  Mandera
NDG	47.2383	123.9183	Qiqihar
NDJ	12.1249	15.0248	N'Djamena
NDK	5.6330	168.1160	Namdrik Island
NDR	34.9892	-3.0278	Nador
NDU	-17.9561	19.7206	Rundu
NDY	59.2503	-2.5767	Sanday
NEC	-38.4833	-58.8167	NECOCHEA
NEG	18.3642	-78.3056	  Negril
NER	56.9133	124.9117	Neryungri
NEU	20.4000	104.0500	SAMNEUA
NEV	17.2056	-62.5940	Nevis
NEW	30.0424	-90.0283	NEW ORLEANS/LAKEFRONT
NFL	39.4166	-118.7010	FALLON NAS/VAN VOORHIS FLD
NFO	-15.6000	-175.6500	Mata'aho (TO)
NFW	32.7700	-97.4417	FORT WORTH NAS JRB
NGA	-34.2500	148.2483	YOUNG
NGB	29.8233	121.4633	Ningbo
NGE	7.3592	13.5600	Ngaoundere
NGF	21.4517	-157.7700	KANEOHE BAY MCAF MOKAPU
NGI	-18.1156	179.3397	  Ngau
NGK	51.8125	143.1667	Nogliki
NGO	34.8583	136.8053	Nagoya Chubu Centrair International Apt
NGP	27.6931	-97.2914	CORPUS CHRISTI NAS
NGQ	32.5167	80.0667	Shiquande
NGS	32.9170	129.9134	Nagasaki
NGU	36.9377	-76.2893	NORFOLK NAS
NGZ	37.7900	-122.3250	ALAMEDA NAS
NHA	12.2230	109.2001	NHATRANG
NHF	15.3556	35.7278	NEW HALFA
NHT	51.5531	-0.4183	NORTHOLT
NHV	-8.7947	-140.2231	Nuku Hiva
NHZ	43.8917	-69.9425	BRUNSWICK NAS
NIB	63.0186	-154.3584	Nikolai
NIC	35.1500	33.2772	Nicosia
NID	35.6855	-117.6920	CHINA LAKE NAWS (ARMITAGE FLD)
NIM	13.4817	2.1703	Niamey
NIN	60.0202	-151.5894	  Ninilchik
NIP	30.2350	-81.6767	JACKSONVILLE NAS
NIQ	70.7917	-53.6667	Niaqornat
NIU	-16.1190	-146.3680	Niau
NJA	35.4547	139.4501	ATSUGI
NJC	60.9483	76.4817	Nizhnevartovsk
NJF	31.9900	44.4030	Al Najaf
NJK	32.8292	-115.6717	EL CENTRO NAF
NKC	18.0956	-15.9500	Nouakchott
NKG	31.7400	118.8600	Nanjing
NKI	55.8500	-133.1830	Naukiti
NKM	35.2555	136.9244	Nagoya Komaki Airport
NKT	34.9009	-76.8807	Sirnak
NKW	-7.3133	72.4100	DIEGO GARCIA
NKX	32.8684	-117.1425	SAN DIEGO-MIRAMAR MCAS
NLA	-12.9956	28.6656	Ndola
NLD	27.4434	-99.5699	Nuevo Laredo
NLF	-9.5833	143.7667	  Darnley Island
NLG	56.0075	-161.1604	Nelson Lagoon
NLK	-29.0417	167.9383	Norfolk Island
NLO	-4.3167	15.3167	KINSHASA/N'DOLO
NLT	43.4100	83.3600	Xinyuan
NLV	47.0581	31.9208	MYKOLAIV
NMA	40.9833	71.5500	Namangan
NME	60.4710	-164.7008	Nightmute
NMM	32.5521	-88.5556	MERIDIAN NAS/MC CAIN FIELD
NMS	19.6934	97.2158	NAMSANG
NNB	-10.8500	162.4622	Santa Ana Island
NNG	22.6167	108.1833	Nanning
NNL	59.9802	-154.8392	Nondalton
NNM	67.6400	53.1250	Naryan-Mar
NNT	18.8078	100.7853	Nan
NNU	-17.8167	-40.3333	NANUQUE
NNX	4.1500	117.6500	Nunukan
NNY	32.9808	112.6153	Nanyang
NOA	-34.9483	150.5367	NOWRA
NOB	9.9765	-85.6530	Nosara
NOC	53.9103	-8.8185	Knock
NOG	31.2261	-110.9758	NOGALES
NOJ	63.1833	75.2700	Nojabrsk
NOP	42.0158	35.0664	Sinop
NOS	-13.3181	48.3092	Nosy-Be
NOU	-22.0164	166.2161	La Tontouta
NOV	-12.8000	15.7112	Huambo
NOZ	53.8100	86.8783	Novokuznetsk
NPA	30.3533	-87.3200	PENSACOLA NAS/F.SHERMAN FLD
NPE	-39.4658	176.8700	Napier-Hastings
NPL	-39.0086	174.1792	New Plymouth
NQN	-38.9489	-68.1558	Neuquen
NQU	5.7000	-77.2830	Nuqui
NQX	24.5817	-81.6928	KEY WEST NAS/BOCA CHICA
NQY	50.4406	-4.9954	Newquay
NRA	-34.7028	146.5083	Narrandera
NRD	53.7068	7.2302	  Norderney
NRK	58.5861	16.2464	Norrkoping
NRL	59.3683	-2.4333	North Ronaldsay
NRN	51.6024	6.1422	Duesseldorf Weeze Airport
NRR	18.2500	-65.6333	ROOSEVELT ROADS
NRT	35.7647	140.3864	Tokyo Narita Intl
NSB	25.7000	-76.2667	ALICE TOWN/SOUTH BEMINI
NSH	36.6633	51.4647	Now Shahr
NSI	3.7172	11.5525	Yaounde Nsimalen Intl Apt
NSK	69.3100	87.3333	Norilsk
NSN	-41.2983	173.2211	Nelson
NSO	-32.0383	150.8317	SCONE
NSQ	74.1100	-57.0650	Nuussuaq
NST	8.4639	99.9583	Nakhon Si Thammarat
NSY	37.4033	14.9217	CATANIA/SIGONELLA
NTB	59.5655	9.2123	NOTODDEN
NTD	34.1203	-119.1210	POINT MUGU NAS
NTE	47.1569	-1.6078	Nantes Atlantique Airport
NTG	32.0708	120.9756	Nantong
NTL	-32.7950	151.8350	Newcastle Williamtown Apt
NTN	-17.6850	141.0697	Normanton
NTQ	37.2931	136.9619	Wajima
NTR	25.8656	-100.2372	MONTERREY/AEROPORTE DEL NORTE
NTT	-15.9767	-173.7550	  Niuatoputapu
NTX	3.9087	108.3879	Natuna
NTY	-25.3335	27.1716	PILANESBERG
NUA	6.9670	80.7670	Nuwara Eliya
NUC	33.0227	-118.5885	SAN CLEMENTE ISLAND NALF
NUD	12.6667	28.3333	NAHUD
NUE	49.4987	11.0669	Nuremberg
NUI	70.2100	-151.0055	Nuiqsut
NUK	-19.2850	-138.7722	Nukutavake
NUL	64.7293	-158.0742	Nulato
NUP	60.9058	-162.4391	Nunapitchuk
NUQ	37.4161	-122.0491	MOFFET FEDERAL AIRFIELD
NUS	-16.0797	167.4006	Norsup
NUU	-0.2997	36.1606	Nakuru
NUW	48.3518	-122.6559	WHIDBEY ISLAND NAS
NUX	66.0700	76.5200	Novy Urengoy
NVA	2.9506	-75.2939	Neiva
NVI	40.1150	65.1592	Navoi
NVK	68.4369	17.3867	Narvik
NVP	-5.1175	-60.3644	NOVO ARIPUANA
NVR	58.6267	31.3833	KRETCHEVITSY
NVS	47.0036	3.1108	NEVERS/FOURCHAMBAULT
NVT	-26.8786	-48.6508	Navegantes
NWA	-12.1333	44.4333	MOHELI
NWI	52.6758	1.2828	Norwich
NYA	62.1406	65.3936	Nyagan
NYI	7.3628	-2.3294	Sunyani
NYK	-0.0670	37.0330	Nanyuki
NYM	65.4817	72.7000	Nadym
NYN	-31.5531	147.2031	NYNGAN
NYO	58.7886	16.9036	Stockholm Skavsta Airport
NYT	19.6191	96.1999	Nay Pyi Taw
NYU	21.1803	94.9322	Bagan/Nyaung-U
NZE	7.8060	-8.7018	NZEREKORE/KONIA
NZH	49.6000	117.4333	Manzhouli
NZW	42.1650	-70.9400	SOUTH WEYMOUTH NAS
NZY	32.6992	-117.2153	NORTH ISLAND/HALSEY FLD NAS
OAG	-33.3833	149.1317	Orange
OAI	34.9463	69.2650	Bagram
OAJ	34.8292	-77.6121	Jacksonville
OAK	37.7213	-122.2207	Oakland International Apt
OAL	-11.4339	-61.4825	Cacoal
OAM	-44.9700	171.0817	OAMARU
OAX	16.9986	-96.7260	Oaxaca
OBF	48.0831	11.2833	OBERPFAFFENHOFEN
OBI	-1.9000	-55.5333	OBIDOS
OBL	51.2656	4.7547	ZOERSEL - MIL
OBN	56.4635	-5.3997	  Oban
OBO	42.7334	143.2172	Obihiro
OBS	44.5394	4.3717	AUBENAS/ARDECHE MERIDIONALE
OBU	66.9123	-156.8973	Kobuk
OBX	-7.5830	141.3170	  Obo
OBY	70.4850	-21.9806	Ittoqqortoormiit
OCC	-0.4606	-76.9881	Coca
OCV	8.3151	-73.3583	  Oca�a
ODB	37.8420	-4.8489	CORDOBA
ODE	55.4767	10.3309	ODENSE
ODH	51.2336	-0.9414	ODIHAM
ODN	3.9670	115.0500	Long Seridan
ODO	57.8629	114.2272	Bodaybo
ODS	46.4269	30.6781	Odesa
ODW	48.2515	-122.6737	  Oak Harbor
ODX	41.6244	-98.9522	ORD EVELYN SHARP FLD
ODY	20.6667	102.0000	Muang Xay
OEL	52.9833	36.1000	OREL YUZHNY
OER	63.4078	18.9925	Ornskoldsvik
OFF	41.1183	-95.9125	OMAHA/OFFUT
OFK	41.9856	-97.4353	NORFOLK KARL STEFAN MEMORIAL
OGD	41.1961	-112.0122	Ogden Municipal Apt
OGG	20.8987	-156.4305	Kahului
OGL	6.8069	-58.1044	Georgetown
OGM	8.9450	-77.7340	Ustupo Island
OGN	24.4656	122.9757	YONAGUNI
OGS	44.6819	-75.4656	Ogdensburg
OGX	31.9172	5.4128	Ouargla
OGZ	43.2050	44.6083	Vladikavkaz
OHA	-40.2067	175.3869	OHAKEA
OHD	41.1799	20.7423	OHRID
OHE	53.5000	122.4000	Mohe
OHH	53.6200	142.9500	Okha
OHO	59.4170	143.0500	  Okhotsk
OHT	33.5750	71.4417	KOHAT
OIA	-6.7613	-51.0490	Ourilandia Airport
OIM	34.7847	139.3614	Oshima
OIR	42.0717	139.4328	OKUSHIRI
OIT	33.4794	131.7373	Oita
OKA	26.1958	127.6459	Okinawa Naha Apt
OKC	35.3931	-97.6007	Oklahoma City Will Rogers Apt
OKD	43.1175	141.3814	SAPPORO
OKE	27.4317	128.7056	OKIERABU
OKH	52.7357	-0.6488	COTTESMORE
OKI	36.1811	133.3248	OKI
OKJ	34.7536	133.8581	Okayama
OKL	-4.8330	140.6000	Oksibil
OKO	35.7532	139.3468	TOKYO YOKOTA AB
OKR	-9.7533	143.4050	  Masig Island
OKS	41.4000	-102.3500	OSHKOSH GARDEN COUNTY
OKY	-27.4111	151.7350	OAKEY
OLA	63.6992	9.6039	Orland
OLB	40.8986	9.5178	Olbia
OLC	-3.4709	-68.9585	Sao Paula de Olivenca
OLD	44.9542	-68.6794	OLD TOWN/DEWITT FIELD
OLF	48.0944	-105.5917	Wolf Point
OLH	57.2181	-153.2697	Old Harbor
OLJ	-14.8817	166.5581	  Olpoi
OLK	60.3883	120.4717	OLEKMINSK
OLL	-1.2215	15.9136	Oyo
OLM	46.9694	-122.9025	OLYMPIA
OLP	-30.4833	136.8783	Olympic Dam
OLS	31.4178	-110.8478	NOGALES INTL
OLV	34.9789	-89.7869	OLIVE BRANCH
OLY	38.7219	-88.1764	OLNEY-NOBLE
OMA	41.3032	-95.8941	Omaha Eppley Airfield
OMB	-1.5747	9.2627	  Omboue
OMC	11.0711	124.5500	ORMOC
OMD	-28.5847	16.4467	Oranjemund
OME	64.5122	-165.4452	Nome
OMF	32.3500	36.2500	MAFRAQ
OMH	37.6714	45.0692	Urumiyeh
OMO	43.2829	17.8459	Mostar
OMR	47.0253	21.9024	Oradea
OMS	54.9667	73.3100	Omsk
ONA	47.0944	-114.3968	KONA
ONB	-8.5830	147.2000	  Ononge
OND	-17.8772	15.9500	Ondangwa
ONG	-16.6667	139.1667	Mornington Island
ONJ	40.1919	140.3714	Odate/Noshiro
ONL	42.4697	-98.6881	ONEILL MUNI-JOHN L BAKER FLD
ONP	44.5804	-124.0579	  Newport
ONQ	41.5158	32.0997	Zonguldak
ONT	34.0560	-117.6012	Ontario LA/Ontario International Apt
ONX	9.3556	-79.8675	COLON/E.A.JIMENEZ
OOK	60.5414	-165.0872	Toksook Bay
OOL	-28.1650	153.5050	Gold Coast
OOM	-36.3025	148.9750	COOMA-SNOWY MOUNTAINS
OPF	25.9067	-80.2783	OPA LOCKA
OPO	41.2356	-8.6781	Porto
OPS	-11.8733	-55.5733	Sinop
OPU	-8.0500	142.9330	  Balimo
OQU	41.5971	-71.4121	NORTH KINGSTON/QUONSET STATE
ORA	-23.1500	-64.3233	ORAN
ORB	59.2281	15.0400	Orebro
ORD	41.9786	-87.9048	Chicago O'Hare International Apt
ORE	47.9878	1.7606	ORLEANS/BRICY
ORF	36.8946	-76.2012	Norfolk International Apt
ORG	5.8111	-55.1936	PARAMARIBO/ZORG EN HOOP
ORH	42.2667	-71.8750	Worcester
ORI	57.8854	-152.8461	Port Lions
ORK	51.8414	-8.4911	Cork
ORL	28.5455	-81.3329	ORLANDO/EXECUTIVE
ORN	35.6272	-0.6114	Oran Es Senia Apt
ORP	-21.2667	25.3167	ORAPA
ORT	62.9613	-141.9292	NORTHWAY
ORU	-17.9626	-67.0762	Oruro
ORV	66.8175	-161.0223	Noorvik
ORW	25.3000	64.5833	ORMARA
ORX	-1.7667	-55.8667	ORIXIMINA
ORY	48.7233	2.3794	Paris Orly Apt
ORZ	18.0670	-88.5670	Orange Walk
OSC	44.4515	-83.3940	OSCODA-WURTSMITH AFB
OSD	63.1944	14.5003	Are/Ostersund
OSH	43.9844	-88.5571	OSHKOSH WITTMAN REGIONAL
OSI	45.4627	18.8102	Osijek
OSK	57.3519	16.4983	OSKARSHAMN
OSL	60.2028	11.0839	Oslo Gardermoen Airport
OSM	36.3058	43.1474	Mosul
OSN	37.0883	127.0300	SONGTAN-SI OSAN AB
OSP	54.4789	17.1075	SLUPSK REDZIKOWO
OSR	49.6961	18.1108	Ostrava
OSS	40.6083	72.7933	Osh
OST	51.1989	2.8622	Oostende/Brugge
OSW	51.0717	58.5967	Orsk
OSY	64.4722	11.5786	Namsos
OSZ	54.2500	16.2500	XXX
OTD	8.6170	-79.0330	Contadora Island
OTH	43.4171	-124.2460	North Bend
OTM	41.1066	-92.4479	OTTUMWA INDUSTRIAL
OTP	44.5710	26.0851	Bucharest Henri Coanda Apt
OTR	8.6016	-82.9686	  Coto 47
OTZ	66.8847	-162.5985	Kotzebue
OUA	12.3536	-1.5119	Ouagadougou
OUD	34.7861	-1.9256	Oujda
OUE	1.6167	16.0333	OUESSO
OUH	-33.6000	22.1833	OUDTSHOORN
OUI	20.2583	100.4333	BAN HUOEISAY
OUL	64.9292	25.3556	Oulu
OUR	4.4667	14.3667	BATOURI
OUS	-22.9661	-49.9114	OURINHOS
OUZ	22.7564	-12.4836	Zouerate
OVB	55.0117	82.6517	Novosibirsk
OVD	43.5636	-6.0346	Asturias
OVR	-36.8889	-60.2278	OLAVARRIA
OVS	61.3667	63.5667	Sovetsky
OWB	37.7401	-87.1668	Owensboro
OXB	11.8886	-15.6556	Bissau
OXF	51.8369	-1.3200	OXFORD KIDLINGTON
OXR	34.2008	-119.2072	  Oxnard
OYA	7.3367	81.6283	Goya
OYE	1.5431	11.5814	  Oyem
OYG	3.6330	31.7500	  Moyo
OYK	3.8367	-51.8300	OIAPOQUE
OZC	8.1807	123.8406	Ozamis
OZG	30.2690	-5.8525	Zagora
OZH	47.8672	35.3164	Zaporizhia
OZP	37.1750	-5.6150	MORON
OZZ	30.9371	-6.9059	Ouarzazate
PAA	19.6934	97.2158	HPA-AN
PAB	22.0000	82.0667	BILASPUR
PAC	8.9733	-79.5556	Panama City Marcos A.Gelabert Intl
PAD	51.6141	8.6163	Paderborn/Lippstadt
PAE	47.9063	-122.2816	EVERETT/SNOHOMISH CO
PAF	2.2022	31.5544	Pakuba
PAG	7.8300	123.4750	Pagadian
PAH	37.0603	-88.7730	Paducah
PAI	12.8500	102.5830	  Pailin
PAJ	33.9000	70.0714	PARACHINAR
PAK	15.1333	105.7833	PAKSE AIRFIELD
PAL	5.4833	-74.6567	PALANQUERO / GERMAN OLANO
PAM	30.0700	-85.5765	PANAMA CITY/TYNDALL AFB
PAN	6.7856	101.1536	PATTANI
PAP	18.5792	-72.2956	Port au Prince
PAS	37.0133	25.1267	Paros
PAT	25.5936	85.0919	Patna
PAV	-9.4019	-38.2539	Paulo Afonso
PAZ	20.6021	-97.4606	Poza Rica
PBB	-2.8939	-41.7325	PARNAIBA/PREF DR JOAO S. FILHO
PBC	19.1581	-98.3715	Puebla
PBD	21.6504	69.6586	Porbandar
PBF	34.1731	-91.9356	PINE BLUFF - GRIDER FLD
PBG	44.6509	-73.4681	Plattsburgh
PBH	27.4031	89.4258	Paro
PBI	26.6832	-80.0956	West Palm Beach International Apt
PBJ	-16.4390	168.2570	Paama
PBL	10.4833	-68.0667	Puerto Cabello
PBM	5.4557	-55.2008	Paramaribo Johan A Pengel Apt
PBO	-23.1717	117.7450	Paraburdoo
PBP	9.8561	-85.3708	  Punta Islita
PBQ	-11.6414	-61.1806	PIMENTA BUENO
PBR	15.7367	-88.5950	PUERTO BARRIOS
PBU	16.8944	97.6744	Putao
PBZ	-34.0903	23.3278	Plettenberg Bay
PCA	58.9065	-157.7141	  Portage Creek
PCE	57.1539	-157.3969	Painter Creek
PCL	-8.3779	-74.5742	Pucallpa
PCP	1.6672	7.4114	PRINCIPE
PCR	6.1875	-67.4967	Puerto Carreno
PCS	-7.0650	-41.5189	PICOS
PDA	3.8527	-67.9061	Puerto Inirida
PDB	59.7896	-154.1238	Pedro Bay
PDF	-17.3500	-39.2167	PRADO
PDG	-0.7883	100.2864	Padang
PDK	33.8756	-84.3020	ATLANTA/DE KALB-PEACHTREE
PDL	37.7419	-25.6978	Ponta Delgada
PDP	-34.8583	-55.0917	Punta Del Este
PDS	28.6283	-100.5361	Piedras Negras
PDT	45.6951	-118.8414	Pendleton
PDV	42.0672	24.8506	Plovdiv
PDX	45.5887	-122.5975	Portland
PEC	57.9552	-136.2363	Pelican
PED	50.0133	15.7386	Pardubice
PEE	57.9167	56.0267	Perm
PEG	43.0983	12.5111	Perugia
PEH	-35.8411	-61.8575	PEHUAJO/COMODORE PEDRO ZANNI
PEI	4.8128	-75.7394	Pereira
PEK	40.0733	116.5950	Beijing Capital Intl Apt
PEM	-12.6222	-69.2222	Puerto Maldonado
PEN	5.2972	100.2767	Penang
PER	-31.9400	115.9667	Perth
PES	61.8850	34.1567	Petrozavodsk
PET	-31.7161	-52.3311	Pelotas
PEU	15.2622	-83.7812	Puerto Lempira
PEW	33.9939	71.5146	Peshawar
PEX	65.1217	57.1300	PECHORA
PEZ	53.1100	45.0233	Penza
PFB	-28.2447	-52.3281	Passo Fundo
PFN	30.2121	-85.6828	PANAMA CITY/BAY COUNTY
PFO	34.7194	32.4847	Paphos
PFQ	39.6503	47.9142	Parsabad
PFR	-4.3167	20.6000	ILEBO
PGA	36.9261	-111.4484	Page
PGD	26.9196	-81.9906	Punta Gorda
PGF	42.7408	2.8697	Perpignan
PGG	-9.3367	-54.9647	NOVO PROGRESSO/CACHIMBO
PGH	29.0321	78.4725	PANTNAGAR/NAINITAL
PGK	-2.1630	106.1400	Pangkalpinang
PGM	59.3483	-151.8315	Port Graham
PGU	27.4811	52.6000	Asaloyeh
PGV	35.6352	-77.3853	Greenville
PGX	45.1975	0.8153	Perigueux
PGZ	-25.1872	-50.1439	PONTA GROSSA
PHB	-2.8937	-41.7320	Parnaiba
PHC	5.0156	6.9495	Port Harcourt
PHE	-20.3792	118.6253	Port Hedland
PHF	37.1319	-76.4930	Newport News
PHG	4.8500	7.0167	Port Harcourt City
PHI	-2.4833	-45.0667	PINHEIRO
PHL	39.8719	-75.2411	Philadelphia International Apt
PHN	42.9110	-82.5289	PORT HURON - ST CLAIRE CO INTL
PHO	68.3488	-166.7994	Point Hope
PHP	44.0486	-101.5991	PHILIP
PHR	-18.2570	178.0680	  Pacific Harbour / Deuba
PHS	16.7861	100.2781	Phitsanulok
PHT	39.7002	-87.6696	PARIS - EDGAR COUNTY
PHW	-23.9372	31.1554	Phalaborwa
PHX	33.4342	-112.0115	Phoenix Sky Harbor Intl Apt
PIA	40.6642	-89.6933	Peoria
PIB	31.4671	-89.3371	Laurel Hattiesburg-Laurel Regional Apt
PIE	27.9101	-82.6873	Tampa St Petersbrg-Clearwater Intl Apt
PIF	22.6917	120.4583	PINGTUNG/NORTH AIRPORT
PIH	42.9098	-112.5959	Pocatello
PIK	55.5094	-4.5944	Glasgow Prestwick Apt
PIN	-2.6658	-56.7822	Parintins
PIO	-13.7448	-76.2204	PISCO INTL
PIP	57.5804	-157.5720	Pilot Point Airport
PIR	44.3827	-100.2860	Pierre
PIS	46.5875	0.3067	Poitiers Biard Airport
PIT	40.4915	-80.2329	Pittsburgh International Apt
PIU	-5.2022	-80.6142	Piura
PIW	55.5889	-97.1642	PIKWITONEI
PIX	38.5543	-28.4413	Pico Island
PIZ	69.7329	-163.0053	Point Lay
PJA	67.2458	23.0689	Pajala
PJC	-22.6417	-55.8317	PEDR J.CABALERO/AUGUSTO FUSTER
PJG	26.9509	64.1391	Panjgur
PJM	8.5356	-83.2997	Puerto Jimenez
PKA	60.7029	-161.7783	Napaskiak
PKB	39.3451	-81.4392	Parkersburg/Marietta
PKC	53.1700	158.4517	Petropavlovsk
PKD	46.9006	-95.0731	PARK RAPIDS MUNI - KONSHOK FLD
PKE	-33.1328	148.2403	Parkes
PKG	4.2500	100.5500	  Pangkor
PKK	21.3330	95.1000	  Pakokku
PKN	-2.7044	111.6706	Pangkalanbun
PKO	9.3572	2.6092	PARAKOU
PKR	28.1999	83.9815	Pokhara
PKU	0.4550	101.4433	Pekanbaru
PKV	57.7850	28.3983	PSKOV
PKW	-22.0556	27.8203	SELEBI-PHIKWE
PKY	-2.2267	113.9442	Palangkaraya
PKZ	15.1306	105.7814	Pakse
PLB	44.6875	-73.5245	PLATTSBURG
PLD	10.2500	-85.4170	  Playa S�mara
PLH	50.4228	-4.1058	PLYMOUTH
PLI	-18.7550	146.5817	PALM ISLAND
PLJ	16.5330	-88.3500	Placencia
PLL	-3.1458	-59.9842	MANAUS/PONTA PELADA
PLM	-2.9006	104.7000	Palembang
PLN	45.5709	-84.7967	Pellston
PLO	-34.6069	135.8789	Port Lincoln
PLQ	55.9732	21.0939	Klaipeda/Palanga
PLS	21.7736	-72.2659	Providenciales
PLU	-19.8519	-43.9506	Belo Horizonte Pampulha Apt
PLW	-0.9167	119.9103	Palu
PLX	50.3514	80.2344	Semey
PLZ	-33.9900	25.6103	Port Elizabeth
PMA	-5.2548	39.8094	Pemba
PMC	-41.4319	-73.0928	Puerto Montt
PMD	34.6294	-118.0846	PALMDALE RGNL/USAF PLANT 42
PMF	44.8222	10.2953	Milan Parma Apt
PMG	-22.5497	-55.7025	PONTA PORA/INTL
PMI	39.5517	2.7388	Palma De Mallorca
PMK	-18.7553	146.5814	  Palm Island
PML	56.0060	-160.5608	Port Moller
PMO	38.1819	13.0994	Palermo
PMR	-40.3206	175.6169	Palmerston North
PMS	34.5500	38.3000	PALMYRA
PMV	10.9158	-63.9650	Porlamar
PMW	-10.2944	-48.3628	Palmas
PMY	-42.7500	-65.1000	Puerto Madryn
PMZ	8.9510	-83.4686	Palmar
PNA	42.7700	-1.6463	Pamplona
PNB	-10.7167	-48.3997	PORTO NATIONAL
PNC	36.7320	-97.0998	PONCA CITY RGNL
PND	16.1000	-88.8000	Punta Gorda
PNE	40.0819	-75.0106	NORTHEAST PHILADELPHIA
PNG	-25.5400	-48.5306	PARANAGUA
PNH	11.5483	104.8533	Phnom Penh
PNI	6.9851	158.2090	Pohnpei
PNK	-0.1478	109.4039	Pontianak
PNL	36.8133	11.9608	Pantelleria
PNP	-8.8075	148.3149	Popondetta
PNQ	18.5833	73.9333	Pune
PNR	-4.8147	11.8864	Pointe-Noire
PNS	30.4734	-87.1864	Pensacola Municipal Apt
PNT	-51.6725	-72.5258	PUERTO NATALES/TTE.J.GALLARDO
PNY	11.9667	79.8167	PONDICHERRY
PNZ	-9.3667	-40.5664	Petrolina
POA	-29.9939	-51.1711	Porto Alegre
POB	35.1708	-79.0145	FAYETTEVILLE/POPE AFB
POD	16.6830	-14.9670	  Podor
POF	36.7739	-90.3248	POPLAR BLUFF MUNI
POG	-0.7192	8.7514	Port Gentil
POI	-19.5414	-65.7211	Potosi
POJ	-18.6717	-46.4908	Patos De Minas
POL	-12.9833	40.5167	Pemba
POM	-9.4415	147.2205	Port Moresby
POO	-21.8372	-46.5656	POCOS DE CALDAS
POP	19.7578	-70.5699	Puerto Plata
POR	61.4614	21.7978	Pori
POS	10.5953	-61.3372	Port of Spain
POT	18.1967	-76.5361	PORT ANTONIO/KEN JONES
POU	41.6266	-73.8842	POUGHKEEPSIE - DUTCHESS CO
POW	45.4734	13.6150	PORTOROZ/INTL
POX	49.0967	2.0408	PONTOISE/CORMEILLES EN VEXIN
POZ	52.4210	16.8263	Poznan
PPB	-22.1778	-51.4183	President Prudente
PPE	31.3519	-113.5257	  Punta Pe�asco
PPG	-14.3310	-170.7094	Pago Pago
PPI	-33.2389	137.9950	PORT PIRIE
PPK	54.7744	69.1850	Petropavlovsk
PPL	27.5170	86.6000	  Phaplu
PPN	2.4544	-76.6089	Popayan
PPP	-20.4950	148.5514	Proserpine
PPQ	-40.9047	174.9892	Paraparaumu
PPS	9.7421	118.7587	Puerto Princesa
PPT	-17.5567	-149.6114	Tahiti
PPV	56.3288	-133.6101	Port Protection
PPW	59.3517	-2.9003	Papa Westray
PPY	-22.2883	-45.9189	POUSO ALEGRE
PQC	10.2236	103.9664	Phuquoc
PQI	46.6883	-68.0450	Presque Isle
PQM	17.5334	-91.9845	Palenque
PQQ	-31.4378	152.8636	Port Macquarie
PQS	61.9346	-162.8996	Pilot Station
PQT	70.0000	-51.2831	Qeqertaq
PRA	-31.7792	-60.4672	Parana
PRB	35.6729	-120.6271	PASO ROBLES MUNI
PRC	34.6545	-112.4196	Prescott
PRG	50.1008	14.2600	Prague Ruzyne
PRH	18.1286	100.1667	Phrae
PRI	-4.3192	55.6916	Praslin Island
PRM	37.1499	-8.5840	PORTIMAO
PRN	42.5728	21.0358	Pristina
PRQ	-26.7565	-60.4931	  Presidencia Roque S�enz Pe�a
PRS	-9.6417	161.4253	  Parasi
PRU	18.8239	95.2697	PYAY
PRV	49.4259	17.4048	PREROV
PSA	43.6827	10.3955	Pisa
PSC	46.2646	-119.1190	Pasco
PSD	31.2794	32.2400	PORT SAID
PSE	18.0083	-66.5630	Ponce
PSF	39.6389	-90.7784	PITTSFIELD PENSTONE MUNI
PSG	56.8017	-132.9453	Petersburg
PSI	25.2903	63.3444	PASNI
PSJ	-1.4168	120.6577	Poso
PSL	56.4392	-3.3722	PERTH/SCONE
PSM	43.0780	-70.8233	Portsmouth Pease International Airport
PSO	1.3967	-77.2911	Pasto
PSP	33.8296	-116.5067	Palm Springs Municipal Apt
PSR	42.4372	14.1872	Pescara
PSS	-27.3858	-55.9706	Posadas
PSU	0.8356	112.9371	Putussibau
PSW	-20.7328	-46.6592	PASSOS
PSX	28.7275	-96.2510	PALACIOS MUNI
PSZ	-18.9806	-57.8228	Puerto Suarez
PTA	60.2043	-154.3189	Port Alsworth
PTF	-17.7779	177.1967	  Malolo Lailai Island
PTG	-23.8453	29.4585	Polokwane
PTH	56.9591	-158.6334	Port Heiden
PTJ	-38.3183	141.4717	Portland
PTK	42.6655	-83.4201	PONTIAC OAKLAND COUNTY INTL
PTO	-26.2172	-52.6936	PATO BRANCO
PTP	16.2642	-61.5258	Pointe-a-Pitre
PTQ	-1.7389	-52.2444	PORTO DE MOZ
PTU	59.0114	-161.8197	Platinum
PTY	9.0714	-79.3833	Panama City Tocumen International
PTZ	-1.5053	-78.0628	SHELL MERA/RIO AMAZONAS
PUB	38.2900	-104.4967	Pueblo
PUC	39.6139	-110.7514	PRICE - CARBON COUNTY
PUD	-47.7336	-65.9164	PUERTO DESEADO
PUE	8.6670	-77.4170	Puerto Obaldia
PUF	43.3800	-0.4186	Pau
PUG	-32.5403	137.7167	Port Augusta
PUJ	18.5674	-68.3634	Punta Cana
PUM	-3.6670	119.8000	Kolaka
PUQ	-53.0036	-70.8539	Punta Arenas
PUS	35.1806	128.9381	Busan
PUU	0.5050	-76.5008	Puerto Asis
PUV	-20.2892	164.0994	POUM MALABOU
PUW	46.7439	-117.1096	Pullman
PUY	44.8935	13.9222	Pula
PUZ	14.0462	-83.3877	PUERTO CABEZAS
PVA	13.3569	-81.3583	Providencia Island
PVC	42.0720	-70.2214	Provincetown
PVD	41.7240	-71.4282	Providence
PVE	9.5653	-78.9533	El Porvenir
PVG	31.1417	121.7900	Shanghai Pudong International Apt
PVH	-8.7136	-63.9028	Porto Velho
PVI	-23.0911	-52.4839	PARANAVAI
PVK	38.9261	20.7667	Preveza/Lefkada
PVO	-1.0417	-80.4722	PORTOVIEJO/REALES TAMARINDOS
PVR	20.6800	-105.2542	Puerto Vallarta
PVS	64.3783	-173.2467	PROVIDENIYA BAY
PVU	40.2192	-111.7234	Provo
PWA	35.5342	-97.6471	OKLAHOMA CITY - WILEY POST
PWE	69.7833	170.5950	Pevek
PWK	42.1142	-87.9015	  Chicago/Prospect Heights/Wheeling
PWM	43.6462	-70.3093	Portland
PWQ	52.1950	77.0739	Pavlodar
PXM	15.8769	-97.0891	Puerto Escondido
PXO	33.0708	-16.3497	Porto Santo
PXU	14.0025	108.0242	Pleiku
PYC	8.6170	-79.7330	Playon Chico
PYH	5.6000	-67.6000	Puerto Ayacucho
PYJ	66.4000	112.0333	Polyarny
PYR	37.9253	21.2914	ANDRAVIDA
PYY	19.3667	98.4333	Pai
PZB	-29.6500	30.4000	Pietermaritzburg
PZE	50.1280	-5.5180	  Penzance
PZH	31.3583	69.4639	Zhob
PZI	26.5423	101.7985	Panzhihua
PZO	8.2883	-62.7603	Puerto Ordaz
PZQ	45.4071	-83.8129	PRESQUE ISLE COUNTY AIRPORT
PZU	19.4336	37.2341	Port Sudan
PZY	48.6250	17.8286	PIESTANY
QAK	-21.2642	-43.7628	BARBACENA/MAJ BRIG D.BORGES
QAM	49.8731	2.3869	AMIENS/GLISY
QAQ	42.3806	13.3103	L'AQUILA
QAR	52.0597	5.8722	ARNHEIM/DEELEN
QAS	36.2167	1.3333	ECH CHELIFF
QAU	-20.8967	-48.4808	BEBEDOURO
QBC	52.3875	-126.5958	Bella Coola
QBQ	47.2053	6.0806	BESANCON/LA VEZE
QBX	-3.6781	-40.3364	SOBRAL
QCJ	-22.9361	-48.4669	BOTUCATU
QCU	68.7436	-52.3286	Akunnaaq
QDC	-21.4606	-51.6061	DRACENA
QDU	51.2075	6.7733	XXX
QDV	-23.1811	-46.9431	JUNDIAI
QEF	49.9608	8.6415	EGELSBACH
QFB	48.0100	7.8200	Freiburg Stn. (DE)
QFD	36.5458	2.8761	BOUFARIK/AIR FORCE BASE
QFG	60.6242	-45.9142	Eqalugaarsuit Heliport
QFI	68.1481	-53.1722	Iginniarfik
QFN	60.0036	-44.6536	Narsaq Kujalleq Heliport
QFO	52.0908	0.1319	DUXFORD
QFR	41.6467	13.2989	FROSINONE
QFX	60.9908	-45.4219	Igaliku Heliport
QFZ	49.2146	7.1095	SAARBRUCKEN/TRAIN STATION
QGA	-24.0792	-54.1875	GUAIRA
QGC	-22.5761	-48.7758	LENCOIS PAULISTA
QGP	-8.8558	-36.5297	GARANHUNS
QGQ	67.9406	-53.6228	Attu
QGU	35.3943	136.8695	GIFU
QGY	47.6246	17.8138	GYOER-PER
QGZ	28.0296	-17.2146	LA GOMERA
QHB	-22.7100	-47.6189	PIRACICABA
QHP	-23.0389	-45.5161	TAUBATE/MIL AD
QIE	43.5225	4.9242	ISTRES/LE TUBE
QIG	-6.3475	-39.2983	IGUATU
QIT	-15.2433	-40.2756	ITAPETINGA
QJB	27.0390	49.4051	JUBAIL/NAVAL BASE
QJE	68.8567	-53.1250	Kitsissuarsuit
QJH	60.7792	-47.1525	Qassumiut Heliport
QJI	68.6322	-51.8336	Ikamiut
QJY	54.1866	15.5572	Kolobrzeg Bus (PL)
QJZ	47.1667	-1.6167	Nantes Rail (FR)
QKC	35.7797	50.8228	KARAJ-PAYAM
QKL	50.8659	7.1427	COLOGNE/TRAIN STATION
QLA	51.1883	-1.0300	LASHAM
QLF	61.1442	25.6931	LAHTI-VESIVEHMAA
QLR	39.8284	-8.8874	MONTE REAL-AIR BASE NR 5
QLT	41.5456	12.9092	LATINA
QLU	51.4230	16.1962	LUBIN
QLY	41.6667	12.4667	PRATICA DI MARE
QMJ	32.0022	49.2686	MASJED SOLEIMAN
QMK	68.2483	-52.8800	Niaqornaarsuk
QNS	-29.9467	-51.1450	PORTO ALEGRE/CANOAS
QNX	46.2958	4.7958	MACON/CHARNAY
QOE	50.8283	6.6582	NOERVENICH
QOJ	-28.5025	-56.0322	SAO BORJA
QOQ	60.5378	-46.0247	Saarloq Heliport
QOW	5.4271	7.2060	Owerri
QPA	45.3953	11.8483	PADOVA
QPG	1.3606	103.9094	SINGAPORE PAYA LEBAR
QPJ	45.9892	18.2421	PECS/POGANY
QPM	50.5291	18.0852	OPOLE/KAMIEN SLASKI
QPS	-21.9850	-47.3350	PIRACUNUNGA/CAMPO FONTENELLE
QPW	68.3067	-53.4717	Kangaatsiaq
QPZ	44.9138	9.7205	PIACENZA
QQC	32.6200	51.6903	ESFAHAN/BADR AFB
QQK	20.2461	0.9808	TESSALIT
QQO	38.0694	23.5542	ELEFSIS AB
QQQ	65.8753	20.1500	VIDSEL
QRA	-26.2414	28.1517	JOHANNESBURG/RAND
QRC	-34.1667	-70.7833	RANCAGUA/DE LA INDEPENDENCIA
QRE	-28.3208	-52.8150	CARAZINHO
QRM	-32.2194	148.2314	NARROMINE
QRO	20.6174	-100.1857	Queretaro
QRW	5.5961	5.8178	Warri
QRY	68.1500	-53.4500	Ikerasaarsuk
QRZ	-22.4781	-44.4811	RESENDE
QSA	41.5209	2.1050	SABADELL
QSC	-21.8750	-47.9028	SAO CARLOS/FRANCISCO P.LOPES
QSF	36.1781	5.3245	Setif
QSJ	-21.0858	-44.2258	SAO JOAO DEL REI
QSR	40.6211	14.9133	SALERNO PONTECAGNANO
QTK	51.3644	14.9519	ROTHENBURG/OBERLAUSITZ
QTL	-19.7247	-42.1106	CARATINGA/UBAPORANGA
QUB	26.5675	12.8231	Ubari
QUO	5.0507	7.9344	Uyo
QUP	70.0167	-51.9333	Saqqaq
QUS	12.1833	6.7000	GUSAU
QUT	36.5132	139.8656	UTSUNOMIYA
QUV	60.1519	-44.2881	Aappilattoq Nanortalik Heliport
QUW	60.5969	-45.3839	Ammassivik Heliport
QVB	-26.2317	-51.0689	UNIAO DA VITORIA
QVP	-23.0925	-48.9836	AVARE/ARANDU
QWU	49.8011	9.9375	Wuerzburg Stn. DE
QXB	43.5017	5.3708	AIX-LES MILLES
QXG	47.4800	-0.6000	Angers Rail (FR)
QXW	-21.4311	-45.9325	ALFENAS
QYR	48.3217	4.0167	TROYES/BARBEREY
QYS	30.6969	51.5500	YASOUJ
QYX	59.9008	17.5958	UPPSALA
QZD	46.2486	20.0907	SZEGED
RAB	-4.3405	152.3797	Rabaul
RAE	30.9066	41.1383	Arar
RAH	29.6263	43.4907	Rafha
RAI	14.9411	-23.4847	Praia
RAJ	22.3095	70.7794	Rajkot
RAK	31.6086	-8.0408	Marrakech
RAL	33.9517	-117.4450	RIVERSIDE MUN
RAO	-21.1364	-47.7767	Ribeirao Preto
RAP	44.0453	-103.0575	Rapid City Regional Apt
RAR	-21.2006	-159.7906	Rarotonga Island
RAS	37.3233	49.6178	Rasht
RAT	62.1583	77.3300	RADUZHNY
RBA	34.0475	-6.7483	Rabat
RBB	-4.4083	-59.5972	BORBA
RBH	58.5500	-155.8000	Brooks Lodge
RBL	40.1506	-122.2523	RED BLUFF MUNI
RBM	48.9010	12.5182	STRAUBING
RBQ	-14.4275	-67.4981	Rurrenabaque
RBR	-9.8689	-67.8981	Rio Branco
RBV	-8.1500	157.6370	Ramata Island
RBX	6.8400	29.6500	Rumbek
RBY	64.7272	-155.4699	Ruby
RCA	44.1450	-103.1034	ELLSWORTH AFB/RAPID CITY
RCB	-28.7402	32.0934	Richards Bay
RCE	48.6123	-123.1385	Roche Harbor
RCH	11.5236	-72.9272	Riohacha
RCL	-15.4720	167.8350	  Redcliffe
RCM	-20.7036	143.1136	Richmond
RCO	45.8894	-0.9825	ROCHEFORT/ST. AGNANT
RCP	57.0800	-157.8000	Cinder River
RCQ	-29.2117	-59.6917	Reconquista
RCU	-33.0867	-64.2617	RIO CUARTO
RCY	23.6844	-74.8361	Rum Cay
RDC	-8.0302	-49.9800	Redencao Airport
RDD	40.5090	-122.2934	Redding
RDG	40.3785	-75.9652	CARL A SPAATZ FLD/READING
RDM	44.2541	-121.1500	Redmond
RDN	4.2167	101.9667	Redang Island
RDR	47.9611	-97.4011	GRAND FORKS AFB
RDU	35.8777	-78.7875	Raleigh/Durham
RDV	61.7881	-157.3503	Red Devil
RDZ	44.4075	2.4833	Rodez
REA	-18.4633	-136.4431	Reao
REB	53.3086	12.7536	RECHLIN-LAERZ
REC	-8.1225	-34.9203	Recife
REG	38.0731	15.6544	Reggio di Calabria
REL	-43.2106	-65.2703	Trelew
REN	51.7969	55.4583	Orenburg
REO	42.5777	-117.8854	ROME STATE
REP	13.4197	103.8128	Siem Reap
RES	-27.4500	-59.0561	Resistencia
RET	67.5278	12.1033	Rost
REU	41.1474	1.1672	Reus
REX	26.0083	-98.2283	Reynosa
REZ	-22.4785	-44.4803	  Resende
RFD	42.1954	-89.0972	Chicago Rockford Airport
RFP	-16.7231	-151.4669	Raiatea Island
RGA	-53.7775	-67.7500	Rio Grande
RGI	-14.9553	-147.6578	Rangiroa Island
RGK	51.9700	85.8369	Gorno-Altaysk
RGL	-51.6089	-69.3128	Rio Gallegos
RGN	16.9069	96.1343	Yangon
RGS	42.3500	-3.6200	Burgos
RGT	-0.3517	102.3344	RENGAT/JAPURA
RHD	-27.4500	-64.8830	Rio Hondo
RHE	49.3103	4.0508	REIMS/CHAMPAGNE
RHI	45.6312	-89.4675	Rhinelander
RHO	36.4053	28.0861	Rhodes
RIA	-29.7108	-53.6922	Santa Maria
RIB	-11.0170	-66.1170	Riberalta
RIC	37.5052	-77.3197	Richmond
RIG	-32.0819	-52.1631	Rio Grande
RIJ	-6.0500	-77.1500	RIOJA
RIN	-8.1264	157.1425	  Ringi Cove
RIS	45.2420	141.1876	RISHIRI
RIV	33.8800	-117.2600	MARCH AFB/RIVERSIDE
RIW	43.0642	-108.4598	Riverton
RIX	56.9237	23.9712	Riga
RIY	14.6622	49.3750	Mukalla
RJA	17.1083	81.8211	Rajahmundry
RJH	24.4387	88.6163	Rajshahi
RJK	45.2169	14.5703	Rijeka
RJL	42.4605	-2.3205	Logrono
RJN	30.2975	56.0508	RAFSANJAN
RKA	-15.4833	-145.4600	Aratika
RKD	44.0601	-69.0992	Rockland
RKE	55.5856	12.1314	COPENHAGEN ROSKILDE
RKS	41.5942	-109.0652	Rock Springs
RKT	25.6133	55.9389	RAS AL KHAIMAH INTL
RKV	64.1300	-21.9406	Reykjavik Apt
RKZ	29.3517	89.3068	Xigaze/Rikaze
RLA	38.1274	-91.7695	ROLLA/VICHY
RLG	53.9181	12.2783	Rostock
RLK	40.8539	107.4278	Bayannur
RLR	-22.5500	45.4000	Ranohira
RMA	-26.5467	148.7736	Roma
RME	43.2338	-75.4070	GRIFFISS AIRPARK AIRPORT
RMF	25.5572	34.5836	Marsa Alam
RMG	34.3506	-85.1580	ROME - RICHARD B. RUSSELL
RMI	44.0194	12.6094	Rimini
RMK	-34.1967	140.6733	RENMARK
RML	6.8231	79.8850	RATMALANA/COLOMBO
RMP	65.5079	-150.1408	Rampart
RMQ	24.2647	120.6206	Taichung
RMS	49.4367	7.6000	RAMSTEIN AB
RMT	-22.6400	-152.8100	Rimatara
RNA	-9.8530	161.9700	Arona
RNB	56.2667	15.2650	Ronneby/Karlskrona
RND	29.5297	-98.2787	RANDOLPH AFB
RNE	46.0528	3.9997	ROANNE/RENAISON
RNJ	27.0440	128.4016	YORON
RNL	-11.5339	160.0633	Rennell Island
RNM	33.0392	-116.9152	RAMONA
RNN	55.0633	14.7596	Bornholm
RNO	39.4991	-119.7681	Reno
RNP	11.1572	166.8872	  Rongelap Island
RNS	48.0719	-1.7322	Rennes St Jacques Airport
RNT	47.4933	-122.2150	RENTON MUN
ROA	37.3255	-79.9754	Roanoke
ROB	6.2404	-10.3599	Monrovia Roberts International Apt
ROC	43.1189	-77.6724	Rochester
ROI	16.1167	103.7739	Roi Et
ROK	-23.3817	150.4764	Rockhampton
RON	-24.5122	-54.0533	MARECHAL CANDIDO RONDON
ROO	-16.4458	-54.6639	Rondonopolis
ROP	14.1743	145.2425	Rota
ROR	7.3673	134.5443	Koror
ROS	-32.9036	-60.7844	Rosario
ROT	-38.1092	176.3172	Rotorua
ROV	47.2583	39.8200	Rostov
ROW	33.3016	-104.5306	Roswell
RPM	-14.7228	134.7475	NGUKURR
RPN	32.9800	35.5733	ROSH-PINA/ MAHANAIM-I.BEN-YAA
RPR	21.1803	81.7403	Raipur
RQE	35.6521	-109.0674	WINDOW ROCK
RRG	-19.7578	63.3619	Rodrigues Island
RRK	22.2611	84.8097	ROURKELA
RRR	-16.0510	-142.4770	Raroia
RRS	62.5790	11.3450	Roros
RSA	-36.5914	-64.2786	Santa Rosa
RSD	24.8917	-76.1777	Rock Sound
RSH	61.7749	-161.3194	Russian Mission
RSJ	48.6457	-122.8680	Rosario
RSL	38.8721	-98.8118	RUSSELL MUNI
RST	43.9083	-92.5000	Rochester Municipal Apt
RSU	34.8422	127.6172	Yeosu/Suncheon
RSW	26.5362	-81.7552	Fort Myers SW Florida International Apt
RTA	-12.4828	177.0711	Rotuma Island
RTB	16.3183	-86.5219	Roatan
RTM	51.9569	4.4372	Rotterdam Apt
RTW	51.5650	46.0467	Saratov
RUA	3.0500	30.9167	Arua
RUC	-25.4025	-49.2339	CURITIBA/BACACHERI PR
RUD	36.4167	54.9667	Shahrood
RUE	0.1500	29.2833	Butembo
RUH	24.9626	46.7080	Riyadh
RUI	33.4629	-105.5348	  Ruidoso
RUK	28.6270	82.1950	  Rukumkot
RUM	27.3035	86.5504	  Rumjatar
RUN	-20.8900	55.5164	St-Denis
RUP	26.1397	89.9100	Rupsi
RUR	-22.4308	-151.3678	Rurutu
RUS	-9.8667	160.8333	Marau
RUT	43.5299	-72.9496	Rutland
RVA	-22.8053	47.8206	  Farafangana
RVD	-17.8342	-50.9556	Rio Verde
RVE	6.9519	-71.8572	Saravena
RVK	64.8500	11.2330	Rorvik
RVN	66.5617	25.8308	Rovaniemi
RVS	36.0396	-95.9846	TULSA - RICHARD LLOYD JONES JR
RVT	-33.7800	120.2000	Ravensthorpe
RVV	-23.8839	-147.6644	Raivavae
RVY	-30.9694	-55.4733	RIVERA
RWF	44.5472	-95.0823	REDWOOD FALLS MUNI
RWI	35.8563	-77.8919	ROCKY MOUNT - WILSON REGIONAL
RWL	41.8056	-107.1999	RAWLINS/HARVEY FIELD
RWN	50.6017	26.1467	RIVNE
RXS	11.5977	122.7529	Roxas
RYD	-33.7317	-65.3867	VILLA REYNOLDS
RYG	59.3788	10.7855	Oslo Moss-Rygge Airport
RYK	28.3856	70.2798	Rahim Yar Khan
RZA	-50.0222	-68.5781	SANTA CRUZ
RZE	50.1100	22.0190	Rzeszow
RZP	10.8167	119.5167	CLR Airport
RZR	36.9092	50.6800	Ramsar
RZS	33.6403	73.8569	Sawan
SAB	17.6450	-63.2200	Saba
SAC	38.5125	-121.4935	SACRAMENTO EXECUTIVE
SAD	32.8533	-109.6350	SAFFORD REGIONAL
SAE	70.8117	-51.6333	Saatut
SAF	35.6171	-106.0894	Santa Fe
SAH	15.4792	44.2197	Sanaa
SAK	65.7317	-19.5728	SAUDARKROKUR/ALEXANDER
SAL	13.4409	-89.0558	San Salvador
SAN	32.7336	-117.1897	San Diego International
SAP	15.4526	-87.9236	San Pedro Sula
SAQ	25.0538	-78.0490	  San Andros
SAR	38.1489	-89.6987	SPARTA COMMUNITY - HUNTER FLD
SAT	29.5337	-98.4698	San Antonio International Apt
SAV	32.1277	-81.2021	Savannah/Hilton Head International Apt
SAW	40.8983	29.3092	Istanbul Sabiha Gokcen Apt
SAX	8.0170	-78.2000	Sambu
SAY	43.2597	11.2558	SIENA/AMPUGNANO
SBA	34.4250	-119.8400	Santa Barbara Municipal Apt
SBD	34.0956	-117.2344	SAN BERNARDINO INTL
SBH	17.9044	-62.8436	St Barthelemy
SBI	12.5727	-13.3585	KOUNDARA
SBJ	-18.7203	-39.8325	SAO MATEUS
SBK	48.5375	-2.8567	SAINT BRIEUC/ARMOR
SBL	-13.7625	-65.4347	SANTA ANA DEL YACUMA
SBN	41.7086	-86.3172	South Bend
SBP	35.2368	-120.6418	San Luis Obispo County Apt
SBQ	29.5747	67.8431	SIBI
SBR	-9.3783	142.6250	  Saibai Island
SBU	-29.6894	17.9389	SPRINGBOK
SBW	2.2647	111.9767	Sibu
SBY	38.3400	-75.5100	Salisbury-Ocean City
SBZ	45.7867	24.0917	Sibiu
SCC	70.1948	-148.4652	Prudhoe Bay/Deadhorse
SCE	40.8493	-77.8487	State College
SCH	42.8533	-73.9322	SCHENECTADY
SCI	7.8013	-72.2028	San Cristobal
SCK	37.8942	-121.2383	Sacramento Stockton Airport
SCL	-33.3944	-70.7938	Santiago Arturo Merino Benitez
SCM	61.8453	-165.5713	Scammon Bay
SCN	49.2146	7.1095	Saarbruecken Airport
SCO	43.8600	51.0919	Aktau
SCQ	42.8963	-8.4151	Santiago de Compostela
SCS	60.4328	-1.2961	SCATSTA
SCT	12.6307	53.9058	Socotra
SCU	19.9700	-75.8356	Santiago de Cuba
SCV	47.6950	26.3517	SUCEAVA/STEFAN CEL MARE
SCW	61.6467	50.8450	Syktyvkar
SCX	16.2126	-95.2016	  Salina Cruz
SCY	-0.9103	-89.6175	San Cristobal Island
SCZ	-10.7203	165.7950	Santa Cruz Island
SDA	33.2625	44.2346	BAGHDAD INTL
SDB	-32.9688	18.1653	LANGEBAANWEG
SDD	-14.9243	13.5716	Lubango
SDE	-27.7556	-64.2997	Santiago Del Estero
SDF	38.1744	-85.7360	Louisville International
SDG	35.2508	47.0111	Sanandaj
SDJ	38.1397	140.9169	Sendai
SDK	5.9017	118.0486	Sandakan
SDL	62.5294	17.4428	Sundsvall/Harnosand
SDM	32.5723	-116.9802	SAN DIEGO/BROWN FIELD
SDN	61.8300	6.1058	Sandane
SDP	55.3137	-160.5214	Sand Point
SDQ	18.4298	-69.6690	Santo Domingo Las Americas Intl
SDR	43.4271	-3.8200	Santander
SDT	34.8078	72.3589	SAIDU SHARIF
SDU	-22.9103	-43.1628	Rio de Janeiro Santos Dumont Apt
SDV	32.1158	34.7822	Tel Aviv-Yafo Sde Dov
SDY	47.7069	-104.1926	Sidney
SEA	47.4490	-122.3093	Seattle/Tacoma International Apt
SEB	27.0097	14.4306	Sebha
SEN	51.5714	0.6956	London Southend Apt
SEU	-2.4581	34.8225	Seronera
SEY	15.1797	-12.2073	  Selibaby
SEZ	-4.6743	55.5218	Mahe Island
SFA	34.7206	10.6886	Sfax
SFB	28.7776	-81.2375	Orlando Sanford International Airport
SFD	7.8833	-67.4333	SAN FERNANDO DE APURE
SFE	16.5958	120.3014	SAN FERNANDO
SFF	47.6828	-117.3226	SPOKANE/FELTS FIELD
SFG	18.0500	-63.1170	St Martin
SFH	30.9314	-114.8089	SAN FELIPE
SFJ	67.0170	-50.6893	Kangerlussuaq
SFK	-0.7000	-48.5194	SOURE
SFL	14.8850	-24.4800	Sao Filipe
SFN	-31.7117	-60.8067	Santa Fe
SFO	37.6189	-122.3749	San Francisco International Apt
SFQ	37.0950	38.8494	SANLIURFA
SFS	14.7944	120.2714	SUBIC BAY/OLONGAPO
SFT	64.6247	21.0769	Skelleftea
SGC	61.3433	73.4033	Surgut
SGD	54.9644	9.7917	Sonderborg Airport
SGE	50.7077	8.0830	SIEGERLAND
SGF	37.2443	-93.3886	Springfield
SGG	65.9039	-36.3744	Sermiligaaq
SGK	-5.0830	144.7670	  Sangapi
SGN	10.8206	106.6608	Ho Chi Minh City
SGO	-28.0528	148.5933	St George
SGS	5.0470	119.7430	Sanga Sanga
SGU	37.0906	-113.5931	St George
SGV	-41.5919	-65.3494	SIERRA GRANDE
SGX	-10.6833	35.5833	Songea
SGY	59.4600	-135.3157	Skagway
SGZ	7.1857	100.6088	SONGKHLA
SHA	31.2000	121.3333	Shanghai Hongqiao International Apt
SHB	43.5775	144.9598	Nakashibetsu
SHC	14.0781	38.2725	Inda Selassie
SHD	38.2638	-78.8964	Staunton
SHE	41.6383	123.4850	Shenyang
SHG	66.8881	-157.1624	Shungnak
SHH	66.2496	-166.0893	Shishmaref
SHI	24.8272	125.1441	SHIMOJISHIMA
SHJ	25.3292	55.5161	Sharjah
SHL	25.7042	91.9780	Shillong
SHM	33.6623	135.3645	Shirahama
SHN	47.2336	-123.1476	SHELTON - SANDERSON FIELD
SHO	38.1475	128.6006	SOKCHO
SHP	39.9681	119.7311	Qinhuangdao
SHR	44.7692	-106.9803	Sheridan
SHT	-36.4283	145.3933	SHEPPARTON
SHV	32.4466	-93.8256	Shreveport Regional Apt
SHW	17.4669	47.1214	Sharurah
SHX	62.6923	-159.5692	Shageluk
SHY	-3.6000	33.5000	SHINYANGA/IBADAKULI
SIA	34.3767	109.1200	Xi'an Xiguan Apt
SIC	8.2610	-79.0770	San Jose Island
SID	16.7414	-22.9494	Sal Island
SIF	27.1595	84.9801	SIMARA
SIG	18.4568	-66.0981	  San Juan
SIN	1.3592	103.9894	Singapore Changi Apt
SIO	-40.8367	145.0825	SMITHTON
SIP	45.0386	33.9831	Simferopol
SIQ	-0.4786	104.5775	SINGKEP
SIR	46.2192	7.3269	SION
SIS	-27.6500	23.0000	Sishen
SIT	57.0472	-135.3617	Sitka
SJA	-15.3500	-75.1500	SAN JUAN DE MARCONA
SJC	37.3627	-121.9291	San Jose Norman Y. Mineta Intl
SJD	23.1521	-109.7207	San Jose Cabo
SJE	2.5786	-72.6394	San Jose del Guaviare
SJI	12.3597	121.0450	San Jose
SJJ	43.8246	18.3315	Sarajevo
SJK	-23.2278	-45.8694	Sao Jose Dos Campos
SJL	-0.1481	-66.9850	Sao Gabriel
SJN	34.5186	-109.3788	ST JOHNS INDUSTRIAL AIR PARK
SJO	9.9939	-84.2089	San Jose Juan Santamaria Apt
SJP	-20.8161	-49.4047	Sao Jose Do Rio Preto
SJT	31.3577	-100.4963	San Angelo Mathis Field
SJU	18.4393	-66.0018	San Juan Luis Munoz Marin Intl Apt
SJW	38.2783	114.6983	Shijiazhuang
SJY	62.6936	22.8319	SEINAJOKI
SJZ	38.6655	-28.1758	Sao Jorge Island
SKA	47.6151	-117.6558	FAIRCHILD AFB
SKB	17.3111	-62.7186	St Kitts
SKC	-8.0330	141.7170	  Suki
SKD	39.7000	66.9850	Samarkand
SKE	59.1850	9.5672	Skien
SKF	29.3842	-98.5811	LACKLAND AFB (KELLY FLD ANNEX)
SKG	40.5194	22.9736	Thessaloniki
SKH	28.5860	81.6360	  Surkhet
SKK	64.3711	-161.2240	Shaktoolik
SKN	68.5808	15.0261	Stokmarknes
SKO	12.9158	5.2069	Sokoto
SKP	41.9616	21.6214	Skopje
SKS	55.2256	9.2639	VOJENS/SKRYDSTRUP
SKT	32.5170	74.5170	Sialkot
SKU	38.9683	24.4881	Skyros
SKV	28.6853	34.0625	ST.CATHERINE
SKX	54.1667	45.1667	Saransk
SKZ	27.7220	68.7914	Sukkur
SLA	-24.8600	-65.4767	Salta
SLC	40.7884	-111.9778	Salt Lake City
SLD	48.6381	19.1342	SLIAC
SLE	44.9095	-123.0025	SALEM - MCNARY FIELD
SLH	-13.8517	167.5369	Sola
SLI	-12.1667	26.3667	Solwezi
SLK	44.3853	-74.2062	Saranac Lake
SLL	17.0387	54.0913	Salalah
SLM	40.9521	-5.5020	Salamanca
SLN	38.7910	-97.6522	Salina
SLO	38.6429	-88.9642	SALEM-LECKRONE AIRPORT
SLP	22.2543	-100.9308	San Luis Potosi
SLQ	61.7005	-157.1659	Sleetmute
SLU	14.0200	-60.9931	St Lucia George F.L. Charles Apt
SLV	31.0778	77.0728	SHIMLA
SLW	25.5498	-100.9284	Saltillo
SLX	21.3330	-71.2000	Salt Cay
SLY	66.5900	66.6100	Salekhard
SLZ	-2.5869	-44.2361	Sao Luiz
SMA	36.9739	-25.1711	Santa Maria Island
SMB	-52.7500	-69.3500	CERRO SOMBRERO/FRANCO BIANCO
SME	37.0536	-84.6156	  Somerset
SMF	38.6954	-121.5908	Sacramento International Apt
SMI	37.6903	26.9128	Samos
SMK	63.4901	-162.1104	St Michael
SML	23.5814	-75.2705	Stella Maris
SMN	45.1238	-113.8813	SALMON - LEMHI COUNTY
SMO	34.0158	-118.4512	SANTA MONICA MUNI
SMQ	-2.4992	112.9750	Sampit
SMR	11.1197	-74.2308	Santa Marta
SMS	-17.0833	49.8167	Ste Marie
SMV	46.5344	9.8839	SAMEDAN
SMX	34.8989	-120.4574	Santa Maria
SNA	33.6756	-117.8682	Santa Ana John Wayne Apt
SNB	-11.4197	130.6472	SNAKE BAY
SNC	-2.2078	-80.9858	Salinas
SNDT	-18.2333	-43.6511	Diamantina (SNDT)
SNE	16.5881	-24.2839	Sao Nicolau Island
SNF	10.2833	-68.7333	SAN FELIPE
SNG	-16.3836	-60.9628	SAN IGNACIO DE VELASCO
SNH	-28.6200	151.9900	STANTHORPE
SNN	52.7020	-8.9248	Shannon
SNO	17.1953	104.1186	Sakon Nakhon
SNP	57.1673	-170.2204	St Paul Island
SNR	47.3106	-2.1567	St-Nazaire
SNS	36.6628	-121.6064	SALINAS MUNI AIRPORT
SNU	22.4922	-79.9436	Santa Clara
SNV	4.5547	-61.1447	Santa Elena de Uairen
SNW	18.4576	94.2978	Thandwe
SNY	41.1013	-102.9853	SIDNEY MUNI/LLOYD W. CARR FLD
SNZ	-22.9283	-43.7217	RIO DE JANEIRO/SANTA CRUZ
SOB	46.6863	17.1590	Balaton
SOC	-7.5181	110.7550	Surakarta (Solo)
SOD	-23.4825	-47.4858	SOROCABA
SOF	42.6950	23.4083	Sofia
SOG	61.1561	7.1378	Sogndal
SOJ	69.7901	20.9549	Sorkjosen
SOM	8.9451	-64.1511	San Tome
SON	-15.5058	167.2214	Espiritu Santo
SOO	61.2614	17.0983	SODERHAMN
SOP	35.2374	-79.3912	PINEHURST S.P.MOORE COUNTY
SOQ	-0.9256	131.1217	Sorong
SOT	67.3967	26.6181	SODANKYLA
SOU	50.9503	-1.3568	Southampton
SOV	59.4424	-151.7041	Seldovia
SOW	34.2655	-110.0057	Show Low
SOX	5.6756	-72.9705	SOGAMOSO/A. LLERAS CAMARGO
SOY	59.1581	-2.6414	Stronsay
SOZ	41.9264	9.4053	SOLENZARA
SPB	18.3386	-64.9407	St Thomas Charlotte Amalie SPB
SPC	28.6265	-17.7556	Santa Cruz de la Palma
SPD	25.7604	88.9085	Saidpur
SPI	39.8440	-89.6778	Springfield
SPK	42.7944	141.6664	CHITOSE
SPM	49.9765	6.6987	SPANGDAHLEM
SPN	15.1190	145.7294	Saipan
SPP	-14.6500	17.6833	Menongue
SPR	17.9139	-87.9711	San Pedro
SPS	33.9888	-98.4919	Wichita Falls Sheppard AFB
SPU	43.5389	16.2980	Split
SQG	0.0636	111.4734	Sintang
SQH	21.2146	104.0352	NASAN
SQO	64.9608	17.6967	STORUMAN
SQQ	55.8939	23.3950	SIAULIAI
SQS	17.1859	-89.0097	San Ignacia
SQZ	53.3078	-0.5508	SCAMPTON
SRA	-27.9067	-54.5204	  Santa Rosa
SRC	-32.3844	-65.1858	SAN LUIS/VALLE DEL CONLARA
SRE	-19.0108	-65.2928	Sucre
SRG	-6.9764	110.3772	Semarang
SRH	9.1511	18.3794	SARH
SRI	-0.5000	117.1500	Samarinda
SRJ	-14.8670	-66.7500	  San Borja
SRK	77.7833	-70.7667	Siorapaluk
SRM	56.3183	43.7950	NIZHNY NOVGOROD/SORMOVO
SRN	-42.1575	145.2897	STRAHAN
SRP	59.7928	5.3397	Stord
SRQ	27.3954	-82.5543	Sarasota/Bradenton
SRT	1.7223	33.6187	SOROTI
SRV	61.7897	-156.5885	Stony River
SRX	31.0617	16.5917	Sirte
SRY	36.6358	53.1936	Sari
SRZ	-17.8006	-63.1772	Santa Cruz El Trompillo Apt
SSA	-12.9086	-38.3225	Salvador
SSB	17.7472	-64.7049	St Croix SPB
SSC	33.9728	-80.4706	SHAW AFB
SSE	17.6280	75.9348	  Sholapur
SSG	3.7553	8.7087	Malabo
SSH	27.9786	34.3933	Sharm el-Sheikh
SSI	31.1518	-81.3913	BRUNSWICK/MC KINNON
SSJ	65.9597	12.4722	Sandnessjoen
SSN	37.4456	127.1131	SEOUL DOMESTIC
SSO	-22.0911	-45.0467	SAO LOURENCO
SSR	-15.4708	168.1522	Sara
SST	-36.5500	-56.6833	SANTA TERESITA
SSX	41.2700	36.3000	Samsun
SSY	-6.2699	14.2470	M'banza Congo
SSZ	-23.9275	-46.2992	GUARUJA/BASE AEREA
STA	55.9901	8.3539	STAUNING
STC	45.5466	-94.0599	St Cloud Municipal Apt
STD	7.5683	-72.0283	Santo Domingo
STG	56.5774	-169.6637	St George Island
STI	19.4088	-70.6169	Santiago
STJ	39.7719	-94.9097	ST JOSEPH - ROSECRANS MEMORIAL
STL	38.7487	-90.3700	St Louis Lambert Intl Apt
STM	-2.4247	-54.7858	Santarem
STN	51.8850	0.2350	London Stansted Apt
STP	44.9344	-93.0600	ST. PAUL/DOWNTOWN HOLMAN FIELD
STR	48.6899	9.2220	Stuttgart Airport
STS	38.5090	-122.8129	Santa Rosa
STT	18.3373	-64.9733	St Thomas Cyril E King Apt
STV	21.1141	72.7418	Surat
STW	45.1083	42.1133	Stavropol
STX	17.7018	-64.7985	St Croix Henry E. Rohlsen Apt
STY	-31.4347	-57.9842	SALTO/INTL
STZ	-10.3002	-50.4500	Confresa Airport
SUB	-7.3806	112.7861	Surabaya
SUF	38.9083	16.2417	Lamezia Terme
SUG	9.7819	125.4917	Surigao
SUJ	47.7034	22.8856	Satu Mare
SUK	37.4500	129.1330	Sakkyryr
SUL	28.6451	69.1769	  Sui
SUN	43.5044	-114.2962	HAILEY - FRIEDMAN MEMORIAL
SUR	52.7086	-88.5419	Summer Beaver
SUS	38.6617	-90.6511	ST. LOUIS/SPIRIT OF ST LOUIS
SUU	38.2633	-121.9250	FAIRFIELD/TRAVIS AFB
SUV	-18.0447	178.5631	Suva
SUX	42.4026	-96.3844	Sioux City
SVA	63.6864	-170.4926	Savoonga
SVB	-14.2786	50.1747	Sambava
SVC	32.6365	-108.1564	Silver City
SVD	13.1444	-61.2108	St Vincent
SVF	8.0167	2.4500	SAVE
SVG	58.8768	5.6378	Stavanger
SVI	2.1500	-74.7667	San Vicente del Caguan
SVJ	68.2433	14.6692	Svolvaer
SVK	16.7330	-88.3330	Silver Creek
SVL	61.9428	28.9450	Savonlinna
SVN	32.0100	-81.1457	HUNTER AAF AIRPORT/SAVANNAH
SVO	55.9717	37.4150	Moscow Sheremetyevo International Apt
SVP	-12.4046	16.9474	Kuito
SVQ	37.4179	-5.8989	Sevilla
SVR	76.0208	-65.0833	Savissivik
SVS	66.0171	-149.0544	Stevens Village
SVU	-16.8028	179.3406	Savusavu
SVX	56.7433	60.8050	Yekaterinburg
SVZ	7.8667	-72.4500	San Antonio Tachira
SWA	23.4397	116.7697	Shantou
SWE	-6.2830	147.5670	  Siwea
SWF	41.5041	-74.1048	Newburgh
SWH	-35.3772	143.5322	SWAN HILL
SWJ	-16.4950	167.4380	South West Bay
SWOB	-2.5336	-66.0672	Fonte Boa (SWOB)
SWP	-22.6583	14.5667	SWAKOPMUND
SWS	51.6053	-4.0678	SWANSEA
SWTP	-0.4169	-65.0338	Tapuruquara/Santa Isabel do Rio Negro (SWTP)
SWX	-18.3667	21.8167	SHAKAWE
SWY	4.2167	100.7000	SITIAWAN
SXB	48.5419	7.6344	Strasbourg
SXE	-38.0983	147.1500	EAST SALE
SXF	52.3785	13.5206	Berlin Schoenefeld Apt
SXI	25.9083	54.5417	Sirri Island
SXK	-7.9886	131.3061	Saumlaki
SXL	54.2802	-8.5992	SLIGO
SXM	18.0408	-63.1095	St Maarten
SXN	-20.5500	26.1000	SUA PAN
SXO	-12.1569	-52.2719	SAO FELIX DO ARAGUAIA/RONCADOR
SXP	62.5206	-164.8478	Sheldon Point
SXR	33.9833	74.7833	Srinagar
SXV	11.7833	78.0656	  Salem
SXX	-6.6400	-51.9894	SAO FELIX DO XINGU
SXZ	37.9781	41.8392	SIIRT
SYA	52.7123	174.1137	SHEMYA/EARECKSON AFS
SYB	58.1667	-152.5000	Seal Bay
SYD	-33.9467	151.1767	Sydney Kingsford Smith Apt
SYJ	29.5511	55.6717	SIRJAN
SYM	22.7933	100.9594	Simao
SYO	38.8123	139.7872	Shonai
SYQ	9.9572	-84.1428	San Jose Tobias Bolanos Apt
SYR	43.1112	-76.1063	Syracuse
SYT	46.4064	4.0211	SAINT-YAN
SYU	-10.2075	142.8239	  Warraber Island
SYW	26.4733	67.7172	SEHWAN SHARIF
SYX	18.3017	109.4133	Sanya
SYY	58.2139	-6.3308	Stornoway
SYZ	29.5403	52.5886	Shiraz
SZA	-6.1411	12.3718	Soyo
SZB	3.1311	101.5481	Kuala Lumpur Sultan Abdul Aziz Shah Apt
SZD	53.3943	-1.3885	SHEFFIELD CITY
SZE	11.7889	40.9902	Semera
SZF	41.2656	36.5486	Carsamba
SZG	47.7944	13.0033	Salzburg W A Mozart
SZI	47.4865	84.8874	Zaysan
SZJ	21.6333	-82.9500	ISLA DE JUVENTUD/SIGUANEA
SZK	-24.9667	31.6000	SKUKUZA
SZT	16.6904	-92.5303	SAN CRISTOBAL DE LAS CASAS
SZW	53.4269	11.7833	SCHWERIN-PARCHIM
SZX	22.6383	113.8117	Shenzhen
SZY	53.4819	20.9377	SZYMANY SZCZYTNO
SZZ	53.5847	14.9022	Szczecin
TAB	11.1497	-60.8322	Tobago
TAC	11.2276	125.0278	Tacloban
TAE	35.8939	128.6589	Daegu
TAG	9.6656	123.8522	Tagbilaran
TAH	-19.4550	169.2233	Tanna
TAI	13.6861	44.1389	Taizz
TAJ	-3.1830	142.4170	  Aitape
TAK	34.2141	134.0158	Takamatsu
TAL	65.1743	-152.1093	Tanana
TAM	22.2898	-97.8644	Tampico
TAO	36.2650	120.3750	Qingdao
TAP	14.7944	-92.3700	Tapachula
TAR	40.5183	17.4006	TARANTO/GROTTAGLIE
TAS	41.2573	69.2817	Tashkent
TAT	49.0736	20.2411	POPRAD/TATRY
TAY	58.3075	26.6906	Tartu
TAZ	41.7611	59.8267	DASHOGUZ
TBB	13.0391	109.3345	Tuyhoa
TBG	-5.2786	141.2258	Tabubil
TBH	12.3106	122.0747	Tablas
TBI	24.3000	-75.4500	The Bight
TBJ	36.9800	8.8769	TABARKA
TBN	37.7416	-92.1407	Fort Leonard Wood
TBO	-5.0833	32.8333	Tabora
TBP	-3.5494	-80.3781	Tumbes
TBS	41.6692	44.9547	Tbilisi
TBT	-4.2506	-69.9378	Tabatinga
TBU	-21.2411	-175.1397	Nuku'Alofa
TBW	52.8061	41.4828	Tambov
TBY	-26.0667	22.4667	TSHABONG
TBZ	38.1339	46.2350	Tabriz
TCA	-19.6350	134.1833	TENNANT CREEK
TCB	26.7453	-77.3913	Treasure Cay
TCC	35.1828	-103.6032	TUCUMCARI
TCD	-2.8670	-69.7330	Tarapaca
TCE	45.0629	28.7144	TULCEA/CATALOI
TCG	46.6725	83.3408	Tacheng
TCH	-2.8500	11.0170	  Tchibanga
TCL	33.2206	-87.6114	TUSCALOOSA REGIONAL AIRPORT
TCM	47.1377	-122.4765	TACOMA MCCHORD AFB
TCO	1.8142	-78.7494	Tumaco
TCP	29.5879	34.7782	TABA INTL
TCQ	-18.0532	-70.2757	Tacna
TCR	8.7833	78.1333	Tuticorin
TCS	33.2369	-107.2718	TRUTH OR CONSEQUENCES MUNI
TCT	62.9927	-156.0682	Takotna
TCV	-16.0833	33.6333	TETE CHINGODZI
TCW	-35.8117	145.6083	TOCUMWAL
TCX	33.6678	56.8925	TABAS
TCZ	25.0300	98.4800	Tengchong
TDD	-14.8183	-64.9133	Trinidad
TDF	36.2849	-78.9842	ROXBORO - PERSON COUNTY
TDG	9.0667	126.1667	TANDAG
TDK	45.1222	78.4433	TALDYKORGAN
TDL	-37.2367	-59.2300	TANDIL
TDX	12.2681	102.3167	Trat
TEB	40.8501	-74.0608	Teterboro
TEC	-24.3158	-50.6517	TELEMACO BORBA
TED	57.0688	8.7052	THISTED
TEE	35.4325	8.1256	Tebessa
TEF	-21.7164	122.2275	TELFER
TEM	-34.4228	147.5106	TEMORA
TEN	27.8840	109.3100	Tongren
TEQ	41.1322	27.9161	Tekirdag
TER	38.7646	-27.0908	Terceira
TET	-16.1000	33.6333	Tete
TEU	-45.5331	167.6500	MANAPOURI
TEX	37.9564	-107.9142	TELLURIDE RGNL
TEZ	26.7091	92.7847	  Tezpur
TFF	-3.3803	-64.7308	Tefe
TFI	-9.0670	149.3170	Tufi
TFL	-17.8908	-41.5150	TEOFILO OTONI/J.KUBITSCHECK
TFN	28.4827	-16.3415	Tenerife Norte
TFR	35.5424	-0.5323	ORAN/TAFARAOUI
TFS	28.0445	-16.5725	Tenerife Sur Apt
TGA	1.3875	103.7081	TENGAH
TGC	2.1778	111.2022	Tanjung Manis
TGD	42.3594	19.2519	Podgorica
TGG	5.3814	103.1047	Kuala Terengganu
TGH	-16.8911	168.5514	Tongoa
TGI	-9.3000	-76.0167	Tingo Maria
TGJ	-21.0961	167.8039	Tiga
TGK	47.1981	38.8489	Taganrog
TGM	46.4677	24.4125	Tirgu Mures
TGO	43.5567	122.1997	Tongliao
TGP	61.5900	89.9733	Bor
TGR	33.0600	6.0872	Touggourt
TGT	-5.1000	39.0667	Tanga
TGU	14.0614	-87.2172	Tegucigalpa
TGZ	16.5618	-93.0261	Tuxtla Gutierrez
THD	19.8075	105.7764	Thanh Hoe
THE	-5.0606	-42.8244	Teresina
THF	52.4736	13.4016	BERLIN-TEMPELHOF
THG	-24.4939	150.5761	THANGOOL
THK	17.3969	104.8067	THAKHEK
THL	20.4828	99.9343	Tachilek
THN	58.3181	12.3450	Trollhattan/Vanersborg
THO	66.2183	-15.3347	THORSHOFN
THQ	34.5830	105.7500	Tianshui
THR	35.6889	51.3147	Tehran Mehrabad International Airport
THS	17.2378	99.8183	Sukhothai
THU	76.5312	-68.7032	Pituffik
THX	65.7997	87.9298	Turukhansk
THZ	14.8667	5.2667	TAHOUA
TIA	41.4147	19.7206	Tirana
TID	35.3414	1.4669	Tiaret
TIF	21.4833	40.5444	Taif
TIH	-15.1194	-148.2350	Tikehau
TII	32.6000	65.8640	Tarin Kot
TIJ	32.5414	-116.9717	Tijuana
TIK	35.4147	-97.3867	TINKER AFB
TIM	-4.5314	136.8883	Tembagapura/Timika
TIN	27.7004	-8.1671	Tindouf
TIP	32.6694	13.1567	Tripoli
TIQ	14.9992	145.6194	TINIAN INTL
TIR	13.6331	79.5418	Tirupati
TIS	-10.5864	142.2900	  Thursday Island
TIU	-44.3033	171.2250	Timaru
TIV	42.4047	18.7233	Tivat
TIW	47.2679	-122.5781	TACOMA NARROWS
TIX	28.5148	-80.7992	TITUSVILLE/SPACECOAST REGIONAL
TIZ	-5.8450	142.9480	Tari
TJA	-21.5511	-64.7083	Tarija
TJH	35.5129	134.7869	TAJIMA
TJK	40.3125	36.3739	TOKAT
TJM	57.1683	65.3167	Tyumen
TJN	-15.8570	-142.2670	Takume
TJQ	-2.7450	107.7531	Tanjung Pandan
TJU	37.9800	69.8000	Kulob
TKA	62.3205	-150.0937	TALKEETNA
TKD	4.8917	-1.7667	Takoradi
TKE	57.7797	-135.2184	Tenakee
TKF	39.3200	-120.1396	TRUCKEE-TAHOE
TKG	-5.2419	105.1756	Bandar Lampung
TKH	15.2783	100.3000	NAKHON SAWAN/TAKHLI
TKJ	63.2955	-143.0061	Tok
TKK	7.4619	151.8430	Chuuk
TKN	27.8364	128.8813	TOKUNOSHIMA
TKP	-14.7100	-145.2478	Takapoto
TKQ	-4.8851	29.6702	Kigoma
TKR	26.0000	88.3833	THAKURGAON
TKS	34.1330	134.6059	Tokushima
TKT	16.8961	99.2536	TAK/TAK
TKU	60.5147	22.2617	Turku
TKV	-17.3553	-138.4450	Tatakoto
TKX	-14.4667	-145.0333	Takaroa
TLA	65.2404	-166.3393	Teller
TLC	19.3371	-99.5660	Mexico City Toluca-A.Lopez Mateos
TLE	-23.3894	43.7256	Toliara
TLH	30.3965	-84.3503	Tallahassee
TLJ	62.9012	-155.9935	Tatalina
TLL	59.4133	24.8325	Tallinn
TLM	35.0125	-1.4486	Tlemcen
TLN	43.0972	6.1461	Toulon/Hyeres
TLQ	30.9358	46.0901	ALI BASE
TLS	43.6350	1.3678	Toulouse
TLT	61.0968	-160.9695	Tuluksak
TLV	32.0106	34.8772	Tel Aviv-Yafo Ben Gurion International
TLX	-35.3744	-71.5981	TALCA/PANGUILEMO
TLY	44.8100	136.2900	Plastun
TMB	25.6478	-80.4328	MIAMI/KENDALL TAMIAMI EXEC ARP
TMC	-9.4097	119.2445	Tambolaka
TME	6.4511	-71.7600	Tame
TMI	27.3150	87.1933	Tumlingtar
TMJ	37.2867	67.3100	Termez
TML	9.5667	0.8667	Tamale
TMM	-18.1158	49.3933	Toamasina
TMO	7.2500	-61.4333	TUMEREMO
TMP	61.4153	23.5878	Tampere
TMR	22.8111	5.4508	Tamanrasset
TMS	0.3792	6.7169	Sao Tome
TMT	-1.4896	-56.3968	Trombetas
TMU	9.7330	-85.0000	Tambor
TMW	-31.0833	150.8467	Tamworth
TMX	29.2411	0.2836	TIMIMOUN
TNA	36.8550	117.2167	Jinan
TNC	65.5632	-167.9217	Tin City
TND	21.7883	-79.9972	TRINIDAD/ALBERTO DELGADO
TNE	30.6050	130.9917	NEW TANEGASHIMA
TNF	48.7497	2.1111	TOUSSUS/LE NOBLE
TNG	35.7317	-5.9211	Tangier
TNJ	0.9186	104.5272	Tanjung Pinang
TNK	60.5755	-165.2716	Tununak
TNL	49.5253	25.7006	TERNOPIL
TNM	-62.1906	-58.9864	ISLA REY JORGE/TENIENTE R.M.M.
TNN	22.9528	120.2036	Tainan
TNO	10.3557	-85.8529	Tamarindo
TNR	-18.7965	47.4761	Antananarivo
TNW	-1.0600	-77.5810	Tena
TNZ	48.7397	98.2753	Tosontsengel
TOA	33.8034	-118.3396	TORRANCE/ZAMPERINI FIELD
TOB	31.8613	23.9070	Tobruk
TOD	2.8182	104.1600	  Pulau Tioman
TOE	33.9397	8.1106	Tozeur
TOF	56.3833	85.2117	Tomsk
TOG	59.0536	-160.3969	Togiak
TOH	-13.3280	166.6380	Torres
TOJ	40.4967	-3.4459	MADRID/TORREJON
TOL	41.5868	-83.8078	Toledo Express Apt
TOM	16.7305	-3.0076	  Tombouctou
TOP	39.0687	-95.6225	TOPEKA - PHILIP BILLARD MUNI
TOQ	-22.1389	-70.0667	TOCOPILLA/BARRILES
TOS	69.6814	18.9178	Tromso
TOU	-20.7900	165.2594	Touho
TOW	-24.6847	-53.6961	TOLEDO
TOY	36.6483	137.1875	Toyama
TPA	27.9755	-82.5332	Tampa International Apt
TPC	-0.1228	-76.3378	TARAPOA
TPE	25.0802	121.2322	Taipei Taiwan Taoyuan International Apt
TPH	38.0601	-117.0872	TONOPAH
TPI	-8.3500	146.9830	  Tapini
TPJ	27.3500	84.6670	  Taplejung
TPP	-6.5089	-76.3733	Tarapoto
TPQ	21.4195	-104.8426	Tepic
TPS	37.9122	12.4936	Trapani
TQA	73.3731	-56.0603	Tasiussaq Heliport
TQD	33.3342	43.6028	AL TAQADDUM
TQI	65.8800	-37.7600	Tiniteqilaaq Heliport
TQL	64.9225	77.7850	Tarko-Sale
TQR	42.1167	15.4833	San Domino Island
TRA	24.6539	124.6753	TARAMA
TRC	25.5683	-103.4100	Torreon
TRD	63.4575	10.9242	Trondheim Vaernes Airport
TRE	56.4992	-6.8692	Tiree
TRF	59.1867	10.2586	Oslo Sandefjord-Torp Arpt
TRG	-37.6739	176.1958	Tauranga
TRH	65.7667	87.8833	TURUKHANSK
TRI	36.4751	-82.4073	Tri-Cities Regional
TRK	3.3267	117.5694	Tarakan
TRM	33.6267	-116.1597	JACQUELINE COCHRAN REGIONAL
TRN	45.2025	7.6494	Turin Caselle Airport
TRO	-31.8911	152.5083	Taree
TRQ	-8.1572	-70.7800	TARAUACA
TRR	8.5397	81.1825	Trincomalee
TRS	45.8275	13.4722	Trieste
TRU	-8.0848	-79.1095	Trujillo
TRV	8.4797	76.9197	Thiruvananthapuram
TRW	1.3783	173.1500	Tarawa
TRZ	10.7658	78.7147	Tiruchchirappalli
TSA	25.0694	121.5517	Taipei Songshan
TSE	51.0222	71.4669	Astana
TSF	45.6509	12.1979	Venice Treviso/Sant'Angelo Apt
TSH	-6.4000	20.7833	Tshikapa
TSJ	34.2848	129.3305	Tsushima
TSL	22.0383	-98.8065	  Tamuin
TSN	39.1250	117.3489	Tianjin
TSO	49.9456	-6.3314	  Tresco
TSR	45.8098	21.3379	Timisoara
TSS	40.7426	-73.9721	  New York
TST	7.5086	99.6158	Trang
TSV	-19.2542	146.7642	Townsville
TTA	28.4461	-11.1583	Tan Tan
TTB	39.9197	9.6842	TORTOLI/ARBATAX
TTD	45.5494	-122.4013	PORTLAND/TROUTDALE
TTE	0.8308	127.3800	Ternate
TTG	-22.6283	-63.8183	TARTAGAL/GRAL ENRIQUE MOSCONI
TTH	17.6660	54.0246	THUMRAIT
TTJ	35.5301	134.1650	Tottori
TTN	40.2767	-74.8136	Philadelphia Trenton-Mercer Apt
TTQ	10.5670	-83.5170	Tortuguero
TTR	-3.0447	119.8215	Tana Toraja
TTT	22.7567	121.0933	Taitung
TTU	35.5944	-5.3200	Tetouan
TUA	0.8094	-77.7081	Tulcan
TUB	-23.3667	-149.5267	Tubuai
TUC	-26.8408	-65.1047	Tucuman
TUD	13.7328	-13.6581	TAMBACOUNDA
TUF	47.4319	0.7231	Tours Val de Loire Airport
TUG	17.6400	121.7292	Tuguegarao
TUI	31.6927	38.7313	Turaif
TUK	25.9864	63.0302	Turbat
TUL	36.1984	-95.8881	Tulsa International Apt
TUN	36.8511	10.2269	Tunis
TUO	-38.7397	176.0844	Taupo
TUP	34.2681	-88.7699	Tupelo
TUR	-3.7767	-49.7192	Tucurui
TUS	32.1161	-110.9410	Tucson International Apt
TUU	28.3731	36.6213	Tabuk
TUW	8.9170	-77.7000	  Tubala
TVA	-17.8500	44.9170	  Morafenobe
TVC	44.7400	-85.5817	Traverse City
TVF	48.0650	-96.1840	Thief River Falls
TVL	38.8939	-119.9953	SOUTH LAKE TAHOE
TVS	39.7178	118.0026	Tangshan
TVU	-16.6906	-179.8769	Taveuni Island
TVY	14.1015	98.2035	Dawei
TWA	59.0756	-160.2730	Twin Hills
TWB	-27.5433	151.9167	Toowoomba
TWF	42.4818	-114.4877	Twin Falls
TWT	5.0670	119.7670	  Tawitawi
TWU	4.3133	118.1219	Tawau
TXG	24.2650	120.6208	TAICHUNG-CHING CHUAN KANG
TXK	33.4537	-93.9910	Texarkana
TXL	52.5597	13.2878	Berlin Tegel Apt
TXN	29.7333	118.2558	Huangshan
TYF	60.1547	12.9936	Torsby
TYL	-4.5728	-81.2522	TALARA/CAPITAN MONTES
TYN	37.7483	112.6300	Taiyuan
TYR	32.3541	-95.4024	Tyler
TYS	35.8109	-83.9940	Knoxville
TZA	17.5000	-88.1830	Belize City Municipal Apt
TZL	44.4587	18.7248	Tuzla
TZN	24.1586	-77.5892	  South Andros
TZX	40.9958	39.7853	Trabzon
UAB	36.9989	35.4331	ADANA/INCIRLIK
UAH	-8.9361	-139.5522	Ua Huka
UAI	-9.3039	125.2868	SUAI
UAK	61.1607	-45.4257	Narsarsuaq
UAM	13.4833	144.7961	GUAM/ANDERSON AFB
UAP	-9.3517	-140.0778	Ua Pou
UAQ	-31.5683	-68.4183	San Juan
UAS	0.5330	37.5330	Samburu
UBA	-19.7642	-47.9656	Uberaba
UBB	-9.9500	142.1833	  Mabuiag Island
UBJ	33.9300	131.2789	Ube
UBP	15.2514	104.8703	Ubon Ratchathani
UCA	43.1451	-75.3839	UTICA / ONEIDA COUNTY
UCT	63.5667	53.8033	Ukhta
UDE	51.6581	5.7092	UDEN/VOLKEL
UDG	34.4492	-79.8904	DARLINGTON COUNTY JETPORT
UDI	-18.8831	-48.2247	Uberlandia
UDJ	48.6350	22.2650	Uzhhorod
UDN	45.9347	12.9422	UDINE RIVOLTO MIL
UDR	24.6176	73.8944	Udaipur
UEL	-17.8500	36.8667	Quelimane
UEO	26.3637	126.7137	Kume Jima
UET	30.2521	66.9387	Quetta
UFA	54.5567	55.8750	Ufa
UGB	57.4254	-157.7399	Pilot Point Ugashik Bay Apt
UGC	41.5833	60.6450	Urgench
UGI	57.8833	-153.5000	Uganik
UHE	49.0294	17.4397	KUNOVICE
UHK	49.2367	140.1883	SOVIETSKAYA GAVAN/KAMIENNY R.
UIB	5.6908	-76.6411	Quibdo
UIH	13.9492	109.0461	Quinhon
UII	16.1131	-86.8803	Utila
UIK	58.1333	102.5533	UST-ILIMSK
UIL	47.9365	-124.5626	QUILLAYUTE
UIN	39.9426	-91.1945	Quincy
UIO	-0.1411	-78.4883	Quito
UIP	47.9750	-4.1678	Quimper
UIR	-31.4983	150.5183	QUIRINDI
UIT	5.8333	169.6167	XXX
UJE	9.0833	165.6667	XXX
UKA	-4.2963	39.5711	Ukunda
UKB	34.6328	135.2239	Osaka Kobe Airport
UKI	39.1260	-123.2009	UKIAH MUNI
UKK	50.0361	82.4942	Ust-Kamenogorsk
UKS	44.6917	33.5767	Sevastopol
UKX	56.8578	105.7289	Ust-Kut
ULA	-49.3094	-67.8011	SAN JULIAN/CPT D.J.D.VAZQUEZ
ULB	-16.3330	168.2830	Ulei
ULD	-28.3195	31.4171	Ulundi
ULG	48.9761	89.9347	Olgii
ULH	26.7554	37.9138	Al Ula
ULK	54.2683	48.2267	Lensk
ULN	47.8426	106.7671	Ulaanbaatar
ULO	49.9697	92.0803	Ulaangom
ULP	-26.6069	144.2561	Quilpie
ULS	37.6040	-101.3736	ULYSSES
ULU	2.8000	32.2667	GULU
ULV	54.4010	48.8027	Ulyanovsk
ULY	54.4017	48.8050	ULYANOVSK VOSTOCHNY
ULZ	47.7147	96.8472	Uliastai
UMD	70.6797	-52.1172	Uummannaq
UME	63.7931	20.2800	Umea
UMK	55.6017	36.6383	KUBINKA
UMR	-31.1400	136.8167	WOOMERA
UMU	-23.7992	-53.3139	UMUARAMA
UMY	50.8583	34.7625	  Sumy
UNA	-15.3552	-38.9990	  Una
UND	36.6625	68.9111	Kunduz
UNG	-6.1170	141.2830	Kiunga
UNI	12.5986	-61.4147	UNION ISLAND
UNK	63.8884	-160.7990	Unalakleet
UNN	9.7772	98.5853	Ranong
UPB	23.0333	-82.5792	Havana
UPG	-5.0608	119.5544	Makassar
UPK	72.1567	-55.5333	Upernavik Kujalleq Heliport
UPN	19.3965	-102.0389	Uruapan
URA	51.1508	51.5431	Uralsk
URB	-20.7758	-51.5619	CASTILHO/URUBUPUNGA
URC	43.9050	87.4767	Urumqi
URE	58.2300	22.5094	Kuressaare
URG	-29.7833	-57.0369	Uruguaiana
URJ	60.1167	64.8333	Uray
URO	49.3908	1.1839	ROUEN/VALLEE DE SEINE
URS	51.7517	36.2967	Kursk
URT	9.1361	99.1392	Surat Thani
URY	31.4121	37.2795	Gurayat
USH	-54.8433	-68.2956	Ushuaia
USK	66.0000	57.3667	Usinsk
USM	9.5492	100.0625	Ko Samui
USN	35.5933	129.3522	Ulsan
USQ	38.6811	29.4714	USAK
UST	29.9593	-81.3397	St Augustine
USU	12.1206	120.0961	Busuanga
UTC	52.1281	5.2811	UTRECHT/SOESTERBERG
UTH	17.3864	102.7883	Udon Thani
UTI	60.8964	26.9381	UTTI
UTK	11.2333	169.8667	XXX
UTM	34.6851	-90.3478	  Tunica
UTN	-28.4010	21.2597	Upington
UTP	12.6795	101.0048	U-Tapao
UTR	17.6717	100.2381	UTTARADIT
UTS	65.4411	52.1500	Ust-Tsilma
UTT	-31.5458	28.6736	Umtata
UTW	-31.9167	26.8833	QUEENSTOWN
UTZ	65.4333	52.2000	UST-TSILMA
UUA	54.6170	52.8170	Bugulma
UUD	51.8083	107.4417	Ulan-Ude
UUS	46.8883	142.7167	Yuzhno-Sakhalinsk
UUW	51.8500	107.7367	ULAN-UDE EAST
UVE	-20.6406	166.5728	Ouvea
UVF	13.7333	-60.9528	Hewanorra Intl
UVL	25.4736	30.5908	EL KHARGA
UXX	37.6643	61.8270	MARY NORTH
UYL	12.0535	24.9561	Nyala
UYN	38.2692	109.7311	Yulin
UYU	-20.3500	-66.4800	Uyuni
UZU	-29.7833	-58.0167	CURUZU CUATIA
VAA	63.0453	21.7642	Vaasa
VAF	44.9156	4.9686	VALENCE/CHABEUIL
VAG	-21.5883	-45.4728	VARGINHA/MAJOR BRIG TROMPOWSKY
VAI	-2.6921	141.3023	Vanimo
VAK	61.5408	-165.6009	Chevak
VAN	38.4686	43.3308	Van
VAO	-7.5850	158.7300	Suavanao
VAR	43.2319	27.8253	Varna
VAS	39.8153	36.9028	Sivas
VAV	-18.5856	-173.9697	VAVA U
VAW	70.3554	31.0449	Vardo
VBG	34.7291	-120.5768	LOMPOC/VANDENBERG AFB
VBM	57.5127	-157.0512	Blue Mountain
VBS	45.4289	10.3306	BRESCIA/MONTICHIARI
VBV	-17.2690	-178.9760	Vanuabalavu Island
VBY	57.6628	18.3461	Visby
VCA	10.0851	105.7119	Cantho
VCE	45.5053	12.3511	Venice Marco Polo Apt
VCL	15.4058	108.7000	Tamky
VCP	-23.0069	-47.1344	Sao Paulo Viracopos Apt
VCR	10.1333	-70.0833	CARORA
VCS	8.6667	106.6333	Con Dao
VCT	28.8517	-96.9183	Victoria
VCV	34.5975	-117.3830	VICTORVILLE
VDA	29.9361	34.9411	Ovda
VDB	61.0156	9.2881	Fagernes
VDC	-14.8631	-40.8625	Vitoria da Conquista
VDE	27.8148	-17.8871	Valverde
VDF	28.0140	-82.3453	TAMPA/VANDENBERG
VDH	17.5150	106.5906	Dong Hoi
VDM	-40.8689	-62.9978	Viedma
VDP	9.2167	-66.0167	VALLE DE LA PASCUA
VDS	70.0653	29.8447	Vadso
VDY	22.5333	72.9000	Vidyanagar
VDZ	61.1339	-146.2483	Valdez
VEE	67.0087	-146.3664	Venetie
VEL	40.4409	-109.5099	Vernal
VER	19.1458	-96.1874	Veracruz
VEY	63.4250	-20.2792	VESTMANNAEYJAR
VFA	-18.0942	25.8400	Victoria Falls
VGA	16.5275	80.7967	Vijayawada
VGD	59.2817	39.9467	VOLOGDA
VGO	42.2291	-8.6275	Vigo
VGT	36.2106	-115.1944	NORTH LAS VEGAS
VGZ	2.1667	-75.6667	Mocoa
VHC	-9.6890	20.4308	Saurimo
VHM	64.5981	16.8397	Vilhelmina
VHY	46.1717	3.4042	VICHY/CHARMEIL
VIC	45.5717	11.5269	VICENZA
VIE	48.1103	16.5697	Vienna International
VIG	8.6419	-71.6853	El Vigia
VII	18.7304	105.6758	Vinh City
VIJ	18.4481	-64.4286	Virgin Gorda
VIK	69.6600	-146.8800	Kavik
VIL	23.7217	-15.9333	Dakhla
VIN	49.2420	28.6142	Vinnytsia
VIS	36.3187	-119.3929	Visalia
VIT	42.8828	-2.7245	VITORIA/FORONDA
VIX	-20.2581	-40.2864	Vitoria
VKG	9.9497	105.1337	Rachgia
VKO	55.6000	37.2733	Moscow Vnukovo International Apt
VKT	67.4883	63.9917	Vorkuta
VLC	39.4893	-0.4816	Valencia
VLD	30.7825	-83.2767	Valdosta Regional Apt
VLG	-37.2347	-57.0233	Villa Gesell
VLI	-17.6993	168.3198	Port Vila
VLL	41.7060	-4.8519	Valladolid
VLM	-21.2536	-63.4058	VILLAMONTES/TCNL. RAFAEL PABON
VLN	10.1500	-67.9230	Valencia
VLQ	4.0964	-76.2236	TULUA - FARFAN
VLR	-28.6000	-70.7667	VALLENAR
VLS	-16.7961	168.1769	Valesdir
VLV	9.3500	-70.6167	Valera
VLY	53.2481	-4.5353	Anglesey
VME	-33.7251	-65.3781	Villa Mercedes
VMU	-7.4830	144.8000	  Baimuru
VNE	47.7192	-2.7233	VANNES/MEUCON
VNO	54.6371	25.2878	Vilnius
VNS	25.4514	82.8586	Varanasi
VNT	57.3578	21.5442	Ventspils
VNX	-22.0167	35.3167	Vilankulos
VNY	34.2098	-118.4900	VAN NUYS AIRPORT
VOG	48.7817	44.3467	Volgograd
VOK	43.9390	-90.2534	CAMP DOUGLAS/VOLK FLD
VOL	39.2194	22.7944	Volos
VOT	-20.4233	-49.9881	VOTUPORANGA
VOZ	51.8150	39.2300	Voronezh
VPE	-17.0435	15.6838	Ondjiva
VPG	-3.8599	39.7870	Vipingo
VPN	65.7206	-14.8506	  Vopnafj�r�ur
VPS	30.4833	-86.5253	Valparaiso Fort Walton Beach Apt
VPY	-19.1485	33.4295	Chimoio
VQQ	30.2187	-81.8767	JACKSONVILLE CECIL FLD
VQS	18.1348	-65.4936	Vieques
VRA	23.0344	-81.4353	Juan G Gomez Intl
VRB	27.6556	-80.4179	VERO BEACH MUNI
VRC	13.5772	124.2164	Virac
VRK	62.1711	27.8686	VARKAUS
VRN	45.3964	10.8881	Verona Villafranca Airport
VRU	-26.9667	24.7333	VRYBURG
VRY	67.6894	12.6819	  V�r�y
VSA	17.9970	-92.8148	Villahermosa
VSE	40.7255	-7.8890	VISEU
VSG	48.4181	39.3761	LUHANSK
VST	59.5894	16.6336	Stockholm Vasteras Apt
VTB	55.1264	30.3517	VITEBSK
VTE	17.9883	102.5633	Vientiane
VTG	10.3741	107.0915	VUNGTAU
VTN	42.8578	-100.5475	VALENTINE / MILLER FIELD
VTU	20.9878	-76.9358	LAS TUNAS
VTZ	17.7211	83.2247	Vishakhapatnam
VUJ	35.4167	-80.1508	ALBEMARLE / STANLEY COUNTY
VUP	10.4350	-73.2494	Valledupar
VUS	60.7670	46.3170	Veliky Ustyug
VVC	4.1681	-73.6133	Villavicencio
VVI	-17.6447	-63.1353	Santa Cruz Viru Viru International Apt
VVO	43.3983	132.1467	Vladivostok
VVZ	26.7236	8.6178	ILLIZI/TAKHAMALT
VXC	-13.2833	35.2500	Lichinga
VXE	16.8339	-25.0567	Sao Vicente Island
VXO	56.9303	14.7289	Vaxjo
VYS	41.3519	-89.1531	PERU
WAA	65.6226	-168.0949	Wales
WAE	20.5042	45.1989	Wadi al Dawaser
WAG	-39.9622	175.0253	Wanganui
WAI	-14.8987	47.9939	  Antsohihy
WAL	37.9402	-75.4664	WALLOPS FLIGHT FACILITY NASA
WAM	-17.8000	48.4330	  Ambatondrazaka
WAQ	-18.7000	44.6170	  Antsalova
WAT	52.1872	-7.0870	Waterford
WAW	52.1658	20.9671	Warsaw
WAX	32.9800	12.0150	ZWARA
WBB	63.5160	-162.2780	Stebbins
WBG	54.4567	9.5164	SCHLESWIG
WBM	-5.6433	143.8954	Wapenamanda
WBQ	66.3622	-147.4065	Beaver
WCA	-42.4850	-73.7722	CASTRO/GAMBOA
WCH	-42.9222	-72.6950	CHAITEN
WDB	-25.6500	28.2167	PRETORIA/WONDERBOOM
WDH	-22.4800	17.4708	Windhoek Hosea Kutako International
WDR	33.9828	-83.6673	WINDER-BARROW AIRPORT
WEF	36.6467	119.1186	Weifang
WEH	37.1883	122.2300	WEIHAI/DASHUIPO
WEI	-12.6800	141.9242	Weipa
WFD	53.3381	-2.1489	MANCHESTER WOODFORD
WFI	-21.4416	47.1117	  Fianarantsoa
WFK	47.2856	-68.3128	FRENCHVILLE NORT.AROOSTOOK REG
WGA	-35.1650	147.4667	Wagga Wagga
WGC	17.9144	79.6022	WARANGAL
WGE	-30.0331	148.1181	WALGETT
WGP	-9.6681	120.2989	Waingapu
WGT	-36.4175	146.3056	WANGARATA
WHF	21.8028	31.5220	WADI HALFA
WHK	-37.9206	176.9142	Whakatane
WIC	58.4589	-3.0931	Wick
WIE	50.0500	8.3250	WIESBADEN - ERBENHEIM
WIL	-1.3213	36.8150	Nairobi Wilson Apt
WIN	-22.3667	143.0831	Winton
WJA	7.4507	168.5501	Woja
WJF	34.7411	-118.2186	LANCASTER
WJR	1.7332	40.0916	Wajir
WJU	37.4381	127.9603	Won-ju
WKA	-44.7222	169.2456	  Wanaka
WKB	-36.3225	142.4181	WARRACKNABEAL
WKF	-25.8283	28.2217	WATERKLOOF
WKJ	45.4041	141.8009	Wakkanai
WKK	59.2826	-158.6177	Aleknagik
WLG	-41.3272	174.8053	Wellington
WLH	-15.4120	167.6910	Walaha
WLK	66.6001	-159.9858	Selawik
WLS	-13.2383	-176.1989	Wallis Island
WMB	-38.2961	142.4447	WARRNAMBOOL
WMC	40.8966	-117.8059	WINNEMUCCA
WME	-27.2867	120.5550	MT. KEITH
WMI	52.4511	20.6519	Nowy Dwor Mazowiecki
WMN	-15.4367	49.6883	Maroantsetra
WMO	64.6892	-163.4127	White Mountain
WMR	-16.1639	49.7738	Mananara Avaratra
WMX	-4.0975	138.9514	Wamena
WNA	60.6903	-161.9785	Napakiak
WNH	23.3730	104.2490	Wenshan
WNN	52.8944	-89.2889	Wunnummin Lake
WNP	13.5811	123.2620	Naga
WNR	-25.4133	142.6667	Windorah
WNS	26.2194	68.3901	NAWABSHAH
WNZ	27.9122	120.8519	Wenzhou
WOE	51.4497	4.3433	WOENSDRECHT AB
WOL	-34.5617	150.7883	WOLLONGONG
WPA	-45.4000	-72.6667	PUERTO AYSEN/CABO1 JUAN ROMAN
WPC	49.5206	-113.9917	PINCHER CREEK
WPM	-8.7830	142.8670	  Wipim
WPR	-53.2500	-70.3333	PORVENIR/CAPITAN FUENTES MART.
WPU	-54.9281	-67.6328	PUERTO WILLIAMS/GUARD.ZANARTU
WRB	32.6400	-83.5917	MACON/ROBINS AFB
WRE	-35.7703	174.3650	Whangarei
WRG	56.4861	-132.3700	Wrangell
WRI	40.0154	-74.5936	MC GUIRE AFB
WRL	43.9657	-107.9508	Worland
WRO	51.1027	16.8858	Wroclaw
WRY	59.3500	-2.9330	Westray
WSN	58.7021	-157.0026	South Naknek
WST	41.3496	-71.8034	  Westerly
WSX	48.6179	-122.9527	Westsound
WSZ	-41.7381	171.5808	Westport
WTD	26.6833	-78.9833	WEST END
WTE	9.4500	170.0333	XXX
WTK	67.5611	-162.9804	Noatak
WTL	60.3353	-162.6670	Tuntutuliak
WTN	53.1667	-0.5167	WADDINGTON
WTO	10.1667	166.0333	XXX
WTP	-8.5330	147.2500	  Woitape
WTS	-18.7500	46.0500	  Tsiroanomandidy
WUA	39.7900	106.7900	Wuhai
WUH	30.7850	114.2100	Wuhan
WUN	-26.6300	120.2200	WILUNA
WUS	27.7008	117.9994	Wuyishan
WUU	7.7257	27.9749	WAU
WUX	31.4944	120.4294	Wuxi
WUZ	23.4567	111.2481	Wuzhou
WVB	-22.9799	14.6453	Walvis Bay
WWK	-3.5834	143.6671	Wewak
WWP	56.1163	-133.1217	Whale Pass
WWT	60.9391	-164.6413	Newtok
WWY	-33.9392	147.1936	WEST WYALONG
WXN	30.8361	108.4056	Wanzhou
WYA	-33.0583	137.5156	Whyalla
WYN	-15.5117	128.1533	WYNDHAM
WYS	44.6883	-111.1175	WEST YELLOWSTONE
XAC	44.5819	-1.1147	ARCACHON LA TESTE DE BUCH
XAP	-27.1336	-52.6611	Chapeco
XAS	44.0728	4.1431	ALES/DEAUX
XBE	53.9664	-91.0264	Bearskin Lake
XBJ	32.8981	59.2661	Birjand
XBQ	47.6797	1.2058	BLOIS/LE BREUIL
XCB	50.2192	3.1522	CAMBRAI/EPINOY
XCD	46.8283	-4.8169	CHALON/CHAMPFORGEUIL
XCH	-10.4500	105.6900	Christmas Island
XCR	48.7733	4.2061	Paris Chalons-Vatry Airport
XCZ	49.7850	4.6428	CHARLEVILLE/MEZIERES
XDB	50.6333	3.0667	XXX
XDS	45.4150	-75.6510	Ottawa Rail CA
XEQ	60.1936	-44.8114	Tasiuasaq
XFA	50.6325	3.0583	Lille Rail Stn
XFN	32.1506	112.2908	Xiangyang
XFV	43.1314	-80.3425	BRANTFORD
XFW	53.5354	9.8355	Hamburg Finkenwerder
XGG	14.4500	-0.2333	GOROM GOROM
XGR	58.7117	-65.9933	Kangiqsualujjuaq
XHK	44.9300	4.9000	Valence Rail FR
XIC	27.9850	102.1800	Xichang
XIL	43.9156	115.9639	Xilinhot
XIQ	69.0811	-51.1153	Ilimanaq
XIY	34.4450	108.7500	Xi'an Xianyang Apt
XIZ	49.3000	4.0333	Reims Rail Stn
XJD	25.1323	51.3088	AL UDAID AIR BASE
XKH	19.3000	103.3667	Phonsavan
XKS	53.5247	-88.6428	Kasabonika
XLB	58.6175	-101.4689	LAC BROCHET
XLS	16.0497	-16.4611	SAINT LOUIS
XLW	53.1427	8.6235	LEMWERDER
XMF	47.4867	6.7914	MONTBELIARD/COURCELLES
XMH	-14.4375	-146.0708	Manihi
XMN	24.5433	118.1250	Xiamen
XMR	28.4675	-80.5668	CAPE CANAVERAL/AFS
XMS	-2.2989	-78.1208	Macas
XMU	46.5344	3.4217	MOULINS/MONTBEUGNY
XMY	-9.9011	142.7756	  Yam Island
XNA	36.2819	-94.3068	Fayetteville Northwest Arkansas Reg Apt
XNN	36.5275	102.0428	Xining
XNV	31.2083	35.0123	NEVATIM AB
XOG	44.1400	4.8686	ORANGE
XOP	46.5800	0.3000	Poitiers Rail (FR)
XOZ	25.2500	51.5000	Doha Free Zone
XPG	48.8800	2.3500	Paris-Gare du Nord Rail Stn FR
XPJ	45.6333	-0.7500	XXX
XPK	55.7489	-101.2664	PUKATAWAGAN
XPP	53.0000	-97.2667	POPLAR RIVER
XQC	33.9402	44.3616	BALAD SOUTHEAST AIRFIELD
XQP	9.4432	-84.1298	Quepos
XQU	49.3372	-124.3939	  Qualicum Beach
XRF	47.0667	3.0000	XXX
XRY	36.7446	-6.0601	Jerez
XSB	24.3333	52.6000	Sir Bani Yas Island
XSC	21.5158	-71.5285	South Caicos
XSH	47.3900	0.6800	Tours Rail FR
XSI	56.7928	-98.9072	SOUTH INDIAN LAKE
XSP	1.4169	103.8677	SINGAPORE/SELETAR
XSU	47.2567	-0.1136	SAUMUR/ST. FLORENT
XTG	-27.9883	143.8100	Thargomindah
XTL	58.7061	-98.5122	TADOULE LAKE
XTV	34.6732	43.5430	TIKRIT/AL SAHRA AAF
XUZ	34.2881	117.1714	Xuzhou
XVN	49.1222	5.4708	VERDUN/LE ROZELIER
XVW	52.5175	-2.2594	WOLVERHAMPTON
XWG	48.5844	7.7486	Strasbourg Rail Stn
XXO	28.6150	-80.6950	TITUSVILLE/NASA SHUTTLE LDGFAC
XXX	49.3900	-93.9953	SIOUX NARROWS
XYA	-9.0830	159.2170	  Yandina
XYD	46.2353	5.1517	XXX
XYT	43.5767	1.4750	TOULOUSE MONTAUDRAN
XZI	49.1203	6.1778	Metz TGV Station
XZN	46.4000	5.8333	XXX
XZV	43.1100	5.9300	Toulon TGV Station FR
YAA	52.4525	-125.3033	Anahim Lake
YAB	73.0053	-85.0331	Arctic Bay
YAC	51.7272	-91.8244	Cat Lake
YAD	53.5717	-76.1964	KATTINIQ/DONALDSON
YAG	48.6542	-93.4397	Fort Frances
YAH	53.7544	-73.6739	LA GRANDE 3
YAI	-36.5828	-72.0317	CHILLAN/BERNARDO OHIGGINS
YAJ	48.8000	-123.2000	  Lyall Harbour
YAK	59.5033	-139.6602	Yakutat
YAM	46.4850	-84.5094	Sault Ste Marie
YAO	3.8321	11.5216	YAOUNDE
YAP	9.4989	138.0825	Yap
YAT	52.9275	-82.4319	Attawapiskat
YAV	48.8670	-123.3000	Miner's Bay
YAW	44.6397	-63.4994	HALIFAX SHEARWATER
YAX	53.2500	-89.5670	Angling Lake
YAY	51.3975	-56.0831	St Anthony
YAZ	49.0822	-125.7725	TOFINO
YBB	68.5344	-89.8081	Pelly Bay
YBC	49.1325	-68.2044	Baie Comeau
YBE	59.5617	-108.4786	URANIUM CITY
YBF	54.3042	-110.7436	BONNYVILLE
YBG	48.3306	-70.9964	Bagotville
YBI	53.4694	-55.7850	  Black Tickle
YBK	64.2989	-96.0778	Baker Lake
YBL	49.9508	-125.2708	Campbell River Municipal Apt
YBP	28.8170	104.5330	Yibin
YBR	49.9097	-99.9508	Brandon
YBT	57.8894	-101.6792	BROCHET
YBV	52.3589	-97.0183	Berens River
YBW	48.7500	-123.2330	  Bedwell Harbor
YBX	51.4436	-57.1853	Blanc Sablon
YCB	69.1081	-105.1383	Cambridge Bay
YCC	45.0925	-74.5683	CORNWALL REGIONAL
YCD	49.0522	-123.8703	Nanaimo Cassidy Apt
YCE	43.2856	-81.5083	CENTRALIA/HURON AIRPARK
YCG	49.2964	-117.6325	Castlegar
YCH	47.0078	-65.4492	MIRAMICHI
YCK	67.0330	-126.0830	Colville Lake
YCL	47.9908	-66.3303	Charlo
YCN	49.1056	-81.0136	COCHRANE
YCO	67.8167	-115.1439	Kugluktuk Coppermine
YCR	54.6100	-97.7606	CROSS LAKE
YCS	63.3469	-90.7311	Chesterfield Inlet
YCU	35.1833	111.0500	Yuncheng
YCW	49.1528	-121.9389	CHILLIWACK
YCY	70.4861	-68.5167	Clyde River
YDA	64.0431	-139.1278	DAWSON CITY
YDB	61.3711	-139.0406	BURWASH
YDF	49.2108	-57.3914	Deer Lake
YDL	58.4222	-130.0322	DEASE LAKE
YDN	51.1008	-100.0525	DAUPHIN LTC W.G.(BILLY)BARKER
YDP	56.5500	-61.6830	Nain
YDQ	55.7423	-120.1830	Dawson Creek
YDS	50.3330	-125.0000	  Desolation Sound
YDV	51.7833	-96.7000	BLOODVEIN RIVER
YEC	36.6317	128.3551	YECHON
YEE	44.6833	-79.9283	MIDLAND HURONIA
YEG	53.3097	-113.5797	Edmonton International Apt
YEI	40.2552	29.5626	Bursa
YEK	61.0942	-94.0708	Arviat
YEL	46.3514	-82.5614	ELLIOT LAKE MUNICIPAL
YEM	45.8428	-81.8581	MANITOWANING MANITOULIN EAST M
YEO	51.0100	-2.6383	YEOVILTON
YER	56.0189	-87.6764	Fort Severn
YES	30.6800	50.5500	Yasouj
YET	53.5789	-116.4650	EDSON
YEU	79.9947	-85.8142	EUREKA
YEV	68.3042	-133.4828	Inuvik
YFA	52.2033	-81.6958	Fort Albany
YFB	63.7564	-68.5558	Iqaluit
YFC	45.8681	-66.5356	Fredericton
YFH	51.5614	-87.9069	Fort Hope
YFJ	64.1900	-114.0800	Snare Lake
YFO	54.6781	-101.6817	Flin Flon
YFR	61.1808	-113.6897	FORT RESOLUTION
YFS	61.7602	-121.2365	Fort Simpson
YFX	52.3728	-55.6739	  St. Lewis
YGB	49.6942	-124.5178	TEXADA GILLIES BAY
YGG	48.8500	-123.5000	  Ganges Harbor
YGH	66.2408	-128.6508	Fort Good Hope
YGJ	35.4923	133.2365	Yonago
YGK	44.2253	-76.5969	Kingston Norman Rogers Apt
YGL	53.6253	-77.7042	La Grande
YGM	50.6281	-97.0433	GIMLI INDUSTRIAL PARK AIRPORT
YGN	50.8500	-126.8500	  Greenway Sound
YGO	54.5589	-94.4914	GODS LAKE NARROWS
YGP	48.7753	-64.4786	Gaspe
YGQ	49.7783	-86.9394	GERALDTON GREENSTONE REGIONAL
YGR	47.4247	-61.7781	Iles de la Madeleine
YGT	69.3647	-81.8161	Igloolik
YGV	50.2819	-63.6114	Havre St Pierre
YGW	55.2819	-77.7653	Kuujjuarapik
YGX	56.3575	-94.7106	Gillam
YGZ	76.4261	-82.9092	Grise Fiord
YHA	52.5330	-56.2830	  Port Hope Simpson
YHD	49.8317	-92.7442	Dryden
YHE	49.3667	-121.4833	HOPE
YHG	52.7647	-56.1094	  Charlottetown
YHH	49.9464	-125.2660	Campbell River
YHI	70.7628	-117.8061	Ulukhaktok
YHK	68.6356	-95.8503	Gjoa Haven
YHM	43.1736	-79.9350	Toronto John C Munro Hamilton
YHO	55.4500	-60.2330	Hopedale
YHP	52.1133	-94.2555	Poplar Hill
YHR	50.4689	-59.6367	Chevery
YHS	49.4833	-123.7667	  Sechelt
YHU	45.5175	-73.4169	Montreal St Hubert Apt
YHY	60.8397	-115.7764	Hay River
YHZ	44.8808	-63.5086	Halifax Stanfield International Apt
YIB	48.7739	-91.6386	ATIKOKAN MUNI
YIC	27.8033	114.3081	Yichun (Jiangxi)
YIE	47.3000	119.8800	Aershan
YIF	51.2117	-58.6583	Pakuashipi
YIH	30.6710	111.4410	Yichang
YIK	62.4173	-77.9253	Ivujivik
YIN	43.9558	81.3303	Yining
YIO	72.6833	-77.9667	Pond Inlet
YIP	42.2047	-83.5303	DETROIT/WILLOW RUN
YIV	53.8572	-94.6536	ISLAND LAKE
YIW	29.3447	120.0322	Yiwu
YJN	45.2944	-73.2811	ST-JEAN
YJT	48.5450	-58.5500	Stephenville
YKA	50.7022	-120.4444	Kamloops
YKF	43.4608	-80.3786	Toronto Region of Waterloo Int
YKG	60.0272	-69.9992	Kangirsuk
YKL	54.8053	-66.8053	Schefferville
YKM	46.5682	-120.5441	Yakima Air Terminal
YKQ	51.4736	-78.7581	Waskaganish
YKS	62.0933	129.7717	Yakutsk
YKT	52.6000	-128.5170	Klemtu
YKU	53.8056	-78.9169	Chisasibi
YKX	48.2103	-79.9814	KIRKLAND
YKZ	43.8622	-79.3700	TORONTO BUTTONVILLE MUNI
YLB	54.7703	-112.0317	LAC LA BICHE
YLC	62.8500	-69.8833	Kimmirut/Lake Harbour
YLD	47.8200	-83.3467	CHAPLEAU
YLE	63.1500	-117.2670	Whati
YLH	52.1950	-87.9333	Lansdowne House
YLI	64.0547	24.7253	YLIVIESKA
YLJ	54.1244	-108.5233	MEADOW LAKE
YLL	53.3092	-110.0725	Lloydminster
YLQ	47.4097	-72.7889	LA TUQUE
YLR	56.5133	-99.9853	LEAF RAPIDS
YLT	82.5178	-62.2806	ALERT
YLW	49.9561	-119.3778	Kelowna
YLY	49.1008	-122.6308	Langley Regional
YMF	48.8170	-123.2000	  Montagne Harbor
YMH	52.3028	-55.8472	  Mary's Harbour
YMJ	50.3303	-105.5592	MOOSE JAW V.MARSHALL CM MCEWEN
YMK	68.4700	73.6000	Mys Kamennyy
YMM	56.6533	-111.2219	Fort McMurray
YMN	55.0769	-59.1864	Makkovik
YMO	51.2911	-80.6078	Moosonee
YMP	50.5756	-127.0286	  Port McNeill
YMS	-5.8833	-76.0833	YURIMAGUAS/M.BENZAQUEN RENGIFO
YMT	49.7719	-74.5281	Chibougamau
YMU	50.6660	-124.9830	Mansons Landing
YMW	46.2728	-75.9906	MANIWAKI
YMX	45.6779	-74.0386	MONTREAL INTL MIRABEL
YNA	50.1900	-61.7889	Natashquan
YNB	24.1442	38.0635	Yanbu al Bahr
YNC	53.0106	-78.8311	Wemindji
YND	45.5214	-75.5642	OTTAWA/GATINEAU
YNE	53.9583	-97.8442	NORWAY HOUSE
YNG	41.2607	-80.6791	Youngstown
YNH	56.0356	-121.9758	HUDSONS HOPE
YNJ	42.8817	129.4483	Yanji
YNM	49.7617	-77.8028	MATAGAMI
YNO	52.4906	-92.9731	North Spirit Lake
YNP	55.9128	-61.1853	Natuashish
YNS	51.6908	-76.1350	Nemiscau
YNT	37.4017	121.3717	Yantai
YNY	38.0739	128.6211	Yangyang
YNZ	33.4160	120.2000	Yancheng
YOA	64.6989	-110.6147	EKATI
YOC	67.5706	-139.8392	  Old Crow
YOD	54.4050	-110.2794	COLD LAKE
YOG	51.6578	-85.9008	Ogoki
YOH	54.9333	-95.2789	OXFORD HOUSE
YOJ	58.6214	-117.1647	High Level
YOL	9.2600	12.4303	Yola
YOP	58.4914	-119.4083	Rainbow Lake
YOW	45.3226	-75.6691	McDonald -  Cartier Intl Apt
YOY	46.9000	-71.5000	VALCARTIER
YPA	53.2142	-105.6728	PRINCE ALBERT GLASS FIELD
YPB	49.2670	-124.8330	  Port Alberni
YPC	69.3611	-124.0753	Paulatuk
YPD	70.1678	-124.6914	CAPE PARRY
YPE	56.2269	-117.4472	PEACE RIVER
YPG	49.9031	-98.2739	PORTAGE LA PRAIRIE/SOUTHPORT
YPH	58.4717	-78.0772	Inukjuak
YPJ	59.2967	-69.6000	Aupaluk
YPK	49.2161	-122.7100	PITT MEADOWS BC
YPL	51.4464	-90.2142	Pickle Lake
YPM	51.8197	-93.9733	Pikangikum
YPN	49.8364	-64.2886	Port Menier
YPO	54.9830	-85.4330	Peawanuck
YPQ	44.2300	-78.3633	PETERBOROUGH
YPR	54.2861	-130.4447	Prince Rupert Digby Island Apt
YPS	45.6567	-61.3681	PORT HAWKESBURY
YPT	48.8128	-123.3222	  Pender Harbour
YPW	49.8342	-124.5000	Powell River
YPX	60.0506	-77.2869	Puvirnituq
YPY	58.7672	-111.1172	Fort Chipewyan
YPZ	54.3717	-125.9514	BURNS LAKE
YQA	44.9747	-79.3033	MUSKOKA
YQB	46.7911	-71.3933	Quebec International Airport
YQC	61.0464	-69.6178	Quaqtaq
YQD	53.9714	-101.0911	The Pas
YQF	52.1822	-113.8944	Red Deer
YQG	42.2756	-82.9556	Windsor Apt
YQH	60.1178	-128.8219	WATSON LAKE
YQI	43.8269	-66.0881	YARMOUTH
YQJ	50.1968	-125.2675	Quadra Island
YQK	49.7883	-94.3631	Kenora
YQL	49.6303	-112.7997	Lethbridge
YQM	46.1122	-64.6786	Greater Moncton International Airport
YQN	50.1828	-86.6964	  Nakina
YQQ	49.7108	-124.8867	Comox
YQR	50.4319	-104.6658	Regina
YQS	42.7700	-81.1108	ST. THOMAS MUNI
YQT	48.3719	-89.3239	Thunder Bay
YQU	55.1797	-118.8850	Grande Prairie
YQV	51.2647	-102.4617	YORKTON MUNI
YQW	52.7692	-108.2436	NORTH BATTLEFORD CAMERON
YQX	48.9369	-54.5681	Gander
YQY	46.1614	-60.0478	Sydney
YQZ	53.0261	-122.5103	Quesnel
YRA	64.1170	-117.3670	Rae Lakes
YRB	74.7169	-94.9694	Resolute
YRC	50.1239	-124.8395	Refuge Cove
YRF	53.6830	-57.0330	  Cartwright
YRG	54.1794	-58.4569	Rigolet
YRI	47.7644	-69.5847	RIVIERE-DU-LOUP
YRJ	48.5200	-72.2656	ROBERVAL
YRL	51.0669	-93.7931	Red Lake
YRM	52.4297	-114.9044	ROCKY MOUNTAIN HOUSE
YRO	45.4603	-75.6461	OTTAWA/ROCKCLIFFE
YRQ	46.3528	-72.6794	THETFORD MINES
YRS	54.1672	-93.5572	RED SUCKER LAKE
YRT	62.8114	-92.1158	Rankin Inlet
YSB	46.6250	-80.7989	Sudbury
YSC	45.4386	-71.6914	SHERBROOKE
YSE	49.7817	-123.1619	SQUAMISH
YSF	59.2503	-105.8414	STONY RAPIDS
YSG	62.4100	-110.6822	Lutselke Snowdrift
YSJ	45.3167	-65.8903	St John
YSK	56.5378	-79.2467	Sanikiluaq
YSL	47.1575	-67.8347	ST. LEONARD
YSM	60.0222	-111.9603	Fort Smith
YSN	43.1917	-79.1717	ST. CATHARINES/NIAGARA
YSO	54.9103	-59.7850	Postville
YSP	48.7553	-86.3444	MARATHON
YSR	72.9822	-84.6136	NANISIVIK
YST	53.8456	-94.8519	ST. THERESA POINT
YSU	46.4406	-63.8336	SUMMERSIDE
YSY	71.9939	-125.2425	Sachs Harbour
YTA	45.8644	-77.2517	PEMBROKE
YTD	55.3189	-97.7078	THICKET PORTAGE
YTE	64.2300	-76.5267	Cape Dorset
YTF	48.5089	-71.6419	ALMA
YTG	50.8830	-126.8000	  Sullivan Bay
YTH	55.8011	-97.8642	Thompson
YTJ	48.8133	-87.0994	TERRACE BAY
YTL	53.8178	-89.8969	Big Trout Lake
YTM	46.5100	-74.7500	Mont Tremblant
YTQ	58.6678	-69.9558	Tasiujuaq
YTR	44.1189	-77.5281	TRENTON
YTS	48.5697	-81.3767	Timmins
YTY	32.5617	119.7150	Yangzhou
YTZ	43.6275	-79.3961	Bishop Billy City A/P
YUB	69.4333	-133.0264	Tuktoyaktuk
YUD	56.5381	-76.5192	Umiujaq
YUJ	68.4756	-113.2214	LADY FRANKLIN POINT
YUL	45.4706	-73.7408	Montreal Pierre Elliott Trudeau Int Apt
YUM	32.6566	-114.6060	Yuma International Apt
YUS	33.0000	97.0100	Yushu
YUT	66.5214	-86.2247	Repulse Bay
YUX	68.7761	-81.2436	Hall Beach
YUY	48.2061	-78.8356	Rouyn
YVA	-11.7108	43.2439	  Moroni
YVB	48.0711	-65.4603	Bonaventure
YVC	55.1514	-105.2619	LA RONGE (BARBER FIELD)
YVE	50.2500	-119.3333	VERNON
YVM	67.5458	-64.0314	Qikiqtarjuaq
YVO	48.0539	-77.7825	Val D'Or
YVP	58.0961	-68.4269	Kuujjuaq
YVQ	65.2816	-126.7983	Norman Wells
YVR	49.1939	-123.1844	Vancouver International Apt
YVT	55.8419	-108.4175	BUFFALO NARROWS
YVV	44.7458	-81.1072	WIARTON
YVZ	52.6558	-94.0614	Deer Lake
YWA	45.9522	-77.3192	PETAWAWA
YWB	61.5886	-71.9294	Kangiqsujuaq
YWG	49.9100	-97.2399	Winnipeg
YWH	48.4228	-123.3875	Victoria Inner Harbour Apt
YWJ	65.2106	-123.4358	Deline
YWK	52.9219	-66.8644	Wabush
YWL	52.1831	-122.0542	Williams Lake
YWM	52.5669	-55.7847	  Williams Harbour
YWO	65.7592	-111.2500	LUPIN
YWP	52.9597	-87.3689	Webequie
YWS	50.1433	-122.9492	  Whistler
YWY	63.2094	-123.4367	WRIGLEY
YXC	49.6108	-115.7822	Cranbrook
YXD	53.5725	-113.5206	EDMONTON CITY CENTRE
YXE	52.1708	-106.6997	Saskatoon
YXH	50.0189	-110.7208	Medicine Hat
YXJ	56.2381	-120.7403	Fort St John
YXK	48.4781	-68.4969	RIMOUSKI/RICHELIEU
YXL	50.1139	-91.9053	Sioux Lookout
YXN	62.2392	-92.5972	Whale Cove
YXP	66.1450	-65.7136	Pangnirtung
YXR	47.6950	-79.8489	EARLTON/TIMISKAMING REGIONAL
YXS	53.8894	-122.6789	Prince George
YXT	54.4685	-128.5762	Terrace
YXU	43.0356	-81.1539	London International
YXX	49.0253	-122.3606	Abbotsford
YXY	60.7096	-135.0673	Whitehorse
YXZ	47.9667	-84.7867	WAWA
YYB	46.3636	-79.4228	North Bay
YYC	51.1139	-114.0203	Calgary
YYD	54.8247	-127.1828	Smithers
YYE	58.8369	-122.5969	Fort Nelson
YYF	49.4631	-119.6022	Penticton
YYG	46.2900	-63.1211	Charlottetown
YYH	69.5467	-93.5767	Taloyoak
YYJ	48.6469	-123.4258	Victoria International Apt
YYL	56.8639	-101.0761	LYNN LAKE
YYN	50.2919	-107.6906	SWIFT CURRENT
YYQ	58.7372	-94.0572	Churchill Airport
YYR	53.3192	-60.4258	Goose Bay
YYT	47.6186	-52.7525	St Johns
YYU	49.4117	-82.4689	Kapuskasing
YYY	48.6086	-68.2081	Mont Joli
YYZ	43.6772	-79.6306	Lester B Pearson Intl
YZD	43.7428	-79.4656	TORONTO/DOWNSVIEW
YZE	45.8853	-82.5678	GORE BAY MANITOULIN
YZF	62.4628	-114.4403	Yellowknife
YZG	62.1792	-75.6669	Salluit
YZH	55.2931	-114.7772	SLAVE LAKE
YZP	53.2544	-131.8139	Sandspit
YZR	42.9994	-82.3089	Sarnia Chris Hadfield Apt
YZS	64.1933	-83.3594	Coral Harbour
YZT	50.6806	-127.3667	Port Hardy
YZU	54.1439	-115.7867	WHITECOURT
YZV	50.2233	-66.2656	Sept-Iles
YZX	44.9844	-64.9169	GREENWOOD
YZY	38.8019	100.6750	Zhangye
YZZ	49.0500	-117.6100	Trail
ZAC	56.0903	-96.0914	YORK LANDING
ZAD	44.1083	15.3467	Zadar
ZAG	45.7429	16.0688	Zagreb
ZAH	29.4733	60.9033	Zahedan
ZAJ	30.9692	61.8670	Zaranj
ZAL	-39.6494	-73.0864	Valdivia
ZAM	6.9224	122.0596	Zamboanga
ZAO	44.3506	1.4786	CAHORS LALBENQUE
ZAQ	49.4500	11.0700	Nuremberg Rail DE
ZAR	11.1333	7.6825	ZARIA
ZAT	27.3256	103.7550	Zhaotong
ZAZ	41.6662	-1.0416	Zaragoza
ZBF	47.6297	-65.7389	Bathurst
ZBL	-24.4000	150.5000	Biloela
ZBM	45.2908	-72.7414	BROMONT
ZBR	25.4444	60.3836	Chah Bahar
ZBT	55.4364	9.3308	KOLDING/VAMDRUP
ZBY	19.2333	101.7333	SAYABOURY
ZCL	22.8974	-102.6858	Zacatecas
ZCN	52.5911	10.0219	CELLE
ZCO	-38.7669	-72.6372	Temuco
ZCP	50.2633	10.9950	COBURG BRANDENSTEINSEBENE
ZDH	47.6000	7.5200	Basel/Mulhouse Rail (CH)
ZDN	49.2000	16.5700	Brno Bus (CZ)
ZDY	24.5031	52.3358	Delma Island
ZEL	52.1847	-128.1564	Bella Bella
ZEM	52.2264	-78.5225	East Main
ZEU	51.5000	9.9400	Goettingen Stn DE
ZFD	59.3336	-107.1822	FOND-DU-LAC
ZFJ	48.1500	4.8500	XXX
ZFM	67.4075	-134.8606	Fort McPherson
ZFN	64.9170	-125.5670	Tulita Fort Norman
ZFQ	48.6833	1.1000	XXX
ZFV	39.9500	-75.1640	Philadelphia Rail US
ZGC	36.5167	103.6217	LANZHOU/ZHONGCHUAN
ZGI	54.8397	-94.0808	GODS RIVER
ZGR	52.0456	-95.4658	LITTLE GRAND RAPIDS
ZGS	50.3330	-60.6670	Gethsemani
ZGU	-14.2181	167.5872	Gaua
ZHA	21.2144	110.3583	Zhanjiang
ZHI	47.1814	7.4164	GRENCHEN
ZHM	24.3988	91.9169	SHAMSHERNAGAR
ZHY	37.5100	105.1800	Zhongwei
ZIG	12.5561	-16.2750	Ziguinchor
ZIH	17.6016	-101.4606	Ixtapa/Zihuatanejo
ZJG	54.5194	-98.0464	JENPEG
ZKE	52.2825	-81.6778	Kashechewan
ZKG	50.1830	-61.2830	Kegaska
ZLN	48.0000	0.2000	Le Mans Rail (FR)
ZLO	19.1448	-104.5585	Manzanillo
ZLT	50.8308	-58.9756	La Tabatiere
ZMB	53.5800	9.9800	Hamburg Rail DE
ZME	40.7353	-74.1850	Newark Metropark Rail
ZMG	52.0737	11.6265	MAGDEBURG
ZMH	51.7361	-121.3328	108 MILE AIRPORT
ZMT	54.0275	-132.1253	Masset
ZMU	48.1394	11.5609	Munich Rail (DE)
ZNA	49.1833	-123.9500	Nanaimo Harbour
ZND	13.7839	8.9904	ZINDER
ZNE	-23.4183	119.8033	Newman
ZNZ	-6.2188	39.2246	Zanzibar
ZOS	-40.6072	-73.0567	Osorno
ZPB	53.8906	-92.1953	Sachigo Lake
ZPC	-39.2894	-71.9167	PUCON
ZQN	-45.0211	168.7392	Queenstown
ZQW	49.2095	7.4006	Zweibruecken Airport
ZQZ	40.7386	114.9303	Zhangjiakou
ZRH	47.4583	8.5481	Zurich Airport
ZRJ	52.9436	-91.3128	Round Lake
ZSA	24.0631	-74.5237	San Salvador
ZSE	-21.3216	55.4256	St-Pierre
ZSJ	53.0642	-93.3445	Sandy Lake
ZSY	33.6229	-111.9105	SCOTTSDALE
ZTA	-20.7706	-138.5686	  Tureia
ZTB	50.6744	-59.3836	Tete-a-La Baleine
ZTC	45.0600	7.6600	Turin Bus IT
ZTF	40.8440	-73.8410	Westchester Rail US
ZTH	37.7511	20.8842	Zakinthos Island
ZTM	55.8647	-92.0814	SHAMATTAWA
ZTT	51.7689	14.2978	COTTBUS
ZTU	41.5592	46.6668	Zaqatala
ZUD	-41.9039	-73.7975	ANCUD/PUPELDE
ZUH	22.0083	113.3783	Zhuhai
ZUM	53.5619	-64.1064	Churchill Falls
ZVE	6.0833	-58.1333	XXX
ZVK	16.5567	104.7594	Savannakhet
ZVR	52.3760	9.7410	Hanover Rail
ZWE	51.2167	4.4000	Antwerp Central Rail Stn
ZWI	-32.6500	138.1000	XXX
ZWL	58.1069	-103.1722	WOLLASTON LAKE
ZWS	48.6899	9.2220	STUTTGART/TRAIN STATION
ZYI	27.5900	106.9997	Zunyi
ZYL	24.9613	91.8716	Sylhet
ZYN	43.8667	4.4000	Nimes Rail FR
ZYR	50.8483	4.3496	Brussels Midi Rail BE
ZYZ	51.2167	4.4167	XXX
ZZO	50.6683	142.7600	Zonalnoye
ZZU	-11.4448	34.0118	  Mzuzu
ZZV	39.9445	-81.8921	ZANESVILLE MUNI AIRPORT
\.


--
-- Data for Name: alliances; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY alliances (id, name, airline_list) FROM stdin;
1	Star Alliance	A3 AC AV BR CA CM ET JP KF LH LO LX MS NH NZ OS OU OZ PZ SA SK SN SQ TA TG TK TP UA ZH
2	oneworld	4M AA AB BA CX AY HG IB JC JJ JL JO KA LA LP MA MH MN MX NU QF QR RJ S7 UL US XL
3	SkyTeam	AF AE AM AR AZ CI CZ DL FM GA KE KL KQ ME MF MU OK RO SU SV UX VN
\.


--
-- Data for Name: equipments; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY equipments (equipment_id, name) FROM stdin;
100	Fokker 100
141	British Aerospace BAe 146-100
142	British Aerospace BAe 146-200
143	British Aerospace BAe 146-300
146	British Aerospace BAe 146
14F	British Aerospace BAe 146 Freighter
14X	British Aerospace BAe 146-100QT/QC
14Y	British Aerospace BAe 146-200QT/QC
14Z	British Aerospace BAe 146-300QT/QC
310	Airbus Industrie A310
312	Airbus Industrie A310-200
313	Airbus Industrie A310-300
318	Airbus Industrie A318
319	Airbus Industrie A319
31F	Airbus Industrie A310 Freighter
31X	Airbus Industrie A310-200 Freighter
31Y	Airbus Industrie A310-300 Freighter
320	Airbus Industrie A320
321	Airbus Industrie A321
32A	Airbus Industrie A320-200 (Sharklets)
32B	Airbus Industrie A321-200 (Sharklets)
32S	Airbus Industrie A318/319/320/321
330	Airbus Industrie A330
332	Airbus Industrie A330-200
333	Airbus Industrie A330-300
340	Airbus Industrie A340
342	Airbus Industrie A340-200
343	Airbus Industrie A340-300
345	Airbus Industrie A340-500
346	Airbus Industrie A340-600
380	Airbus Industrie A380
388	Airbus Industrie A380-800
38F	Airbus Industrie A380 Freighter
703	Boeing 707-300
707	Boeing 707/720
70F	Boeing 707-300 Freighter
70M	Boeing 707-300 Combi
717	Boeing 717-200
721	Boeing 727-100
722	Boeing 727-200
727	Boeing 727
72A	Boeing 727-200 Advanced
72B	Boeing 727-100 Combi
72C	Boeing 727-200 Combi
72F	Boeing 727 Freighter
72M	Boeing 727 Combi
72S	Boeing 727-200
72X	Boeing 727-100 Freighter
72Y	Boeing 727-200 Freighter
731	Boeing 737-100
732	Boeing 737-200
733	Boeing 737-300
734	Boeing 737-400
735	Boeing 737-500
736	Boeing 737-600
737	Boeing 737
738	Boeing 737-800
739	Boeing 737-900
73A	Boeing 737-200/200C Advanced
73C	Boeing 737-300
73E	Boeing 737-900ER
73F	Boeing 737 Freighter
73G	Boeing 737-700
73H	Boeing 737-800 With Winglets
73J	Boeing 737-900 With Winglets
73N	Boeing 737-300 Mixed Config
73M	Boeing 737-200 Combi
73P	Boeing 737-400 Freighter
73Q	Boeing 737-400 Mixed Config
73R	Boeing 737-700 Combi
73S	Boeing 737 Advanced
73W	Boeing 737-700 With Winglets
73X	Boeing 737-200 Freighter
73Y	Boeing 737-300 Freighter
741	Boeing 747-100
742	Boeing 747-200
743	Boeing 747-300 (including -100SUD and -200SUD)
744	Boeing 747-400
747	Boeing 747
74C	Boeing 747-200 Combi
74D	Boeing 747-300 Combi (including -200SUD)
74F	Boeing 747 Freighter
74E	Boeing 747-400 Combi
74H	Boeing 747-8 Intercontinental
74J	Boeing 747-400 Domestic
74L	Boeing 747SP
74M	Boeing 747 Combi
74T	Boeing 747-100 Freighter
74U	Boeing 747-300 Freighter
74V	Boeing 747SR Freighter
74X	Boeing 747-200 Freighter
74Y	Boeing 747-400 Freighter
752	Boeing 757-200
753	Boeing 757-300
75T	Boeing 757-300 With Winglets
75W	Boeing 757-200 With Winglets
757	Boeing 757
75F	Boeing 757-200 Freighter
75M	Boeing 757-200 Combi
762	Boeing 767-200
763	Boeing 767-300
764	Boeing 767-400
767	Boeing 767
76F	Boeing 767 Freighter
76W	Boeing 767 Winglets
76X	Boeing 767-200 Freighter
76Y	Boeing 767-300 Freighter
772	Boeing 777-200/200ER
773	Boeing 777-300
777	Boeing 777
77L	Boeing 777-200LR
77W	Boeing 777-300ER
787	Boeing 787
788	Boeing 787-8
A26	Antonov An-26
A28	Antonov An-28
A30	Antonov An-30
A32	Antonov An-32
A40	Antonov An-140
A4F	Antonov An-124 Ruslan
A58	Antonov An-158
A81	Antonov An-148-100
AB3	Airbus Industrie A300
AB4	Airbus Industrie A300B2/B4/C4
AB6	Airbus Industrie A300-600
ABB	Airbus Industrie A300-600ST Beluga
ABF	Airbus Industrie A300 Freighter
ABX	Airbus Industrie A300B4/C4/F4 Freighter
ABY	Airbus Industrie A300-600 Freighter
ACD	Twin Aero Commander/Turbo/Jetprop
AGH	Agusta A109
AN4	Antonov An-24
AN6	Antonov An-26/30/32
AN7	Antonov An-72/74
ANF	Antonov An-12
AR1	Avro RJ100 Avroliner
AR7	Avro RJ70 Avroliner
AR8	Avro RJ85 Avroliner
ARJ	Avro RJ Avroliner
ARX	Avro RJX
AT4	Aerospatiale/Alenia ATR 42-300/320
AT5	Aerospatiale/Alenia ATR 42-500
AT7	Aerospatiale/Alenia ATR 72
ATP	British Aerospace ATP
ATR	Aerospatiale/Alenia ATR
AX1	Avro RJX100
AX8	Avro RJX85
B11	British Aerospace BAC One Eleven
B12	British Aerospace BAC One Eleven 200
B13	British Aerospace BAC One Eleven 300
B14	British Aerospace BAC One Eleven 400
B15	British Aerospace BAC One Eleven 500
B72	Boeing 720B
BE1	Beechcraft Beech 1900
BE2	Beechcraft twin piston
BE9	Beechcraft Airliner 99
BEC	Beechcraft Light Aircraft
BEH	Beechcraft Beech 1900D
BES	Beechcraft Beech 1900C
BET	Beechcraft Light Aircraft Twin Prop
BH2	Bell Helicopters
BNI	Pilatus Britten-Norman BN-2A/B
BNT	Pilatus Britten-Norman BN-2A Trislander
BUS	Non Aircraft - Bus
CCJ	Canadair Challenger
CD2	Government Aircraft Factories N22B/N24A Nomad
CN1	Cessna light aircraft - single piston engine
CN2	Cessna light aircraft - twin piston engines
CNA	Cessna Light Aircraft
CNC	Cessna light aircraft - single turboprop engine
CNJ	Cessna Citation
CNT	Cessna light aircraft - twin turboprop engines
CR1	Canadair Regional Jet 100
CR2	Canadair Regional Jet 200
CR7	Canadair Regional Jet 700
CR9	Canadair Regional Jet 900
CRA	Canadair Regional Jet 705
CRJ	Canadair Regional Jet
CRK	Canadair Regional Jet 1000
CRV	Aerospatiale/SUD SE210 Caravelle
CS2	CASA/IPTN CN-212 Aviocar
CS5	CASA/IPTN CN-235
CV5	Convair 580
CVF	Convair 580/600/640 Freighter
CWC	Curtiss C-46 Commando
CVR	Convair 240/440/580
D10	Boeing/McDonnell Douglas DC-10
D11	Boeing/McDonnell Douglas DC-10-10/15
D1C	Boeing/McDonnell Douglas DC-10-30/40
D1F	Boeing/McDonnell Douglas DC-10 Freighter
D1X	Boeing/McDonnell Douglas DC-10-10 Freighter
D1Y	Boeing/McDonnell Douglas DC-10-30/40 Freighter
D28	Fairchild Dornier Do-228
D38	Fairchild Dornier Do-328
D3F	Boeing/Douglas DC-3 Freighter
D6F	Boeing/Douglas DC-6A/B/C Freighter
D8F	Boeing/McDonnell Douglas DC-8 Freighter
D8L	Boeing/McDonnell Douglas DC-8-62
D8M	Boeing/McDonnell Douglas DC-8 Combi
D8Q	Boeing/McDonnell Douglas DC-8-72
D8T	Boeing/McDonnell Douglas DC-8-50 Freighter
D8X	Boeing/McDonnell Douglas DC-8-61/62/63 Freighter
D8Y	Boeing/McDonnell Douglas DC-8-71/72/73 Freighter
D91	Boeing/McDonnell Douglas DC-9-10
D92	Boeing/McDonnell Douglas DC-9-20
D93	Boeing/McDonnell Douglas DC-9-30
D94	Boeing/McDonnell Douglas DC-9-40
D95	Boeing/McDonnell Douglas DC-9-50
D9C	Boeing/McDonnell Douglas DC-9-30 Freighter
D9F	Boeing/McDonnell Douglas DC-9-40 Freighter
D9S	Boeing/McDonnell Douglas DC-9-30/40/50
D9X	Boeing/McDonnell Douglas DC-9-10 Freighter
DC3	Boeing/Douglas DC-3
DC6	Boeing/Douglas DC-6
DC8	Boeing/McDonnell Douglas DC-8
DC9	Boeing/McDonnell Douglas DC-9
DCF	Boeing/McDonnell Douglas DC-9 Freighter
DH1	De Havilland Canada DHC-8-100 Dash 8/8Q
DH2	De Havilland Canada DHC-8-200 Dash 8/8Q
DH3	De Havilland Canada DHC-8-300 Dash 8/8Q
DH4	De Havilland Canada DHC-8-400 Dash 8/8Q
DH7	De Havilland Canada DHC-7 Dash 7
DH8	De Havilland Canada DHC-8 Dash 8 All S.
DHC	De Havilland Canada DHC-4 Caribou
DHL	De Havilland Canada DHC-3 Turbo Otter
DHP	De Havilland Canada DHC-2 Beaver
DHS	De Havilland Canada DHC-3 Otter
DHT	De Havilland Canada DHC-6 Twin Otter
E70	Embraer ERJ-170
E75	Embraer ERJ-175
E90	Embraer ERJ-190
E95	Embraer ERJ-195
EM2	Embraer EMB-120 Brasilia
EM9	Embraer E190
EMB	Embraer EMB-110 Bandeirante
EMJ	Embraer ERJ-170/190
ER3	Embraer ERJ-135 Regional Jet
ER4	Embraer ERJ-145 Regional Jet
ERD	Embraer ERJ-140 Regional Jet
ERJ	Embraer ERJ-135/140/145 Regional Jet
F21	Fokker F28 Fellowship 1000
F22	Fokker F28 Fellowship 2000
F23	Fokker F28 Fellowship 3000
F24	Fokker F28 Fellowship 4000
F27	Fokker F27 Friendship/Fairchild F27
F28	Fokker F28 Fellowship
F50	Fokker 50
F70	Fokker 70
FA7	Fairchild Dornier 728JET
FK7	Fairchild FH227
FRJ	Fairchild Dornier 328JET
GRG	Grumman G-21 Goose
GRM	Grumman G-73 Turbo Mallard
HEC	Helio H-250 Courier/H-295/395 Super Courier
HS7	British Aerospace/Hawker Siddeley HS748
I14	Ilyushin IL-114
I93	Ilyushin IL-96-300
I9F	Ilyushin IL-96 Freighter
I9M	Ilyushin IL-96M
I9Y	Ilyushin IL-96T
IL6	Ilyushin IL-62
IL7	Ilyushin IL-76
IL8	Ilyushin IL-18
IL9	Ilyushin IL-96
ILW	Ilyushin IL-86
J31	British Aerospace Jetstream 31
J32	British Aerospace Jetstream 32
J41	British Aerospace Jetstream 41
JST	British Aerospace Jetstream 31/32/41
JU5	Junkers Ju52
L10	Lockheed L-1011 Tristar
L11	Lockheed L-1011-1/50/100/150/200/250
L15	Lockheed L-1011-500 Tristar
L1F	Lockheed L-1011 Tristar Freighter
L4T	Let 410 Turbolet
LCH	Non Aircraft - Launch/Boat
LMO	Non Aircraft - Limousine
LOE	Lockheed L-188 Electra
LOH	Lockheed L-100 Hercules
LRJ	Learjet
M11	Boeing/McDonnell Douglas MD-11
M1F	Boeing/McDonnell Douglas MD-11 Freighter
M1M	Boeing/McDonnell Douglas MD-11 Combi
M80	Boeing/McDonnell Douglas MD-80
M81	Boeing/McDonnell Douglas MD-81
M82	Boeing/McDonnell Douglas MD-82
M83	Boeing/McDonnell Douglas MD-83
M87	Boeing/McDonnell Douglas MD-87
M88	Boeing/McDonnell Douglas MD-88
M90	Boeing/McDonnell Douglas MD-90
MA6	Xian MA6
MIH	Mil
MU2	Mitsubishi MU-2
ND2	Aerospatiale/Nord 262
NDC	Aerospatiale SN601 Corvette
NDE	Aerospatiale/Eurocopter Ecureuil AS350/AS355
PA1	Piper light aircraft - single piston engine
PA2	Piper light aircraft - twin piston engines
PAG	Piper Light Aircraft
PL2	Pilatus PC-12
PN6	Partenavia P68
S20	Saab 2000
SF3	Saab SF-340
SFB	Saab SF-340B
SSC	Aerospatiale/British Aerospace Concorde (discontinued)
SH3	Shorts SD-330
SH6	Shorts SD-360
S58	Sikorsky S-58T
S61	Sikorsky S-61
S76	Sikorsky S-76
SU1	Sukhoi Superjet
SU9	Sukhoi Superjet 100
SWM	Fairchild Metro/Merlin
T20	Tupolev Tu-204/214
TU3	Tupolev Tu-134
TU5	Tupolev Tu-154
TRN	Non Aircraft - Train
VCV	Vickers Viscount
WWP	Israel Aircraft Industries 1124 Westwind
YK2	Yakovlev Yak-42
YK4	Yakovlev Yak-40
YN2	Yunshuji Y-12/Xian Y-12
YN7	Yunshuji Y-7/Harbin Y-7
YS1	NAMC YS-11
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY flights (id, route_id, departure, price, sales_id) FROM stdin;
1	1	30/06/2016 - 16:00	200	\N
2	1	30/06/2016 - 12:00	200	\N
3	1	30/06/2016 - 08:00	300	\N
4	2	02/07/2016 - 12:00	89	\N
5	2	02/07/2016 - 13:00	0	\N
6	2	02/07/2016 - 20:00	100	\N
7	3	05/07/2016 - 08:00	400	\N
8	4	5/07/2016 - 07:00	600	\N
9	4	01/07/2016 - 16:00	500	\N
10	5	10/07/2016 - 07:00	100	\N
11	6	15/07/2016 - 09:00	9	\N
12	7	13/07/2016 - 12:00	100	\N
13	8	15/07/2016 - 07:00	600	\N
14	8	15/07/2016 - 9:00	500	\N
15	8	15/07/2016 - 10:00	300	\N
16	8	15/07/2016 - 06:00	200	\N
17	9	28/07/2016 - 07:00	600	\N
18	9	28/07/2016 - 9:00	500	\N
19	9	28/07/2016 - 23:00	300	\N
20	10	28/06/2016 - 07:00	200	\N
21	10	28/06/2016 - 9:00	300	\N
22	10	28/06/2016 - 23:00	350	\N
23	11	29/06/2016 - 07:00	200	\N
24	11	29/06/2016 - 9:00	300	\N
25	11	29/06/2016 - 23:00	350	\N
\.


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acmeuser
--

SELECT pg_catalog.setval('flights_id_seq', 25, true);


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY routes (id, airline_id, "from", "to", codeshare, stops, equipment) FROM stdin;
1	2B	AER	KZN	\N	0	CR2
2	2B	ASF	KZN	\N	0	CR2
3	2B	ASF	MRV	\N	0	CR2
4	2B	CEK	KZN	\N	0	CR2
5	2B	CEK	OVB	\N	0	CR2
6	2B	DME	KZN	\N	0	CR2
7	2B	DME	NBC	\N	0	CR2
8	2B	DME	TGK	\N	0	CR2
9	2B	DME	UUA	\N	0	CR2
10	2B	EGO	KGD	\N	0	CR2
11	2B	EGO	KZN	\N	0	CR2
12	2B	GYD	NBC	\N	0	CR2
13	2B	KGD	EGO	\N	0	CR2
14	2B	KZN	AER	\N	0	CR2
15	2B	KZN	ASF	\N	0	CR2
16	2B	KZN	CEK	\N	0	CR2
17	2B	KZN	DME	\N	0	CR2
18	2B	KZN	EGO	\N	0	CR2
19	2B	KZN	LED	\N	0	CR2
20	2B	KZN	SVX	\N	0	CR2
21	2B	LED	KZN	\N	0	CR2
22	2B	LED	NBC	\N	0	CR2
23	2B	LED	UUA	\N	0	CR2
24	2B	MRV	ASF	\N	0	CR2
25	2B	NBC	DME	\N	0	CR2
26	2B	NBC	GYD	\N	0	CR2
27	2B	NBC	LED	\N	0	CR2
28	2B	NBC	SVX	\N	0	CR2
29	2B	NJC	SVX	\N	0	CR2
30	2B	NJC	UUA	\N	0	CR2
31	2B	NUX	SVX	\N	0	CR2
32	2B	OVB	CEK	\N	0	CR2
33	2B	OVB	SVX	\N	0	CR2
34	2B	SVX	KZN	\N	0	CR2
35	2B	SVX	NBC	\N	0	CR2
36	2B	SVX	NJC	\N	0	CR2
37	2B	SVX	NUX	\N	0	CR2
38	2B	SVX	OVB	\N	0	CR2
39	2B	TGK	DME	\N	0	CR2
40	2B	UUA	DME	\N	0	CR2
41	2B	UUA	LED	\N	0	CR2
42	2B	UUA	NJC	\N	0	CR2
43	2G	BTK	IKT	\N	0	A81
44	2G	BTK	OVB	\N	0	A81
45	2G	CEK	OVB	\N	0	A81
46	2G	HTA	IKT	\N	0	AN4
47	2G	IKT	BTK	\N	0	A81
48	2G	IKT	HTA	\N	0	AN4
49	2G	IKT	KCK	\N	0	AN4
50	2G	IKT	ODO	\N	0	AN4
51	2G	IKT	OVB	\N	0	A81
52	2G	IKT	UKX	\N	0	AN4
53	2G	IKT	ULK	\N	0	AN4
54	2G	IKT	YKS	\N	0	A81
55	2G	KCK	IKT	\N	0	AN4
56	2G	MJZ	OVB	\N	0	A81
57	2G	ODO	IKT	\N	0	AN4
58	2G	OVB	BTK	\N	0	A81
59	2G	OVB	CEK	\N	0	A81
60	2G	OVB	IKT	\N	0	A81
61	2G	UKX	IKT	\N	0	AN4
62	2G	ULK	IKT	\N	0	AN4
63	2G	YKS	IKT	\N	0	A81
64	2I	AYP	LIM	\N	0	142
65	2I	CUZ	LIM	\N	0	142141
66	2I	CUZ	PEM	\N	0	142
67	2I	HUU	LIM	\N	0	141
68	2I	IQT	PCL	\N	0	143
69	2I	IQT	TPP	\N	0	142
70	2I	LIM	AYP	\N	0	142
71	2I	LIM	CUZ	\N	0	142141
72	2I	LIM	HUU	\N	0	141
73	2I	LIM	PCL	\N	0	143146
74	2I	LIM	TPP	\N	0	142146
75	2I	PCL	IQT	\N	0	143
76	2I	PCL	LIM	\N	0	143146
77	2I	PCL	TPP	\N	0	146
78	2I	PEM	CUZ	\N	0	142
79	2I	TPP	IQT	\N	0	142
80	2I	TPP	LIM	\N	0	142146
81	2I	TPP	PCL	\N	0	146
82	2J	ABJ	BOY	\N	0	CRJ
83	2J	ABJ	OUA	\N	0	E70CRJM87
84	2J	ACC	OUA	\N	0	CRJ
85	2J	BKO	ABJ	\N	0	M87
86	2J	BKO	DKR	\N	0	M87
87	2J	BKO	OUA	\N	0	CRJ
88	2J	BOY	ABJ	\N	0	CRJ
89	2J	BOY	OUA	\N	0	CRJ
90	2J	COO	LFW	\N	0	M87
91	2J	COO	OUA	\N	0	M87
92	2J	DKR	BKO	\N	0	M87
93	2J	DKR	OUA	\N	0	M87
94	2J	LFW	OUA	\N	0	M87CRJ
95	2J	NIM	OUA	\N	0	CRJ
96	2J	OUA	ABJ	\N	0	E70CRJM87
97	2J	OUA	ACC	\N	0	CRJ
98	2J	OUA	BKO	\N	0	M87CRJ
99	2J	OUA	BOY	\N	0	CRJ
100	2J	OUA	COO	\N	0	M87
101	2J	OUA	DKR	\N	0	M87
102	2J	OUA	LFW	\N	0	CRJ
103	2J	OUA	NIM	\N	0	CRJ
104	2K	BOG	GYE	\N	0	319
105	2K	BOG	UIO	\N	0	319320
106	2K	CLO	GYE	\N	0	319
107	2K	GYE	BOG	\N	0	319
108	2K	GYE	CLO	\N	0	319
109	2K	GYE	SCY	\N	0	319320
110	2K	GYE	UIO	\N	0	320319
111	2K	OCC	UIO	\N	0	319
112	2K	SCY	GYE	\N	0	319320
113	2K	UIO	BOG	\N	0	319320
114	2K	UIO	GYE	\N	0	319
115	2K	UIO	OCC	\N	0	319
116	2L	BDS	ZRH	\N	0	100
117	2L	BOD	ZRH	\N	0	100
118	2L	BRS	ZRH	\N	0	100
119	2L	GVA	LPA	\N	0	319
120	2L	LCA	ZRH	\N	0	319
121	2L	LPA	ZRH	\N	0	319
122	2L	RMF	ZRH	\N	0	319
123	2L	TFS	GVA	\N	0	319
124	2L	ZRH	BDS	\N	0	100
125	2L	ZRH	BOD	\N	0	100
126	2L	ZRH	BRS	\N	0	100
127	2L	ZRH	LCA	\N	0	319
128	2L	ZRH	LPA	\N	0	319
129	2L	ZRH	RMF	\N	0	319
130	2N	AJR	LYC	\N	0	ATP
131	2N	ARN	GEV	\N	0	ATP
132	2N	ARN	HAD	\N	0	SF3
133	2N	ARN	JKG	\N	0	ATPSF3
134	2N	ARN	KRF	\N	0	ATP
135	2N	ARN	KSD	\N	0	SF3
136	2N	ARN	LYC	\N	0	ATP
137	2N	ARN	MHQ	\N	0	SF3
138	2N	ARN	OER	\N	0	ATR
139	2N	ARN	POR	\N	0	SF3
140	2N	ARN	TRF	\N	0	SF3
141	2N	ARN	VBY	\N	0	SF3ATP
142	2N	ARN	VHM	\N	0	SF3
143	2N	ARN	VXO	\N	0	SF3
144	2N	GEV	ARN	\N	0	ATP
145	2N	GEV	KRF	\N	0	ATP
146	2N	HAD	ARN	\N	0	SF3ATP
147	2N	HAD	JKG	\N	0	ATPSF3
148	2N	HAD	VXO	\N	0	SF3
149	2N	HMV	VHM	\N	0	SF3
150	2N	JKG	ARN	\N	0	ATPSF3
151	2N	JKG	HAD	\N	0	ATPSF3
152	2N	KOK	POR	\N	0	SF3
153	2N	KRF	ARN	\N	0	ATP
154	2N	KRF	GEV	\N	0	ATP
155	2N	KSD	ARN	\N	0	SF3
156	2N	LYC	AJR	\N	0	ATP
157	2N	LYC	ARN	\N	0	ATP
158	2N	MHQ	ARN	\N	0	SF3
159	2N	MHQ	TKU	\N	0	SF3
160	2N	OER	ARN	\N	0	ATR
161	2N	OSL	VXO	\N	0	SF3
162	2N	POR	ARN	\N	0	SF3
163	2N	POR	KOK	\N	0	SF3
164	2N	TKU	MHQ	\N	0	SF3
165	2N	TRF	ARN	\N	0	SF3
166	2N	VBY	ARN	\N	0	SF3ATP
167	2N	VHM	ARN	\N	0	SF3
168	2N	VHM	HMV	\N	0	SF3
169	2N	VXO	ARN	\N	0	SF3
170	2N	VXO	OSL	\N	0	SF3
171	2O	ADQ	AOS	\N	0	BNI
172	2O	ADQ	KKB	\N	0	BNI
173	2O	ADQ	KLN	\N	0	BNI
174	2O	ADQ	KOZ	\N	0	BNI
175	2O	ADQ	OLH	\N	0	BNI
176	2O	AOS	KZB	\N	0	BNI
177	2O	KKB	SYB	\N	0	BNI
178	2O	KLN	KYK	\N	0	BNI
179	2O	KOZ	ORI	\N	0	BNI
180	2O	SYB	KPR	\N	0	BNI
181	2P	BSO	MNL	\N	0	DH4
182	2P	BXU	MNL	\N	0	320
183	2P	CBO	MNL	\N	0	320
184	2P	CGY	MNL	\N	0	320
185	2P	CRM	MNL	\N	0	DH4
186	2P	DGT	MNL	\N	0	320
187	2P	DWC	MNL	\N	0	330
188	2P	GES	MNL	*	0	320
189	2P	KLO	MNL	\N	0	320
190	2P	KLO	MNL	*	0	320
191	2P	LGP	MNL	\N	0	320
192	2P	MNL	BSO	\N	0	DH4
193	2P	MNL	BXU	\N	0	320
194	2P	MNL	CBO	\N	0	320
195	2P	MNL	CGY	\N	0	320
196	2P	MNL	CRM	\N	0	DH4
197	2P	MNL	DGT	\N	0	320
198	2P	MNL	DWC	\N	0	330
199	2P	MNL	GES	*	0	320
200	2P	MNL	KLO	\N	0	320
201	2P	MNL	KLO	*	0	320
202	2P	MNL	LGP	\N	0	320
203	2P	MNL	MPH	\N	0	DH3
204	2P	MNL	OZC	\N	0	320
205	2P	MNL	PPS	\N	0	320
206	2P	MNL	RXS	\N	0	320
207	2P	MNL	SUG	\N	0	DH4
208	2P	MNL	TUG	\N	0	DH4
209	2P	MNL	ZAM	\N	0	320
210	2P	MPH	MNL	\N	0	DH3
211	2P	OZC	MNL	\N	0	320
212	2P	PPS	MNL	\N	0	320
213	2P	RXS	MNL	\N	0	320
214	2P	SUG	MNL	\N	0	DH4
215	2P	TUG	MNL	\N	0	DH4
216	2P	ZAM	MNL	\N	0	320
217	2Z	AUX	PMW	\N	0	AT7
218	2Z	BRA	BSB	\N	0	AT7
219	2Z	BRA	SSA	\N	0	AT7
220	2Z	BSB	BRA	\N	0	AT7
221	2Z	BSB	OPS	\N	0	AT7
222	2Z	BSB	RAO	\N	0	AT7
223	2Z	CAC	GRU	\N	0	AT7
224	2Z	CGB	GYN	\N	0	AT7
225	2Z	CGB	OPS	\N	0	AT7
226	2Z	CGR	DOU	\N	0	AT7
227	2Z	DOU	CGR	\N	0	AT7
228	2Z	DOU	GRU	\N	0	AT7
229	2Z	GIG	RAO	\N	0	AT7
230	2Z	GRU	CAC	\N	0	AT7
231	2Z	GRU	DOU	\N	0	AT7
232	2Z	GRU	RAO	\N	0	AT7
233	2Z	GRU	UBA	\N	0	AT7
234	2Z	GRU	UDI	\N	0	AT7
235	2Z	GRU	VDC	\N	0	AT7
236	2Z	GYN	CGB	\N	0	AT7
237	2Z	GYN	PMW	\N	0	AT7
238	2Z	GYN	RAO	\N	0	AT7
239	2Z	GYN	UDI	\N	0	AT7
240	2Z	OPS	BSB	\N	0	AT7
241	2Z	OPS	CGB	\N	0	AT7
242	2Z	PLU	RAO	\N	0	AT7
243	2Z	PMW	AUX	\N	0	AT7
244	2Z	PMW	GYN	\N	0	AT7
245	2Z	RAO	BSB	\N	0	AT7
246	2Z	RAO	GIG	\N	0	AT7
247	2Z	RAO	GRU	\N	0	AT7
248	2Z	RAO	GYN	\N	0	AT7
249	2Z	RAO	PLU	\N	0	AT7
250	2Z	RAO	SJP	\N	0	AT7
251	2Z	RAO	UDI	\N	0	AT7
252	2Z	SJP	RAO	\N	0	AT7
253	2Z	SSA	BRA	\N	0	AT7
254	2Z	SSA	VDC	\N	0	AT7
255	2Z	UBA	GRU	\N	0	AT7
256	2Z	UBA	UDI	\N	0	AT7
257	2Z	UDI	GRU	\N	0	AT7
258	2Z	UDI	GYN	\N	0	AT7
259	2Z	UDI	RAO	\N	0	AT7
260	2Z	UDI	UBA	\N	0	AT7
261	2Z	VDC	GRU	\N	0	AT7
262	2Z	VDC	SSA	\N	0	AT7
263	3E	BRL	ORD	\N	0	CNC
264	3E	BRL	STL	\N	0	CNC
265	3E	DEC	ORD	\N	0	CNC
266	3E	DEC	STL	\N	0	CNC
267	3E	JBR	STL	\N	0	CNC
268	3E	ORD	BRL	\N	0	CNC
269	3E	ORD	DEC	\N	0	CNC
270	3E	STL	BRL	\N	0	CNC
271	3E	STL	DEC	\N	0	CNC
272	3E	STL	JBR	\N	0	CNC
273	3F	CGA	HYL	\N	0	DHP
274	3F	CGA	KTN	\N	0	DHP
275	3F	HYL	CGA	\N	0	DHP
276	3F	HYL	KTB	\N	0	DHP
277	3F	HYL	KTN	\N	0	DHP
278	3F	KTB	HYL	\N	0	DHP
279	3F	KTB	KTN	\N	0	DHP
280	3F	KTN	CGA	\N	0	DHP
281	3F	KTN	HYL	\N	0	DHP
282	3F	KTN	KTB	\N	0	DHP
283	3F	KTN	MTM	\N	0	DHP
284	3F	MTM	KTN	\N	0	DHP
285	3G	ACC	DKR	\N	0	319
286	3G	ACC	LOS	\N	0	319
287	3G	ACC	ROB	\N	0	319
288	3G	BCN	BJL	\N	0	319
289	3G	BJL	BCN	\N	0	319
290	3G	BJL	DKR	\N	0	319
291	3G	BJL	FNA	\N	0	319
292	3G	CKY	OXB	\N	0	319
293	3G	DKR	ACC	\N	0	319
294	3G	DKR	BJL	\N	0	319
295	3G	DKR	DLA	\N	0	319
296	3G	DKR	FNA	\N	0	319
297	3G	DKR	LOS	\N	0	319
298	3G	DKR	OXB	\N	0	319
299	3G	DLA	DKR	\N	0	319
300	3G	DLA	LOS	\N	0	319
301	3G	FNA	BJL	\N	0	319
302	3G	FNA	DKR	\N	0	319
303	3G	FNA	LGW	\N	0	319
304	3G	FNA	ROB	\N	0	319
305	3G	LGW	FNA	\N	0	319
306	3G	LOS	ACC	\N	0	319
307	3G	LOS	DKR	\N	0	319
308	3G	LOS	DLA	\N	0	319
309	3G	LOS	ROB	\N	0	319
310	3G	OXB	CKY	\N	0	319
311	3G	OXB	DKR	\N	0	319
312	3G	ROB	ACC	\N	0	319
313	3G	ROB	FNA	\N	0	319
314	3G	ROB	LOS	\N	0	319
315	3H	AKV	YIK	\N	0	DH8
316	3H	AKV	YPX	\N	0	DH8
317	3H	XGR	YVP	\N	0	DHTBET
318	3H	YGL	YGW	\N	0	DHT
319	3H	YGL	YPX	\N	0	73M
320	3H	YGL	YUL	\N	0	73M
321	3H	YGW	YGL	\N	0	DHT
322	3H	YGW	YPH	\N	0	BET
323	3H	YGW	YSK	\N	0	DH8
324	3H	YGW	YUD	\N	0	DH8
325	3H	YGW	YUL	\N	0	DH8
326	3H	YGW	YUY	\N	0	DH8
327	3H	YIK	AKV	\N	0	DH8
328	3H	YIK	YZG	\N	0	DH8
329	3H	YKG	YPJ	\N	0	DHTDH8
330	3H	YKG	YQC	\N	0	DH8
331	3H	YKG	YVP	\N	0	DH8DHT
332	3H	YKL	YQB	\N	0	DH8
333	3H	YKL	YVP	\N	0	DH8BET
334	3H	YKL	YWK	\N	0	BET
335	3H	YKL	YZV	\N	0	BETDH8
336	3H	YPH	YPX	\N	0	DH8BET
337	3H	YPH	YUD	\N	0	DH8
338	3H	YPH	YVP	\N	0	BET
339	3H	YPJ	YKG	\N	0	DHTDH8
340	3H	YPJ	YTQ	\N	0	DHTDH8
341	3H	YPJ	YVP	\N	0	DHT
342	3H	YPX	AKV	\N	0	DH8
343	3H	YPX	YGL	\N	0	73M
344	3H	YPX	YPH	\N	0	DH8
345	3H	YPX	YVP	\N	0	BET
346	3H	YQB	YKL	\N	0	DH8
347	3H	YQB	YUL	\N	0	DH8
348	3H	YQC	YKG	\N	0	DH8
349	3H	YQC	YWB	\N	0	DH8
350	3H	YSK	YGW	\N	0	DH8
351	3H	YSK	YUD	\N	0	DH8
352	3H	YTQ	YPJ	\N	0	DHTDH8
353	3H	YTQ	YVP	\N	0	DHTDH8
354	3H	YUD	YGW	\N	0	DH8
355	3H	YUD	YPH	\N	0	DH8
356	3H	YUD	YSK	\N	0	DH8
357	3H	YUL	YGL	\N	0	73M
358	3H	YUL	YGW	\N	0	DH8
359	3H	YUL	YQB	\N	0	DH8
360	3H	YUL	YUY	\N	0	DH8
361	3H	YUY	YGW	\N	0	DH8
362	3H	YUY	YUL	\N	0	DH8
363	3H	YVP	XGR	\N	0	DHTBET
364	3H	YVP	YGW	\N	0	BET
365	3H	YVP	YKG	\N	0	DH8
366	3H	YVP	YKL	\N	0	DH8BET
367	3H	YVP	YPH	\N	0	BET
368	3H	YVP	YPJ	\N	0	DHT
369	3H	YVP	YPX	\N	0	BET
370	3H	YVP	YTQ	\N	0	DHTDH8
371	3H	YWB	YQC	\N	0	DH8
372	3H	YWB	YZG	\N	0	DH8
373	3H	YWK	YKL	\N	0	BET
374	3H	YWK	YZV	\N	0	BET
375	3H	YZG	YIK	\N	0	DH8
376	3H	YZG	YWB	\N	0	DH8
377	3H	YZV	YKL	\N	0	BETDH8
378	3H	YZV	YWK	\N	0	BET
379	3J	JIB	DXB	\N	0	737
380	3J	JIB	JED	\N	0	737
381	3J	JIB	MGQ	\N	0	737
382	3J	MGQ	NBO	\N	0	737
383	3J	NBO	MGQ	\N	0	737
384	3K	BKK	SIN	\N	0	320
385	3K	DRW	SIN	\N	0	320
386	3K	HAK	SIN	\N	0	320
387	3K	HGH	SIN	\N	0	320
388	3K	HKG	SIN	\N	0	320
389	3K	HKT	SIN	\N	0	320
390	3K	KIX	MNL	\N	0	320
391	3K	KIX	TPE	\N	0	320
392	3K	KUL	SIN	\N	0	320
393	3K	MNL	KIX	\N	0	320
394	3K	MNL	SIN	\N	0	320
395	3K	PEN	SIN	\N	0	320
396	3K	PER	SIN	\N	0	320
397	3K	PNH	SIN	\N	0	320
398	3K	REP	SIN	\N	0	320
399	3K	RGN	SIN	\N	0	320
400	3K	SGN	SIN	\N	0	320
401	3K	SIN	BKK	\N	0	320
402	3K	SIN	DRW	\N	0	320
403	3K	SIN	HAK	\N	0	320
404	3K	SIN	HGH	\N	0	320
405	3K	SIN	HKG	\N	0	320
406	3K	SIN	HKT	\N	0	320
407	3K	SIN	KUL	\N	0	320
408	3K	SIN	MNL	\N	0	320
409	3K	SIN	PEN	\N	0	320
410	3K	SIN	PER	\N	0	320
411	3K	SIN	PNH	\N	0	320
412	3K	SIN	REP	\N	0	320
413	3K	SIN	RGN	\N	0	320
414	3K	SIN	SGN	\N	0	320
415	3K	SIN	SWA	\N	0	320
416	3K	SIN	TPE	\N	0	320
417	3K	SWA	SIN	\N	0	320
418	3K	TPE	KIX	\N	0	320
419	3K	TPE	SIN	\N	0	320
420	3L	ACH	EBA	\N	0	DH3
421	3L	DRS	ZRH	\N	0	DH3
422	3L	DUS	FDH	\N	0	DH3
423	3L	EBA	ACH	\N	0	DH3
424	3L	EBA	FDH	\N	0	DH3
425	3L	EBA	MUC	\N	0	DH3
426	3L	EBA	ZRH	\N	0	DH3
427	3L	FDH	DUS	\N	0	DH3
428	3L	FDH	EBA	\N	0	DH3
429	3L	FDH	HAM	\N	0	AT7
430	3L	FDH	OLB	\N	0	AT7
431	3L	FDH	TXL	\N	0	AT7
432	3L	FDH	ZAD	\N	0	AT7
433	3L	FMM	NAP	\N	0	AT7
434	3L	GRZ	ZRH	\N	0	DH3
435	3L	HAM	FDH	\N	0	AT7
436	3L	MUC	EBA	\N	0	DH3
437	3L	NAP	FMM	\N	0	AT7
438	3L	OLB	FDH	\N	0	AT7
439	3L	SZG	ZRH	\N	0	DH3
440	3L	TXL	FDH	\N	0	AT7
441	3L	ZAD	FDH	\N	0	AT7
442	3L	ZRH	DRS	\N	0	DH3
443	3L	ZRH	EBA	\N	0	DH3
444	3L	ZRH	GRZ	\N	0	DH3
445	3L	ZRH	SZG	\N	0	DH3
446	3M	ATL	LWB	\N	0	SF3
447	3M	ATL	MCN	\N	0	SF3
448	3M	ATL	MEI	\N	0	SF3
449	3M	ATL	MSL	\N	0	SF3
450	3M	ATL	PIB	\N	0	SF3
451	3M	ATL	TUP	\N	0	SF3
452	3M	BIM	FLL	\N	0	SF3
453	3M	ELH	FLL	\N	0	SF3
454	3M	ELH	PBI	\N	0	SF3
455	3M	EYW	FLL	\N	0	SF3
456	3M	EYW	RSW	\N	0	SF3
457	3M	EYW	TPA	\N	0	SF3
458	3M	FLL	BIM	\N	0	SF3
459	3M	FLL	ELH	\N	0	SF3
460	3M	FLL	EYW	\N	0	SF3
461	3M	FLL	FPO	\N	0	SF3
462	3M	FLL	GGT	\N	0	SF3
463	3M	FLL	GHB	\N	0	SF3
464	3M	FLL	MCO	\N	0	SF3
465	3M	FLL	MHH	\N	0	SF3
466	3M	FLL	TCB	\N	0	SF3
467	3M	FLL	TPA	\N	0	SF3
468	3M	FPO	FLL	\N	0	SF3
469	3M	GGT	FLL	\N	0	SF3
470	3M	GGT	GHB	\N	0	SF3
471	3M	GHB	FLL	\N	0	SF3
472	3M	GLH	TUP	\N	0	SF3
473	3M	GNV	MCO	\N	0	SF3
474	3M	GNV	TPA	\N	0	SF3
475	3M	JAX	MHH	\N	0	SF3
476	3M	JAX	TPA	\N	0	SF3
477	3M	LWB	ATL	\N	0	SF3
478	3M	MCN	ATL	\N	0	SF3
479	3M	MCN	MCO	\N	0	SF3
480	3M	MCO	FLL	\N	0	SF3
481	3M	MCO	GNV	\N	0	SF3
482	3M	MCO	MCN	\N	0	SF3
483	3M	MCO	MHH	\N	0	SF3
484	3M	MCO	PNS	\N	0	SF3
485	3M	MCO	RSW	\N	0	SF3
486	3M	MCO	TLH	\N	0	SF3
487	3M	MEI	ATL	\N	0	SF3
488	3M	MHH	FLL	\N	0	SF3
489	3M	MHH	JAX	\N	0	SF3
490	3M	MHH	MCO	\N	0	SF3
491	3M	MHH	PBI	\N	0	SF3
492	3M	MSL	ATL	\N	0	SF3
493	3M	PBI	ELH	\N	0	SF3
494	3M	PBI	MHH	\N	0	SF3
495	3M	PBI	TPA	\N	0	SF3
496	3M	PIB	ATL	\N	0	SF3
497	3M	PNS	MCO	\N	0	SF3
498	3M	PNS	TPA	\N	0	SF3
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY sales (id, description, discount, alliance_id) FROM stdin;
6	Promocao de natal te da 20% de desconto.	20	1
7	Promocao de natal te da 5% de desconto.	5	2
8	Deu a louca na ACME. Passagem com 70% de desconto	70	\N
\.


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acmeuser
--

SELECT pg_catalog.setval('sales_id_seq', 8, true);


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY tickets (id, flight_id, user_id, status, seat) FROM stdin;
1	1	1	pendente	02
2	1	2	pendente	00
3	1	3	pendente	01
4	1	5	pendente	03
5	1	6	pendente	10
6	1	7	pendente	11
7	1	8	pendente	12
8	3	102	pendente	\N
9	2	102	checkin ok	13
10	2	102	checkin ok	24
11	10	102	pendente	\N
12	23	102	checkin ok	12
\.


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acmeuser
--

SELECT pg_catalog.setval('tickets_id_seq', 12, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: acmeuser
--

COPY users (id, name, document, email, password) FROM stdin;
1	Nancy Hunter	98079407684	nhunter0@blogs.com	Nm6ViuhQ6fI7
2	Randy Porter	35598372859	rporter1@fastcompany.com	ueScUMsSj
3	Sandra Austin	96431047316	saustin2@nbcnews.com	EJcohCmDctQZ
4	Donna Cunningham	61854090902	dcunningham3@alexa.com	bmgQxvrGVjlC
5	Shawn Black	36926293038	sblack4@studiopress.com	OA5jZRpUk84H
6	Eugene Ward	99400325311	eward5@google.ca	Lb9yncOZlwO
7	Jonathan Snyder	82485686594	jsnyder6@meetup.com	4nhsnnIeu
8	Louise Dixon	91301578702	ldixon7@51.la	1q4NnCUo84D
9	Kimberly Graham	94342779465	kgraham8@dedecms.com	ivYduC
10	Rose Howard	81888807613	rhoward9@berkeley.edu	nuaD6oDLGoL
11	Margaret Burns	61456838658	mburnsa@angelfire.com	xpBXiOaN5xf
12	Christopher Alexander	48188668100	calexanderb@usgs.gov	eeerSaKCTaTk
13	Adam Davis	75767548847	adavisc@stumbleupon.com	LNnzEGr6s
14	Virginia Smith	70044346484	vsmithd@weebly.com	AbhJovTxgM
15	Mary Harrison	05410554826	mharrisone@baidu.com	pWwWLKI6xcX
16	Beverly Stewart	19568079133	bstewartf@discovery.com	eG9mDSn
17	Harry Alexander	83493471306	halexanderg@com.com	xaqy67gmtE
18	Jeffrey Riley	67164110939	jrileyh@mashable.com	yV7jDIGZM5i
19	Jerry Murray	28451445541	jmurrayi@domainmarket.com	QKmBgZkE
20	James Bell	44340231678	jbellj@senate.gov	BEb8WRW
21	Alice Dixon	30307714618	adixonk@wisc.edu	6PH8BgOyY0
22	Jonathan Mccoy	42244423571	jmccoyl@yellowbook.com	P7OXit
23	Ronald Robinson	56236055724	rrobinsonm@europa.eu	WZE5vfidPFUK
24	Chris Patterson	12105041193	cpattersonn@bloglines.com	QMfwz71JkAm
25	Anne Powell	90810851143	apowello@reverbnation.com	OWJj9XB7a
26	Jonathan Woods	28456915183	jwoodsp@discovery.com	vWc4ljX
27	Douglas Coleman	78676357375	dcolemanq@sina.com.cn	FSsJzK2s0lj
28	Eugene Collins	14782574985	ecollinsr@altervista.org	WVn7MWxFcA
29	Justin Lawson	09923853923	jlawsons@archive.org	lZ3aYfc
30	Jane Gibson	30626219853	jgibsont@samsung.com	RrvHOyR8M9
31	Kathryn Little	29472876261	klittleu@github.com	JUexS1OWN
32	Sarah Anderson	34368916896	sandersonv@zdnet.com	3WnwsF0vMKT5
33	Michael Reyes	07817674505	mreyesw@tamu.edu	pqYmsgvc
34	David Morris	94346733889	dmorrisx@dropbox.com	U8ekpiJYlTM
35	Jennifer Moreno	95232809863	jmorenoy@bravesites.com	BsNDdi2Vy
36	Linda Payne	44647642406	lpaynez@yahoo.com	8vXAuZ4Hud
37	Adam Chapman	45719031054	achapman10@bloglines.com	rNSqGIg
38	Debra Hill	05677177602	dhill11@stumbleupon.com	PZ693nUn96E
39	Christina Roberts	21396981394	croberts12@blogspot.com	dis2mlnaGQ1
40	Ralph Mendoza	52894680881	rmendoza13@statcounter.com	fng0zQ
41	Cheryl Gonzalez	80309700907	cgonzalez14@ustream.tv	PvSFabOtVer8
42	Jonathan Fowler	92385342183	jfowler15@stumbleupon.com	AxZAQ1h0vZtG
43	Bruce Wood	43558748173	bwood16@over-blog.com	m70FQa
44	Teresa Rogers	10313525611	trogers17@free.fr	YyCAQOcO
45	Patrick Gonzales	62951492487	pgonzales18@163.com	CtLsHX
46	Peter Richards	68469941539	prichards19@nsw.gov.au	kilhDnIZRRD
47	Diane Cunningham	95282999033	dcunningham1a@ifeng.com	46p7tU
48	Ashley Cruz	19748062540	acruz1b@mashable.com	05kvdDD2
49	Theresa Thompson	55366728323	tthompson1c@timesonline.co.uk	8uwLGWOut5l
50	Steve Wood	81814206958	swood1d@unblog.fr	9gNCX4lF1
51	Lori Ramos	24047502772	lramos1e@cdc.gov	olLEXoAtqs
52	Frances Ruiz	08282613970	fruiz1f@blogspot.com	HMBk18X0
53	Carolyn Wagner	03813941422	cwagner1g@bandcamp.com	Xxw4302
54	Nancy Garza	10441538683	ngarza1h@csmonitor.com	kajFTUOKsilv
55	Daniel Morris	16533830968	dmorris1i@icq.com	3RdJqfAbQ
56	Emily Castillo	50969508295	ecastillo1j@hexun.com	j5b2aaNDT
57	Julie Medina	46128888924	jmedina1k@ask.com	z2KPZTKY
58	Harry Nichols	92215244765	hnichols1l@webmd.com	mAfzYDs6sbaW
59	Heather Morris	47348292594	hmorris1m@apple.com	q9kFweVBad81
60	Kathleen Bailey	36410607743	kbailey1n@e-recht24.de	WSOHjv
61	Jimmy Lawson	36580508238	jlawson1o@domainmarket.com	wepPWV
62	Sean Reynolds	38200754667	sreynolds1p@drupal.org	c3SGdi
63	Kevin Wells	54517271086	kwells1q@chronoengine.com	PTGnKclKoX
64	Kimberly Stewart	04072233025	kstewart1r@phoca.cz	fYxKRjxl
65	Edward Armstrong	04822985907	earmstrong1s@foxnews.com	3QGTON
66	Johnny Morris	16510348551	jmorris1t@blogs.com	tis4oiQWmUSc
67	Ashley Medina	97694609168	amedina1u@csmonitor.com	NCyC24JAfFK
68	Lori Simpson	51026806520	lsimpson1v@squidoo.com	FARcZg
69	Cheryl Andrews	14139095058	candrews1w@comsenz.com	jn8Req9v
70	Jason Medina	53531632507	jmedina1x@mozilla.org	pvgC2p2Dz
71	Shawn Foster	63409623067	sfoster1y@dailymotion.com	seCTzIRFsm9
72	Debra Davis	12072225476	ddavis1z@altervista.org	GKD3na9
73	Aaron Walker	73892576313	awalker20@networkadvertising.org	mPDHk6XC
74	Maria Phillips	11197649034	mphillips21@msu.edu	L0vBQYfGxUnF
75	Cheryl Edwards	52712211925	cedwards22@360.cn	mlLXOG3tM96I
76	Jack Mcdonald	83415349773	jmcdonald23@usnews.com	iJOFic5uJ
77	Helen Green	95323131231	hgreen24@whitehouse.gov	DUAjtl
78	Mark Dunn	77622437163	mdunn25@parallels.com	wWizMQ6Kmevl
79	Paul Butler	00969242297	pbutler26@howstuffworks.com	UZGB4ZOTYQ
80	Randy Jordan	97069477917	rjordan27@myspace.com	3ayJ03ZocaS
81	Andrew Chavez	14602295961	achavez28@dmoz.org	laKQtUz
82	Stephen Patterson	81736286635	spatterson29@hp.com	t8G60u
83	David Vasquez	54194455017	dvasquez2a@cyberchimps.com	pfAS7ef
84	Harry Weaver	90067518290	hweaver2b@tinypic.com	g5cqUNKU4Rz
85	Wanda Knight	77339594190	wknight2c@ovh.net	NGy15afte
86	Cheryl Ferguson	78506367194	cferguson2d@bigcartel.com	SbhgCYIlDGo
87	Stephen Wagner	07998069143	swagner2e@acquirethisname.com	e2OAU4hSA0pU
88	Lori Lopez	81955087422	llopez2f@wired.com	ncsjnxh
89	Joe Richardson	20909223920	jrichardson2g@ocn.ne.jp	Qo0OgBs
90	Ernest Mcdonald	87208870739	emcdonald2h@boston.com	C48NFkrwz
91	Robin Gardner	48578862512	rgardner2i@buzzfeed.com	8xSA5wMY
92	Larry Long	62647077355	llong2j@kickstarter.com	BrE329foF
93	Janet Carter	62150841945	jcarter2k@prlog.org	1vsOgu
94	Daniel Fowler	30770729137	dfowler2l@posterous.com	A9VIpPG2Xq
95	Sean Gonzales	60975661209	sgonzales2m@sciencedaily.com	J8y4VyIq
96	Ann Morales	42281494361	amorales2n@japanpost.jp	nuHlud7o0ei6
97	Ralph Carr	01356666746	rcarr2o@bravesites.com	wMr89gWFS
98	Willie Ferguson	90313588051	wferguson2p@163.com	KQ5HpQBa6
99	Aaron Parker	86632647542	aparker2q@europa.eu	7BI7Si4uVR
100	Richard Spencer	36541243437	rspencer2r@i2i.jp	C6qvGQcF
101	felipe brizola	123456	a	a
102	felipe	11111111111	\N	\N
103	Joao SIlva	11111111111	\N	\N
104	Joao Silva	22211122211	\N	\N
105	Joao Silva	11111111111	\N	\N
106	Joao DUtra	11111111111	\N	\N
107	Felipe Brizola	11111111111	\N	\N
108	Felipe	11111111111	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acmeuser
--

SELECT pg_catalog.setval('users_id_seq', 108, true);


--
-- Name: airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: airports_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: equipments_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY equipments
    ADD CONSTRAINT equipments_pkey PRIMARY KEY (equipment_id);


--
-- Name: flights_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: routes_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: sales_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: flights_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_route_id_fkey FOREIGN KEY (route_id) REFERENCES routes(id);


--
-- Name: routes_airline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_airline_id_fkey FOREIGN KEY (airline_id) REFERENCES airlines(id);


--
-- Name: routes_from_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_from_fkey FOREIGN KEY ("from") REFERENCES airports(id);


--
-- Name: routes_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_to_fkey FOREIGN KEY ("to") REFERENCES airports(id);


--
-- Name: tickets_flight_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES flights(id);


--
-- Name: tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acmeuser
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


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

