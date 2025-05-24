-- -------------------------------------------------------------
-- TablePlus 6.4.8(608)
--
-- https://tableplus.com/
--
-- Database: directnuxt_development
-- Generation Time: 2025-05-24 09:52:34.4150
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."directus_roles";
-- Table Definition
CREATE TABLE "public"."directus_roles" (
    "id" uuid NOT NULL,
    "name" varchar(100) NOT NULL,
    "icon" varchar(64) NOT NULL DEFAULT 'supervised_user_circle'::character varying,
    "description" text,
    "parent" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_fields";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_fields_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_fields" (
    "id" int4 NOT NULL DEFAULT nextval('directus_fields_id_seq'::regclass),
    "collection" varchar(64) NOT NULL,
    "field" varchar(64) NOT NULL,
    "special" varchar(64),
    "interface" varchar(64),
    "options" json,
    "display" varchar(64),
    "display_options" json,
    "readonly" bool NOT NULL DEFAULT false,
    "hidden" bool NOT NULL DEFAULT false,
    "sort" int4,
    "width" varchar(30) DEFAULT 'full'::character varying,
    "translations" json,
    "note" text,
    "conditions" json,
    "required" bool DEFAULT false,
    "group" varchar(64),
    "validation" json,
    "validation_message" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_files";
-- Table Definition
CREATE TABLE "public"."directus_files" (
    "id" uuid NOT NULL,
    "storage" varchar(255) NOT NULL,
    "filename_disk" varchar(255),
    "filename_download" varchar(255) NOT NULL,
    "title" varchar(255),
    "type" varchar(255),
    "folder" uuid,
    "uploaded_by" uuid,
    "created_on" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_by" uuid,
    "modified_on" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "charset" varchar(50),
    "filesize" int8,
    "width" int4,
    "height" int4,
    "duration" int4,
    "embed" varchar(200),
    "description" text,
    "location" text,
    "tags" text,
    "metadata" json,
    "focal_point_x" int4,
    "focal_point_y" int4,
    "tus_id" varchar(64),
    "tus_data" json,
    "uploaded_on" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_folders";
-- Table Definition
CREATE TABLE "public"."directus_folders" (
    "id" uuid NOT NULL,
    "name" varchar(255) NOT NULL,
    "parent" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_activity";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_activity_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_activity" (
    "id" int4 NOT NULL DEFAULT nextval('directus_activity_id_seq'::regclass),
    "action" varchar(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ip" varchar(50),
    "user_agent" text,
    "collection" varchar(64) NOT NULL,
    "item" varchar(255) NOT NULL,
    "origin" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_relations";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_relations_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_relations" (
    "id" int4 NOT NULL DEFAULT nextval('directus_relations_id_seq'::regclass),
    "many_collection" varchar(64) NOT NULL,
    "many_field" varchar(64) NOT NULL,
    "one_collection" varchar(64),
    "one_field" varchar(64),
    "one_collection_field" varchar(64),
    "one_allowed_collections" text,
    "junction_field" varchar(64),
    "sort_field" varchar(64),
    "one_deselect_action" varchar(255) NOT NULL DEFAULT 'nullify'::character varying,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_webhooks";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_webhooks_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_webhooks" (
    "id" int4 NOT NULL DEFAULT nextval('directus_webhooks_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "method" varchar(10) NOT NULL DEFAULT 'POST'::character varying,
    "url" varchar(255) NOT NULL,
    "status" varchar(10) NOT NULL DEFAULT 'active'::character varying,
    "data" bool NOT NULL DEFAULT true,
    "actions" varchar(100) NOT NULL,
    "collections" varchar(255) NOT NULL,
    "headers" json,
    "was_active_before_deprecation" bool NOT NULL DEFAULT false,
    "migrated_flow" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_sessions";
-- Table Definition
CREATE TABLE "public"."directus_sessions" (
    "token" varchar(64) NOT NULL,
    "user" uuid,
    "expires" timestamptz NOT NULL,
    "ip" varchar(255),
    "user_agent" text,
    "share" uuid,
    "origin" varchar(255),
    "next_token" varchar(64),
    PRIMARY KEY ("token")
);

DROP TABLE IF EXISTS "public"."directus_permissions";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_permissions_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_permissions" (
    "id" int4 NOT NULL DEFAULT nextval('directus_permissions_id_seq'::regclass),
    "collection" varchar(64) NOT NULL,
    "action" varchar(10) NOT NULL,
    "permissions" json,
    "validation" json,
    "presets" json,
    "fields" text,
    "policy" uuid NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_revisions";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_revisions_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_revisions" (
    "id" int4 NOT NULL DEFAULT nextval('directus_revisions_id_seq'::regclass),
    "activity" int4 NOT NULL,
    "collection" varchar(64) NOT NULL,
    "item" varchar(255) NOT NULL,
    "data" json,
    "delta" json,
    "parent" int4,
    "version" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_presets";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_presets_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_presets" (
    "id" int4 NOT NULL DEFAULT nextval('directus_presets_id_seq'::regclass),
    "bookmark" varchar(255),
    "user" uuid,
    "role" uuid,
    "collection" varchar(64),
    "search" varchar(100),
    "layout" varchar(100) DEFAULT 'tabular'::character varying,
    "layout_query" json,
    "layout_options" json,
    "refresh_interval" int4,
    "filter" json,
    "icon" varchar(64) DEFAULT 'bookmark'::character varying,
    "color" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_migrations";
-- Table Definition
CREATE TABLE "public"."directus_migrations" (
    "version" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("version")
);

DROP TABLE IF EXISTS "public"."directus_panels";
-- Table Definition
CREATE TABLE "public"."directus_panels" (
    "id" uuid NOT NULL,
    "dashboard" uuid NOT NULL,
    "name" varchar(255),
    "icon" varchar(64) DEFAULT NULL::character varying,
    "color" varchar(10),
    "show_header" bool NOT NULL DEFAULT false,
    "note" text,
    "type" varchar(255) NOT NULL,
    "position_x" int4 NOT NULL,
    "position_y" int4 NOT NULL,
    "width" int4 NOT NULL,
    "height" int4 NOT NULL,
    "options" json,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_dashboards";
-- Table Definition
CREATE TABLE "public"."directus_dashboards" (
    "id" uuid NOT NULL,
    "name" varchar(255) NOT NULL,
    "icon" varchar(64) NOT NULL DEFAULT 'dashboard'::character varying,
    "note" text,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "color" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_notifications";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_notifications_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_notifications" (
    "id" int4 NOT NULL DEFAULT nextval('directus_notifications_id_seq'::regclass),
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "status" varchar(255) DEFAULT 'inbox'::character varying,
    "recipient" uuid NOT NULL,
    "sender" uuid,
    "subject" varchar(255) NOT NULL,
    "message" text,
    "collection" varchar(64),
    "item" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_shares";
-- Table Definition
CREATE TABLE "public"."directus_shares" (
    "id" uuid NOT NULL,
    "name" varchar(255),
    "collection" varchar(64) NOT NULL,
    "item" varchar(255) NOT NULL,
    "role" uuid,
    "password" varchar(255),
    "user_created" uuid,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_start" timestamptz,
    "date_end" timestamptz,
    "times_used" int4 DEFAULT 0,
    "max_uses" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_flows";
-- Table Definition
CREATE TABLE "public"."directus_flows" (
    "id" uuid NOT NULL,
    "name" varchar(255) NOT NULL,
    "icon" varchar(64),
    "color" varchar(255),
    "description" text,
    "status" varchar(255) NOT NULL DEFAULT 'active'::character varying,
    "trigger" varchar(255),
    "accountability" varchar(255) DEFAULT 'all'::character varying,
    "options" json,
    "operation" uuid,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_versions";
-- Table Definition
CREATE TABLE "public"."directus_versions" (
    "id" uuid NOT NULL,
    "key" varchar(64) NOT NULL,
    "name" varchar(255),
    "collection" varchar(64) NOT NULL,
    "item" varchar(255) NOT NULL,
    "hash" varchar(255),
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_updated" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "user_updated" uuid,
    "delta" json,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_operations";
-- Table Definition
CREATE TABLE "public"."directus_operations" (
    "id" uuid NOT NULL,
    "name" varchar(255),
    "key" varchar(255) NOT NULL,
    "type" varchar(255) NOT NULL,
    "position_x" int4 NOT NULL,
    "position_y" int4 NOT NULL,
    "options" json,
    "resolve" uuid,
    "reject" uuid,
    "flow" uuid NOT NULL,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_translations";
-- Table Definition
CREATE TABLE "public"."directus_translations" (
    "id" uuid NOT NULL,
    "language" varchar(255) NOT NULL,
    "key" varchar(255) NOT NULL,
    "value" text NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_collections";
-- Table Definition
CREATE TABLE "public"."directus_collections" (
    "collection" varchar(64) NOT NULL,
    "icon" varchar(64),
    "note" text,
    "display_template" varchar(255),
    "hidden" bool NOT NULL DEFAULT false,
    "singleton" bool NOT NULL DEFAULT false,
    "translations" json,
    "archive_field" varchar(64),
    "archive_app_filter" bool NOT NULL DEFAULT true,
    "archive_value" varchar(255),
    "unarchive_value" varchar(255),
    "sort_field" varchar(64),
    "accountability" varchar(255) DEFAULT 'all'::character varying,
    "color" varchar(255),
    "item_duplication_fields" json,
    "sort" int4,
    "group" varchar(64),
    "collapse" varchar(255) NOT NULL DEFAULT 'open'::character varying,
    "preview_url" varchar(255),
    "versioning" bool NOT NULL DEFAULT false,
    PRIMARY KEY ("collection")
);

DROP TABLE IF EXISTS "public"."directus_users";
-- Table Definition
CREATE TABLE "public"."directus_users" (
    "id" uuid NOT NULL,
    "first_name" varchar(50),
    "last_name" varchar(50),
    "email" varchar(128),
    "password" varchar(255),
    "location" varchar(255),
    "title" varchar(50),
    "description" text,
    "tags" json,
    "avatar" uuid,
    "language" varchar(255) DEFAULT NULL::character varying,
    "tfa_secret" varchar(255),
    "status" varchar(16) NOT NULL DEFAULT 'active'::character varying,
    "role" uuid,
    "token" varchar(255),
    "last_access" timestamptz,
    "last_page" varchar(255),
    "provider" varchar(128) NOT NULL DEFAULT 'default'::character varying,
    "external_identifier" varchar(255),
    "auth_data" json,
    "email_notifications" bool DEFAULT true,
    "appearance" varchar(255),
    "theme_dark" varchar(255),
    "theme_light" varchar(255),
    "theme_light_overrides" json,
    "theme_dark_overrides" json,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_extensions";
-- Table Definition
CREATE TABLE "public"."directus_extensions" (
    "enabled" bool NOT NULL DEFAULT true,
    "id" uuid NOT NULL,
    "folder" varchar(255) NOT NULL,
    "source" varchar(255) NOT NULL,
    "bundle" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_policies";
-- Table Definition
CREATE TABLE "public"."directus_policies" (
    "id" uuid NOT NULL,
    "name" varchar(100) NOT NULL,
    "icon" varchar(64) NOT NULL DEFAULT 'badge'::character varying,
    "description" text,
    "ip_access" text,
    "enforce_tfa" bool NOT NULL DEFAULT false,
    "admin_access" bool NOT NULL DEFAULT false,
    "app_access" bool NOT NULL DEFAULT false,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_access";
-- Table Definition
CREATE TABLE "public"."directus_access" (
    "id" uuid NOT NULL,
    "role" uuid,
    "user" uuid,
    "policy" uuid NOT NULL,
    "sort" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_comments";
-- Table Definition
CREATE TABLE "public"."directus_comments" (
    "id" uuid NOT NULL,
    "collection" varchar(64) NOT NULL,
    "item" varchar(255) NOT NULL,
    "comment" text NOT NULL,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_updated" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "user_updated" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."directus_settings";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_settings_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_settings" (
    "id" int4 NOT NULL DEFAULT nextval('directus_settings_id_seq'::regclass),
    "project_name" varchar(100) NOT NULL DEFAULT 'Directus'::character varying,
    "project_url" varchar(255),
    "project_color" varchar(255) NOT NULL DEFAULT '#6644FF'::character varying,
    "project_logo" uuid,
    "public_foreground" uuid,
    "public_background" uuid,
    "public_note" text,
    "auth_login_attempts" int4 DEFAULT 25,
    "auth_password_policy" varchar(100),
    "storage_asset_transform" varchar(7) DEFAULT 'all'::character varying,
    "storage_asset_presets" json,
    "custom_css" text,
    "storage_default_folder" uuid,
    "basemaps" json,
    "mapbox_key" varchar(255),
    "module_bar" json,
    "project_descriptor" varchar(100),
    "default_language" varchar(255) NOT NULL DEFAULT 'en-US'::character varying,
    "custom_aspect_ratios" json,
    "public_favicon" uuid,
    "default_appearance" varchar(255) NOT NULL DEFAULT 'auto'::character varying,
    "default_theme_light" varchar(255),
    "theme_light_overrides" json,
    "default_theme_dark" varchar(255),
    "theme_dark_overrides" json,
    "report_error_url" varchar(255),
    "report_bug_url" varchar(255),
    "report_feature_url" varchar(255),
    "public_registration" bool NOT NULL DEFAULT false,
    "public_registration_verify_email" bool NOT NULL DEFAULT true,
    "public_registration_role" uuid,
    "public_registration_email_filter" json,
    "visual_editor_urls" json,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."directus_roles" ("id", "name", "icon", "description", "parent") VALUES
('fb3a2499-41cf-40bc-8d85-ca7db6aa7c4c', 'Administrator', 'verified', '$t:admin_description', NULL);

INSERT INTO "public"."directus_activity" ("id", "action", "user", "timestamp", "ip", "user_agent", "collection", "item", "origin") VALUES
(1, 'login', '19f3c91c-6695-4fde-ada2-3f6fe68f6fa7', '2025-05-23 18:25:18.163+02', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0', 'directus_users', '19f3c91c-6695-4fde-ada2-3f6fe68f6fa7', 'http://127.0.0.1:8055'),
(2, 'create', '19f3c91c-6695-4fde-ada2-3f6fe68f6fa7', '2025-05-23 18:26:00.928+02', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0', 'directus_settings', '1', 'http://127.0.0.1:8055');

INSERT INTO "public"."directus_sessions" ("token", "user", "expires", "ip", "user_agent", "share", "origin", "next_token") VALUES
('K6xn42i2fsvOyiTbohCnuPJjtp6PRg6I7RpbQL5fIEVymP16Wn_BtYoxZtoAp-Fa', '19f3c91c-6695-4fde-ada2-3f6fe68f6fa7', '2025-05-24 18:26:30.279+02', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0', NULL, 'http://127.0.0.1:8055', NULL),
('q_Eh2OBQ-KMAs6Vhm7UTjkHKSJ0NapOVo_cnhomg-4a3Sqo2whf6RC-NnImXCPnV', '19f3c91c-6695-4fde-ada2-3f6fe68f6fa7', '2025-05-23 18:26:40.279+02', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0', NULL, 'http://127.0.0.1:8055', 'K6xn42i2fsvOyiTbohCnuPJjtp6PRg6I7RpbQL5fIEVymP16Wn_BtYoxZtoAp-Fa');

INSERT INTO "public"."directus_revisions" ("id", "activity", "collection", "item", "data", "delta", "parent", "version") VALUES
(1, 2, 'directus_settings', '1', '{"default_theme_light":"Directus Default","default_theme_dark":"Directus Default"}', '{"default_theme_light":"Directus Default","default_theme_dark":"Directus Default"}', NULL, NULL);

INSERT INTO "public"."directus_migrations" ("version", "name", "timestamp") VALUES
('20201028A', 'Remove Collection Foreign Keys', '2025-05-23 18:22:43.320899+02'),
('20201029A', 'Remove System Relations', '2025-05-23 18:22:43.354433+02'),
('20201029B', 'Remove System Collections', '2025-05-23 18:22:43.363788+02'),
('20201029C', 'Remove System Fields', '2025-05-23 18:22:43.373518+02'),
('20201105A', 'Add Cascade System Relations', '2025-05-23 18:22:43.417991+02'),
('20201105B', 'Change Webhook URL Type', '2025-05-23 18:22:43.427153+02'),
('20210225A', 'Add Relations Sort Field', '2025-05-23 18:22:43.435301+02'),
('20210304A', 'Remove Locked Fields', '2025-05-23 18:22:43.439126+02'),
('20210312A', 'Webhooks Collections Text', '2025-05-23 18:22:43.446404+02'),
('20210331A', 'Add Refresh Interval', '2025-05-23 18:22:43.448672+02'),
('20210415A', 'Make Filesize Nullable', '2025-05-23 18:22:43.455963+02'),
('20210416A', 'Add Collections Accountability', '2025-05-23 18:22:43.45926+02'),
('20210422A', 'Remove Files Interface', '2025-05-23 18:22:43.461366+02'),
('20210506A', 'Rename Interfaces', '2025-05-23 18:22:43.478421+02'),
('20210510A', 'Restructure Relations', '2025-05-23 18:22:43.489975+02'),
('20210518A', 'Add Foreign Key Constraints', '2025-05-23 18:22:43.503501+02'),
('20210519A', 'Add System Fk Triggers', '2025-05-23 18:22:43.536104+02'),
('20210521A', 'Add Collections Icon Color', '2025-05-23 18:22:43.540209+02'),
('20210525A', 'Add Insights', '2025-05-23 18:22:43.570263+02'),
('20210608A', 'Add Deep Clone Config', '2025-05-23 18:22:43.572431+02'),
('20210626A', 'Change Filesize Bigint', '2025-05-23 18:22:43.587272+02'),
('20210716A', 'Add Conditions to Fields', '2025-05-23 18:22:43.58949+02'),
('20210721A', 'Add Default Folder', '2025-05-23 18:22:43.5952+02'),
('20210802A', 'Replace Groups', '2025-05-23 18:22:43.599913+02'),
('20210803A', 'Add Required to Fields', '2025-05-23 18:22:43.601976+02'),
('20210805A', 'Update Groups', '2025-05-23 18:22:43.60609+02'),
('20210805B', 'Change Image Metadata Structure', '2025-05-23 18:22:43.61035+02'),
('20210811A', 'Add Geometry Config', '2025-05-23 18:22:43.613131+02'),
('20210831A', 'Remove Limit Column', '2025-05-23 18:22:43.615236+02'),
('20210903A', 'Add Auth Provider', '2025-05-23 18:22:43.629323+02'),
('20210907A', 'Webhooks Collections Not Null', '2025-05-23 18:22:43.635044+02'),
('20210910A', 'Move Module Setup', '2025-05-23 18:22:43.637395+02'),
('20210920A', 'Webhooks URL Not Null', '2025-05-23 18:22:43.642863+02'),
('20210924A', 'Add Collection Organization', '2025-05-23 18:22:43.651341+02'),
('20210927A', 'Replace Fields Group', '2025-05-23 18:22:43.658479+02'),
('20210927B', 'Replace M2M Interface', '2025-05-23 18:22:43.660464+02'),
('20210929A', 'Rename Login Action', '2025-05-23 18:22:43.661975+02'),
('20211007A', 'Update Presets', '2025-05-23 18:22:43.667867+02'),
('20211009A', 'Add Auth Data', '2025-05-23 18:22:43.669824+02'),
('20211016A', 'Add Webhook Headers', '2025-05-23 18:22:43.671562+02'),
('20211103A', 'Set Unique to User Token', '2025-05-23 18:22:43.675275+02'),
('20211103B', 'Update Special Geometry', '2025-05-23 18:22:43.679061+02'),
('20211104A', 'Remove Collections Listing', '2025-05-23 18:22:43.681435+02'),
('20211118A', 'Add Notifications', '2025-05-23 18:22:43.7078+02'),
('20211211A', 'Add Shares', '2025-05-23 18:22:43.735162+02'),
('20211230A', 'Add Project Descriptor', '2025-05-23 18:22:43.737244+02'),
('20220303A', 'Remove Default Project Color', '2025-05-23 18:22:43.742982+02'),
('20220308A', 'Add Bookmark Icon and Color', '2025-05-23 18:22:43.746434+02'),
('20220314A', 'Add Translation Strings', '2025-05-23 18:22:43.74862+02'),
('20220322A', 'Rename Field Typecast Flags', '2025-05-23 18:22:43.753326+02'),
('20220323A', 'Add Field Validation', '2025-05-23 18:22:43.755551+02'),
('20220325A', 'Fix Typecast Flags', '2025-05-23 18:22:43.760275+02'),
('20220325B', 'Add Default Language', '2025-05-23 18:22:43.768479+02'),
('20220402A', 'Remove Default Value Panel Icon', '2025-05-23 18:22:43.773861+02'),
('20220429A', 'Add Flows', '2025-05-23 18:22:43.823515+02'),
('20220429B', 'Add Color to Insights Icon', '2025-05-23 18:22:43.836059+02'),
('20220429C', 'Drop Non Null From IP of Activity', '2025-05-23 18:22:43.838266+02'),
('20220429D', 'Drop Non Null From Sender of Notifications', '2025-05-23 18:22:43.840485+02'),
('20220614A', 'Rename Hook Trigger to Event', '2025-05-23 18:22:43.842699+02'),
('20220801A', 'Update Notifications Timestamp Column', '2025-05-23 18:22:43.849856+02'),
('20220802A', 'Add Custom Aspect Ratios', '2025-05-23 18:22:43.851926+02'),
('20220826A', 'Add Origin to Accountability', '2025-05-23 18:22:43.864029+02'),
('20230401A', 'Update Material Icons', '2025-05-23 18:22:43.874894+02'),
('20230525A', 'Add Preview Settings', '2025-05-23 18:22:43.877875+02'),
('20230526A', 'Migrate Translation Strings', '2025-05-23 18:22:43.889367+02'),
('20230721A', 'Require Shares Fields', '2025-05-23 18:22:43.916487+02'),
('20230823A', 'Add Content Versioning', '2025-05-23 18:22:43.945604+02'),
('20230927A', 'Themes', '2025-05-23 18:22:43.959426+02'),
('20231009A', 'Update CSV Fields to Text', '2025-05-23 18:22:43.963973+02'),
('20231009B', 'Update Panel Options', '2025-05-23 18:22:43.986133+02'),
('20231010A', 'Add Extensions', '2025-05-23 18:22:43.989967+02'),
('20231215A', 'Add Focalpoints', '2025-05-23 18:22:43.991786+02'),
('20240122A', 'Add Report URL Fields', '2025-05-23 18:22:43.994578+02'),
('20240204A', 'Marketplace', '2025-05-23 18:22:44.013962+02'),
('20240305A', 'Change Useragent Type', '2025-05-23 18:22:44.021136+02'),
('20240311A', 'Deprecate Webhooks', '2025-05-23 18:22:44.032227+02'),
('20240422A', 'Public Registration', '2025-05-23 18:22:44.038694+02'),
('20240515A', 'Add Session Window', '2025-05-23 18:22:44.040108+02'),
('20240701A', 'Add Tus Data', '2025-05-23 18:22:44.041834+02'),
('20240716A', 'Update Files Date Fields', '2025-05-23 18:22:44.048871+02'),
('20240806A', 'Permissions Policies', '2025-05-23 18:22:44.099377+02'),
('20240817A', 'Update Icon Fields Length', '2025-05-23 18:22:44.119756+02'),
('20240909A', 'Separate Comments', '2025-05-23 18:22:44.135829+02'),
('20240909B', 'Consolidate Content Versioning', '2025-05-23 18:22:44.137925+02'),
('20240924A', 'Migrate Legacy Comments', '2025-05-23 18:22:44.144325+02'),
('20240924B', 'Populate Versioning Deltas', '2025-05-23 18:22:44.148888+02'),
('20250224A', 'Visual Editor', '2025-05-23 18:22:44.151819+02');

INSERT INTO "public"."directus_users" ("id", "first_name", "last_name", "email", "password", "location", "title", "description", "tags", "avatar", "language", "tfa_secret", "status", "role", "token", "last_access", "last_page", "provider", "external_identifier", "auth_data", "email_notifications", "appearance", "theme_dark", "theme_light", "theme_light_overrides", "theme_dark_overrides") VALUES
('19f3c91c-6695-4fde-ada2-3f6fe68f6fa7', 'Admin', 'User', 'admin@opsone.net', '$argon2id$v=19$m=65536,t=3,p=4$mV2YGc1+CQv/2QF5obj8nw$67SMXbwEH+96MT1jp4W1cthJ5CLJOM1m7veoBhkaqRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'fb3a2499-41cf-40bc-8d85-ca7db6aa7c4c', NULL, '2025-05-23 18:26:30.322+02', '/users', 'default', NULL, NULL, 't', NULL, NULL, NULL, NULL, NULL);

INSERT INTO "public"."directus_policies" ("id", "name", "icon", "description", "ip_access", "enforce_tfa", "admin_access", "app_access") VALUES
('9927b992-6beb-413a-9020-3a9785aa6f32', 'Administrator', 'verified', '$t:admin_description', NULL, 'f', 't', 't'),
('abf8a154-5b1c-4a46-ac9c-7300570f4f17', '$t:public_label', 'public', '$t:public_description', NULL, 'f', 'f', 'f');

INSERT INTO "public"."directus_access" ("id", "role", "user", "policy", "sort") VALUES
('46524a1d-b99d-4c14-bcf2-9d937a2e9f1d', 'fb3a2499-41cf-40bc-8d85-ca7db6aa7c4c', NULL, '9927b992-6beb-413a-9020-3a9785aa6f32', NULL),
('f8a73a88-8234-402f-a05d-0eff3f8dc7ec', NULL, NULL, 'abf8a154-5b1c-4a46-ac9c-7300570f4f17', 1);

INSERT INTO "public"."directus_settings" ("id", "project_name", "project_url", "project_color", "project_logo", "public_foreground", "public_background", "public_note", "auth_login_attempts", "auth_password_policy", "storage_asset_transform", "storage_asset_presets", "custom_css", "storage_default_folder", "basemaps", "mapbox_key", "module_bar", "project_descriptor", "default_language", "custom_aspect_ratios", "public_favicon", "default_appearance", "default_theme_light", "theme_light_overrides", "default_theme_dark", "theme_dark_overrides", "report_error_url", "report_bug_url", "report_feature_url", "public_registration", "public_registration_verify_email", "public_registration_role", "public_registration_email_filter", "visual_editor_urls") VALUES
(1, 'Directus', NULL, '#6644FF', NULL, NULL, NULL, NULL, 25, NULL, 'all', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en-US', NULL, NULL, 'auto', 'Directus Default', NULL, 'Directus Default', NULL, NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL);

ALTER TABLE "public"."directus_roles" ADD FOREIGN KEY ("parent") REFERENCES "public"."directus_roles"("id");
ALTER TABLE "public"."directus_files" ADD FOREIGN KEY ("uploaded_by") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."directus_files" ADD FOREIGN KEY ("modified_by") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."directus_files" ADD FOREIGN KEY ("folder") REFERENCES "public"."directus_folders"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_folders" ADD FOREIGN KEY ("parent") REFERENCES "public"."directus_folders"("id");
ALTER TABLE "public"."directus_webhooks" ADD FOREIGN KEY ("migrated_flow") REFERENCES "public"."directus_flows"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_sessions" ADD FOREIGN KEY ("user") REFERENCES "public"."directus_users"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_sessions" ADD FOREIGN KEY ("share") REFERENCES "public"."directus_shares"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_permissions" ADD FOREIGN KEY ("policy") REFERENCES "public"."directus_policies"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_revisions" ADD FOREIGN KEY ("activity") REFERENCES "public"."directus_activity"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_revisions" ADD FOREIGN KEY ("version") REFERENCES "public"."directus_versions"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_revisions" ADD FOREIGN KEY ("parent") REFERENCES "public"."directus_revisions"("id");
ALTER TABLE "public"."directus_presets" ADD FOREIGN KEY ("user") REFERENCES "public"."directus_users"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_presets" ADD FOREIGN KEY ("role") REFERENCES "public"."directus_roles"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_panels" ADD FOREIGN KEY ("dashboard") REFERENCES "public"."directus_dashboards"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_panels" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_dashboards" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_notifications" ADD FOREIGN KEY ("recipient") REFERENCES "public"."directus_users"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_notifications" ADD FOREIGN KEY ("sender") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."directus_shares" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_shares" ADD FOREIGN KEY ("role") REFERENCES "public"."directus_roles"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_shares" ADD FOREIGN KEY ("collection") REFERENCES "public"."directus_collections"("collection") ON DELETE CASCADE;
ALTER TABLE "public"."directus_flows" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;


-- Indices
CREATE UNIQUE INDEX directus_flows_operation_unique ON public.directus_flows USING btree (operation);
ALTER TABLE "public"."directus_versions" ADD FOREIGN KEY ("collection") REFERENCES "public"."directus_collections"("collection") ON DELETE CASCADE;
ALTER TABLE "public"."directus_versions" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_versions" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."directus_operations" ADD FOREIGN KEY ("reject") REFERENCES "public"."directus_operations"("id");
ALTER TABLE "public"."directus_operations" ADD FOREIGN KEY ("flow") REFERENCES "public"."directus_flows"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_operations" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_operations" ADD FOREIGN KEY ("resolve") REFERENCES "public"."directus_operations"("id");


-- Indices
CREATE UNIQUE INDEX directus_operations_resolve_unique ON public.directus_operations USING btree (resolve);
CREATE UNIQUE INDEX directus_operations_reject_unique ON public.directus_operations USING btree (reject);
ALTER TABLE "public"."directus_collections" ADD FOREIGN KEY ("group") REFERENCES "public"."directus_collections"("collection");
ALTER TABLE "public"."directus_users" ADD FOREIGN KEY ("role") REFERENCES "public"."directus_roles"("id") ON DELETE SET NULL;


-- Indices
CREATE UNIQUE INDEX directus_users_external_identifier_unique ON public.directus_users USING btree (external_identifier);
CREATE UNIQUE INDEX directus_users_email_unique ON public.directus_users USING btree (email);
CREATE UNIQUE INDEX directus_users_token_unique ON public.directus_users USING btree (token);
ALTER TABLE "public"."directus_access" ADD FOREIGN KEY ("policy") REFERENCES "public"."directus_policies"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_access" ADD FOREIGN KEY ("role") REFERENCES "public"."directus_roles"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_access" ADD FOREIGN KEY ("user") REFERENCES "public"."directus_users"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_comments" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_comments" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("public_foreground") REFERENCES "public"."directus_files"("id");
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("public_background") REFERENCES "public"."directus_files"("id");
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("public_favicon") REFERENCES "public"."directus_files"("id");
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("project_logo") REFERENCES "public"."directus_files"("id");
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("storage_default_folder") REFERENCES "public"."directus_folders"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("public_registration_role") REFERENCES "public"."directus_roles"("id") ON DELETE SET NULL;
