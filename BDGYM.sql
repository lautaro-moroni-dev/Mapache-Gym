PGDMP                     
    {            gimnasio    10.5    10.5 1    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            2           1262    16579    gimnasio    DATABASE     �   CREATE DATABASE gimnasio WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Argentina.1252' LC_CTYPE = 'Spanish_Argentina.1252';
    DROP DATABASE gimnasio;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            3           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            4           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    91510 
   asistencia    TABLE     �   CREATE TABLE public.asistencia (
    id_asistencia integer NOT NULL,
    dia character varying(255),
    fecha date,
    hora_fin time(6) without time zone,
    hora_inicio time(6) without time zone,
    id_cliente integer,
    id_empleado integer
);
    DROP TABLE public.asistencia;
       public         postgres    false    3            �            1259    91558    asistencia_seq    SEQUENCE     x   CREATE SEQUENCE public.asistencia_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.asistencia_seq;
       public       postgres    false    3            �            1259    91515    cliente    TABLE     4  CREATE TABLE public.cliente (
    id integer NOT NULL,
    apellido character varying(255),
    dni character varying(8),
    nombre character varying(255),
    telefono character varying(255),
    dias_disponibles integer,
    fecha_alta date,
    status character varying(255),
    id_membresia integer
);
    DROP TABLE public.cliente;
       public         postgres    false    3            �            1259    91560    cliente_seq    SEQUENCE     u   CREATE SEQUENCE public.cliente_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cliente_seq;
       public       postgres    false    3            �            1259    91523    empleado    TABLE     Y  CREATE TABLE public.empleado (
    id integer NOT NULL,
    apellido character varying(255),
    dni character varying(8),
    nombre character varying(255),
    telefono character varying(255),
    legajo character varying(255),
    contrasenia character varying(255),
    usuario character varying(255) NOT NULL,
    rol_id bigint NOT NULL
);
    DROP TABLE public.empleado;
       public         postgres    false    3            �            1259    91562    empleado_seq    SEQUENCE     v   CREATE SEQUENCE public.empleado_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.empleado_seq;
       public       postgres    false    3            �            1259    91531 	   membresia    TABLE     �   CREATE TABLE public.membresia (
    id_membresia integer NOT NULL,
    descripcion character varying(255),
    dias_semanales integer,
    precio character varying(255),
    tipo_membresia character varying(255)
);
    DROP TABLE public.membresia;
       public         postgres    false    3            �            1259    91564    membresia_seq    SEQUENCE     w   CREATE SEQUENCE public.membresia_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.membresia_seq;
       public       postgres    false    3            �            1259    91539    pago    TABLE     �   CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    fecha_pago date,
    validez date,
    valor_abonado character varying(255),
    cliente integer,
    membresia integer
);
    DROP TABLE public.pago;
       public         postgres    false    3            �            1259    91566    pago_seq    SEQUENCE     r   CREATE SEQUENCE public.pago_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.pago_seq;
       public       postgres    false    3            �            1259    91546    rol    TABLE     `   CREATE TABLE public.rol (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL
);
    DROP TABLE public.rol;
       public         postgres    false    3            �            1259    91544 
   rol_id_seq    SEQUENCE     s   CREATE SEQUENCE public.rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.rol_id_seq;
       public       postgres    false    3    202            5           0    0 
   rol_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.rol_id_seq OWNED BY public.rol.id;
            public       postgres    false    201            �
           2604    91549    rol id    DEFAULT     `   ALTER TABLE ONLY public.rol ALTER COLUMN id SET DEFAULT nextval('public.rol_id_seq'::regclass);
 5   ALTER TABLE public.rol ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201    202            !          0    91510 
   asistencia 
   TABLE DATA               o   COPY public.asistencia (id_asistencia, dia, fecha, hora_fin, hora_inicio, id_cliente, id_empleado) FROM stdin;
    public       postgres    false    196   46       "          0    91515    cliente 
   TABLE DATA               z   COPY public.cliente (id, apellido, dni, nombre, telefono, dias_disponibles, fecha_alta, status, id_membresia) FROM stdin;
    public       postgres    false    197   �6       #          0    91523    empleado 
   TABLE DATA               m   COPY public.empleado (id, apellido, dni, nombre, telefono, legajo, contrasenia, usuario, rol_id) FROM stdin;
    public       postgres    false    198   I8       $          0    91531 	   membresia 
   TABLE DATA               f   COPY public.membresia (id_membresia, descripcion, dias_semanales, precio, tipo_membresia) FROM stdin;
    public       postgres    false    199   �9       %          0    91539    pago 
   TABLE DATA               _   COPY public.pago (id_pago, fecha_pago, validez, valor_abonado, cliente, membresia) FROM stdin;
    public       postgres    false    200   B:       '          0    91546    rol 
   TABLE DATA               )   COPY public.rol (id, nombre) FROM stdin;
    public       postgres    false    202   �:       6           0    0    asistencia_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.asistencia_seq', 51, true);
            public       postgres    false    203            7           0    0    cliente_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cliente_seq', 51, true);
            public       postgres    false    204            8           0    0    empleado_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.empleado_seq', 101, true);
            public       postgres    false    205            9           0    0    membresia_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.membresia_seq', 101, true);
            public       postgres    false    206            :           0    0    pago_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.pago_seq', 51, true);
            public       postgres    false    207            ;           0    0 
   rol_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.rol_id_seq', 5, true);
            public       postgres    false    201            �
           2606    91514    asistencia asistencia_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_pkey PRIMARY KEY (id_asistencia);
 D   ALTER TABLE ONLY public.asistencia DROP CONSTRAINT asistencia_pkey;
       public         postgres    false    196            �
           2606    91522    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public         postgres    false    197            �
           2606    91530    empleado empleado_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public         postgres    false    198            �
           2606    91538    membresia membresia_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (id_membresia);
 B   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_pkey;
       public         postgres    false    199            �
           2606    91543    pago pago_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public         postgres    false    200            �
           2606    91551    rol rol_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public         postgres    false    202            �
           2606    91557     rol uk_43kr6s7bts1wqfv43f7jd87kp 
   CONSTRAINT     ]   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT uk_43kr6s7bts1wqfv43f7jd87kp UNIQUE (nombre);
 J   ALTER TABLE ONLY public.rol DROP CONSTRAINT uk_43kr6s7bts1wqfv43f7jd87kp;
       public         postgres    false    202            �
           2606    91555 %   empleado uk_anilfn0t89ht43r8n8lthr5b6 
   CONSTRAINT     _   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uk_anilfn0t89ht43r8n8lthr5b6 UNIQUE (dni);
 O   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uk_anilfn0t89ht43r8n8lthr5b6;
       public         postgres    false    198            �
           2606    91553 $   cliente uk_jlcg5nhnauli1hu4ojldsedaw 
   CONSTRAINT     ^   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uk_jlcg5nhnauli1hu4ojldsedaw UNIQUE (dni);
 N   ALTER TABLE ONLY public.cliente DROP CONSTRAINT uk_jlcg5nhnauli1hu4ojldsedaw;
       public         postgres    false    197            �
           2606    91568 &   asistencia fkfxmdiopgiprfbrk3b49m177w7    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT fkfxmdiopgiprfbrk3b49m177w7 FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);
 P   ALTER TABLE ONLY public.asistencia DROP CONSTRAINT fkfxmdiopgiprfbrk3b49m177w7;
       public       postgres    false    2707    196    197            �
           2606    91588     pago fkhvckw8cet4jo3umom9p7m6w80    FK CONSTRAINT     �   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fkhvckw8cet4jo3umom9p7m6w80 FOREIGN KEY (cliente) REFERENCES public.cliente(id);
 J   ALTER TABLE ONLY public.pago DROP CONSTRAINT fkhvckw8cet4jo3umom9p7m6w80;
       public       postgres    false    200    197    2707            �
           2606    91578 #   cliente fkijvx40fnwwk1yk7rqjyac9bp7    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fkijvx40fnwwk1yk7rqjyac9bp7 FOREIGN KEY (id_membresia) REFERENCES public.membresia(id_membresia);
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fkijvx40fnwwk1yk7rqjyac9bp7;
       public       postgres    false    199    2715    197            �
           2606    91573 &   asistencia fkjx9k6wpfvxkbptaficbqyyk3u    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT fkjx9k6wpfvxkbptaficbqyyk3u FOREIGN KEY (id_empleado) REFERENCES public.empleado(id);
 P   ALTER TABLE ONLY public.asistencia DROP CONSTRAINT fkjx9k6wpfvxkbptaficbqyyk3u;
       public       postgres    false    198    196    2711            �
           2606    91583 $   empleado fkqudsrbctju4p60b7n0cdalf6d    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT fkqudsrbctju4p60b7n0cdalf6d FOREIGN KEY (rol_id) REFERENCES public.rol(id);
 N   ALTER TABLE ONLY public.empleado DROP CONSTRAINT fkqudsrbctju4p60b7n0cdalf6d;
       public       postgres    false    2719    198    202            �
           2606    91593     pago fkt79g946pliuoy982jyep9g18t    FK CONSTRAINT     �   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fkt79g946pliuoy982jyep9g18t FOREIGN KEY (membresia) REFERENCES public.membresia(id_membresia);
 J   ALTER TABLE ONLY public.pago DROP CONSTRAINT fkt79g946pliuoy982jyep9g18t;
       public       postgres    false    200    199    2715            !   �   x�m�;1Dk�.X�/q|�	���Aܟda�[�|Ҽ�������,�:n�@=��2r5 �l�1C���v֙.�#��Y?@��j )��RZ�g�q��U�#LC+R�_@��sŃ�_9aWZ�k�T���0�'�⿿{^2����8aulXJ���R�      "   W  x�u��N�0���5N�8G�iĉ��E�P�n;��q;!��z������O�+�6b��7RZC.9X�]�qa�w��+kٖ&�68�#z�m�9D�>M�l�`uL�!�`9D&���m#� ��� NM�a����鬦��!���]��*��3���n��_\��;��#O1άɰIe@:���l�u rԝ�1�k*J������!ݾ��DdpfKS�Kn�>������=5�{��vF�x��.=h1���z��4򘍝�џV���q��5��L`�MVE�O0h�B�ȶ���w�������SO��i��G"=6<��I��BAi�%�]UU����-      #   =  x�M�Ɏ�@E��w��(�% � 3QqS��2h�׷�v��]ܻ9'%o������}f���������K��
;��9�V^:2k4�h�r�8�1�:G�:H��~^��@�B��b�$b^�"���� �1+����)��8к�/�:�|X1I�ـ0+%��u6a���I�i;@���0�S6v=�(�]����'�� #���&O�(I<���L#I[Co�6qp�}Ͽ�Fč���s%����dZtt�BK �0=��(2� "���ᵊ����t�H�f!.<�t }�9��]�Zh3�GMJ����x/�v4EQ���tf      $   �   x�m�1�0Eg��H2�Jݐz�.V�A�T�2p��^��YP������\�k=���[��'͖;����NNB �IO�5�5X�3PP�ZC�ۈ*:Z���58;��=���]2(Ao�>�2�p�h���?�N2�%���גvX+(T	���K����G	      %   i   x�}���0߰K� Iv��s�4o�!��Pҡֆ79���wwRR�����L��$�*`إc��T3�)+*�Z�X!��D�"U	R�d���=��y;3�tD�      '   1   x�3�-.M,���2�tL����,.)JL�/�2����K�K��=... E|�     