-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Окт 10 2022 г., 07:33
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `expressionengine`
--

-- --------------------------------------------------------

--
-- Структура таблицы `exp_actions`
--

CREATE TABLE `exp_actions` (
  `action_id` int UNSIGNED NOT NULL,
  `class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(1, 'Channel', 'submit_entry', 0),
(2, 'Channel', 'smiley_pop', 0),
(3, 'Channel', 'combo_loader', 0),
(4, 'Channel', 'live_preview', 1),
(5, 'Comment', 'insert_new_comment', 0),
(6, 'Comment_mcp', 'delete_comment_notification', 0),
(7, 'Comment', 'comment_subscribe', 0),
(8, 'Comment', 'edit_comment', 0),
(9, 'Consent', 'grantConsent', 0),
(10, 'Consent', 'submitConsent', 0),
(11, 'Consent', 'withdrawConsent', 0),
(12, 'Member', 'registration_form', 0),
(13, 'Member', 'register_member', 0),
(14, 'Member', 'activate_member', 0),
(15, 'Member', 'member_login', 0),
(16, 'Member', 'member_logout', 0),
(17, 'Member', 'send_reset_token', 0),
(18, 'Member', 'process_reset_password', 0),
(19, 'Member', 'send_member_email', 0),
(20, 'Member', 'update_un_pw', 0),
(21, 'Member', 'do_member_search', 0),
(22, 'Member', 'member_delete', 0),
(23, 'Member', 'send_username', 0),
(24, 'Member', 'update_profile', 0),
(25, 'Member', 'upload_avatar', 0),
(26, 'Member', 'recaptcha_check', 1),
(27, 'Member', 'validate', 0),
(28, 'Rte', 'pages_autocomplete', 0),
(29, 'File', 'addonIcon', 1),
(30, 'Relationship', 'entryList', 0),
(31, 'Search', 'do_search', 1),
(32, 'Pro', 'setCookie', 0),
(33, 'Pro', 'qrCode', 0),
(34, 'Pro', 'validateMfa', 0),
(35, 'Pro', 'invokeMfa', 0),
(36, 'Pro', 'enableMfa', 0),
(37, 'Pro', 'disableMfa', 0),
(38, 'Pro', 'resetMfa', 0),
(39, 'Structure', 'ajax_move_set_data', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_captcha`
--

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint UNSIGNED NOT NULL,
  `date` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_categories`
--

CREATE TABLE `exp_categories` (
  `cat_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL,
  `cat_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_category_fields`
--

CREATE TABLE `exp_category_fields` (
  `field_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL,
  `field_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_maxl` smallint NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int UNSIGNED NOT NULL,
  `field_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_category_field_data`
--

CREATE TABLE `exp_category_field_data` (
  `cat_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_category_groups`
--

CREATE TABLE `exp_category_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_category_posts`
--

CREATE TABLE `exp_category_posts` (
  `entry_id` int UNSIGNED NOT NULL,
  `cat_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channels`
--

CREATE TABLE `exp_channels` (
  `channel_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint NOT NULL DEFAULT '0',
  `total_records` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `cat_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int UNSIGNED DEFAULT NULL,
  `deft_category` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int UNSIGNED DEFAULT NULL,
  `channel_html_formatting` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sticky_enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_entry_cloning` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_url` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int UNSIGNED DEFAULT '5000',
  `comment_timelock` int UNSIGNED NOT NULL DEFAULT '0',
  `comment_require_email` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int UNSIGNED NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint UNSIGNED NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_preview` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `max_entries` int UNSIGNED NOT NULL DEFAULT '0',
  `conditional_sync_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_records`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `deft_status`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `sticky_enabled`, `enable_entry_cloning`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `url_title_prefix`, `preview_url`, `allow_preview`, `max_entries`, `conditional_sync_required`) VALUES
(1, 1, 'homepage', 'Homepage', 'http://localhost:4000/index.php', '', 'en', 1, 1, 0, 1665337680, 0, '', 'open', NULL, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', 'n', 'y', '', 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', 10, '', 'Title', '', 'Managed by Structure - Changes here will not have any effect', 'y', 0, 'n'),
(2, 1, 'event', 'Event', 'http://localhost:4000/index.php', '', 'en', 6, 6, 0, 1665338280, 0, '', 'open', NULL, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', 'n', 'y', '', 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', 10, '', 'Title', '', 'Managed by Structure - Changes here will not have any effect', 'y', 0, 'n'),
(3, 1, 'all_shows', 'All Shows', 'http://localhost:4000/index.php', '', 'en', 1, 1, 0, 1665338160, 0, '', 'open', NULL, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', 'n', 'y', '', 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', 10, '', 'Title', '', 'Managed by Structure - Changes here will not have any effect', 'y', 0, 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channels_channel_fields`
--

CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channels_channel_field_groups`
--

CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channels_channel_field_groups`
--

INSERT INTO `exp_channels_channel_field_groups` (`channel_id`, `group_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channels_statuses`
--

CREATE TABLE `exp_channels_statuses` (
  `channel_id` int UNSIGNED NOT NULL,
  `status_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channels_statuses`
--

INSERT INTO `exp_channels_statuses` (`channel_id`, `status_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_data`
--

CREATE TABLE `exp_channel_data` (
  `entry_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`) VALUES
(10, 1, 1),
(11, 1, 2),
(12, 1, 2),
(13, 1, 2),
(14, 1, 2),
(15, 1, 3),
(16, 1, 2),
(17, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_data_field_2`
--

CREATE TABLE `exp_channel_data_field_2` (
  `id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `field_id_2` text COLLATE utf8mb4_unicode_ci,
  `field_ft_2` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_data_field_2`
--

INSERT INTO `exp_channel_data_field_2` (`id`, `entry_id`, `field_id_2`, `field_ft_2`) VALUES
(7, 11, '{file:12:url}', 'none'),
(8, 12, '{file:11:url}', 'none'),
(9, 13, '{file:10:url}', 'none'),
(10, 14, '{file:13:url}', 'none'),
(11, 16, '{file:9:url}', 'none'),
(12, 17, '{file:8:url}', 'none');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_data_field_3`
--

CREATE TABLE `exp_channel_data_field_3` (
  `id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `field_id_3` int DEFAULT '0',
  `field_dt_3` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_ft_3` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_data_field_3`
--

INSERT INTO `exp_channel_data_field_3` (`id`, `entry_id`, `field_id_3`, `field_dt_3`, `field_ft_3`) VALUES
(7, 11, 1665432000, '', 'xhtml'),
(8, 12, 1665518400, NULL, 'xhtml'),
(9, 13, 1665424800, '', 'xhtml'),
(10, 14, 0, '', 'xhtml'),
(11, 16, 1665518400, NULL, 'xhtml'),
(12, 17, NULL, '', 'xhtml');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_data_field_4`
--

CREATE TABLE `exp_channel_data_field_4` (
  `id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `field_id_4` int DEFAULT '0',
  `field_dt_4` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_ft_4` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_data_field_4`
--

INSERT INTO `exp_channel_data_field_4` (`id`, `entry_id`, `field_id_4`, `field_dt_4`, `field_ft_4`) VALUES
(7, 11, 0, '', 'xhtml'),
(8, 12, 0, NULL, 'xhtml'),
(9, 13, 0, '', 'xhtml'),
(10, 14, 0, '', 'xhtml'),
(11, 16, 0, NULL, 'xhtml'),
(12, 17, NULL, '', 'xhtml');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_data_field_5`
--

CREATE TABLE `exp_channel_data_field_5` (
  `id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `field_id_5` text COLLATE utf8mb4_unicode_ci,
  `field_ft_5` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_data_field_5`
--

INSERT INTO `exp_channel_data_field_5` (`id`, `entry_id`, `field_id_5`, `field_ft_5`) VALUES
(7, 11, 'featured', 'none'),
(8, 12, 'featured', 'none'),
(9, 13, 'just-announced', 'none'),
(10, 14, 'upcoming', 'none'),
(11, 16, 'just-announced', 'none'),
(12, 17, 'upcoming', 'none');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_entries_autosave`
--

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int UNSIGNED NOT NULL,
  `original_entry_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL,
  `author_id` int UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int NOT NULL,
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int NOT NULL DEFAULT '0',
  `comment_expiration_date` int NOT NULL DEFAULT '0',
  `edit_date` bigint DEFAULT NULL,
  `recent_comment_date` int DEFAULT NULL,
  `comment_total` int UNSIGNED NOT NULL DEFAULT '0',
  `entry_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_entries_autosave`
--

INSERT INTO `exp_channel_entries_autosave` (`entry_id`, `original_entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`, `entry_data`) VALUES
(5, 0, 1, 2, 1, NULL, '0', 'TITLE 7', 'title-7', 'open', 'n', 0, 0, 0, 0, 'y', 'n', 0, '0', '0', '0', 0, 0, 1665384228, NULL, 0, '{\"title\":\"TITLE 7\",\"url_title\":\"title-7\",\"field_id_5\":\"just-announced\",\"field_id_2\":\"\",\"field_dt_3\":\"\",\"field_id_3\":\"\",\"field_dt_4\":\"\",\"field_id_4\":\"\",\"entry_date\":\"10\\/10\\/2022 6:43 AM\",\"expiration_date\":\"\",\"channel_id\":\"2\",\"status\":\"open\",\"author_id\":\"1\",\"structure__hidden\":\"n\",\"structure__listing_channel\":\"\",\"structure__parent_id\":\"\",\"structure__template_id\":\"\",\"structure__uri\":\"title-7\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_entry_hidden_fields`
--

CREATE TABLE `exp_channel_entry_hidden_fields` (
  `entry_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_fields`
--

CREATE TABLE `exp_channel_fields` (
  `field_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED DEFAULT '1',
  `field_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int UNSIGNED DEFAULT NULL,
  `field_pre_field_id` int UNSIGNED DEFAULT NULL,
  `field_ta_rows` tinyint DEFAULT '8',
  `field_maxl` smallint DEFAULT NULL,
  `field_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_conditional` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int UNSIGNED NOT NULL,
  `field_content_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_is_conditional`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`, `legacy_field_data`, `enable_frontedit`) VALUES
(2, 0, 'image', 'Image', '', 'file', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'n', 'none', 'y', 1, 'all', 'YTo1OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjM6ImFsbCI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJ5IjtzOjEyOiJudW1fZXhpc3RpbmciO3M6MjoiNTAiO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO30=', 'n', 'y'),
(3, 0, 'start_date', 'Start Date', '', 'date', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'n', 'xhtml', 'y', 2, 'any', 'YTowOnt9', 'n', 'y'),
(4, 0, 'end_date', 'End Date', '', 'date', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'n', 'xhtml', 'y', 3, 'any', 'YTowOnt9', 'n', 'y'),
(5, 0, 'event_type', 'Event Type', '', 'select', '', 'n', NULL, NULL, 8, NULL, 'y', 'ltr', 'n', 'n', 'n', 'none', 'y', 4, 'any', 'YToxOntzOjE3OiJ2YWx1ZV9sYWJlbF9wYWlycyI7YTozOntzOjg6ImZlYXR1cmVkIjtzOjg6IkZlYXR1cmVkIjtzOjg6InVwY29taW5nIjtzOjg6IlVwY29taW5nIjtzOjE0OiJqdXN0LWFubm91bmNlZCI7czoxNDoiSnVzdCBBbm5vdW5jZWQiO319', 'n', 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_field_groups_fields`
--

CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_field_groups_fields`
--

INSERT INTO `exp_channel_field_groups_fields` (`field_id`, `group_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_form_settings`
--

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int UNSIGNED NOT NULL DEFAULT '0',
  `default_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_form_settings`
--

INSERT INTO `exp_channel_form_settings` (`channel_form_settings_id`, `site_id`, `channel_id`, `default_status`, `allow_guest_posts`, `default_author`) VALUES
(1, 1, 1, '', 'n', 1),
(2, 1, 2, '', 'n', 1),
(3, 1, 3, '', 'n', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_member_roles`
--

CREATE TABLE `exp_channel_member_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_member_roles`
--

INSERT INTO `exp_channel_member_roles` (`role_id`, `channel_id`) VALUES
(5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_channel_titles`
--

CREATE TABLE `exp_channel_titles` (
  `entry_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL,
  `author_id` int UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int UNSIGNED NOT NULL,
  `versioning_enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int NOT NULL,
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int NOT NULL DEFAULT '0',
  `comment_expiration_date` int NOT NULL DEFAULT '0',
  `edit_date` bigint DEFAULT NULL,
  `recent_comment_date` int DEFAULT NULL,
  `comment_total` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `status_id`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(10, 1, 1, 1, NULL, '192.168.0.6', 'Homepage', 'homepage', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665337680, '2022', '10', '09', 0, 0, 1665337729, NULL, 0),
(11, 1, 2, 1, NULL, '192.168.0.6', 'Simply Red', 'simply-red', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665337920, '2022', '10', '09', 0, 0, 1665337979, NULL, 0),
(12, 1, 2, 1, NULL, '192.168.0.6', 'Paul Heaton and Jacqui Abbott', 'paul-heaton-and-jacqui-abbott', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665337980, '2022', '10', '09', 0, 0, 1665338052, NULL, 0),
(13, 1, 2, 1, NULL, '192.168.0.6', 'Stormzy', 'stormzy', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665338040, '2022', '10', '09', 0, 0, 1665338088, NULL, 0),
(14, 1, 2, 1, NULL, '192.168.0.6', 'The War on Drugs', 'the-war-on-drugs', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665338100, '2022', '10', '09', 0, 0, 1665338153, NULL, 0),
(15, 1, 3, 1, NULL, '192.168.0.6', 'All Shows', 'shows', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665338160, '2022', '10', '09', 0, 0, 1665338213, NULL, 0),
(16, 1, 2, 1, NULL, '192.168.0.6', 'ABBA Orchestral', 'abba-orchestral', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665338220, '2022', '10', '09', 0, 0, 1665338269, NULL, 0),
(17, 1, 2, 1, NULL, '192.168.0.6', 'James Taylor & his All-Star Band', 'james-taylor-his-all-star-band', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1665338280, '2022', '10', '09', 0, 0, 1665338569, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_comments`
--

CREATE TABLE `exp_comments` (
  `comment_id` int UNSIGNED NOT NULL,
  `site_id` int DEFAULT '1',
  `entry_id` int UNSIGNED DEFAULT '0',
  `channel_id` int UNSIGNED DEFAULT '1',
  `author_id` int UNSIGNED DEFAULT '0',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int DEFAULT NULL,
  `edit_date` int DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_comment_subscriptions`
--

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED DEFAULT NULL,
  `member_id` int DEFAULT '0',
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_config`
--

CREATE TABLE `exp_config` (
  `config_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `exp_config`
--

INSERT INTO `exp_config` (`config_id`, `site_id`, `key`, `value`) VALUES
(1, 1, 'is_site_on', 'y'),
(2, 1, 'base_url', 'http://localhost/'),
(3, 1, 'base_path', '/var/www/html/public/'),
(4, 1, 'site_index', 'index.php'),
(5, 1, 'site_url', '{base_url}'),
(6, 1, 'cp_url', '{base_url}admin.php'),
(7, 1, 'theme_folder_url', '{base_url}themes/'),
(8, 1, 'theme_folder_path', '{base_path}themes/'),
(9, 1, 'webmaster_email', 'test@admin.com'),
(10, 1, 'webmaster_name', ''),
(11, 1, 'channel_nomenclature', 'channel'),
(12, 1, 'max_caches', '150'),
(13, 1, 'captcha_url', '{base_url}images/captchas/'),
(14, 1, 'captcha_path', '{base_path}images/captchas/'),
(15, 1, 'captcha_font', 'y'),
(16, 1, 'captcha_rand', 'y'),
(17, 1, 'captcha_require_members', 'n'),
(18, 1, 'require_captcha', 'n'),
(19, 1, 'enable_sql_caching', 'n'),
(20, 1, 'force_query_string', 'n'),
(21, 1, 'show_profiler', 'n'),
(22, 1, 'include_seconds', 'n'),
(23, 1, 'cookie_domain', ''),
(24, 1, 'cookie_path', '/'),
(25, 1, 'cookie_httponly', 'y'),
(26, 1, 'website_session_type', 'c'),
(27, 1, 'cp_session_type', 'c'),
(28, 1, 'allow_username_change', 'y'),
(29, 1, 'allow_multi_logins', 'y'),
(30, 1, 'password_lockout', 'y'),
(31, 1, 'password_lockout_interval', '1'),
(32, 1, 'require_ip_for_login', 'y'),
(33, 1, 'require_ip_for_posting', 'y'),
(34, 1, 'password_security_policy', 'basic'),
(35, 1, 'allow_dictionary_pw', 'y'),
(36, 1, 'name_of_dictionary_file', 'dictionary.txt'),
(37, 1, 'xss_clean_uploads', 'y'),
(38, 1, 'redirect_method', 'redirect'),
(39, 1, 'deft_lang', 'english'),
(40, 1, 'xml_lang', 'en'),
(41, 1, 'send_headers', 'y'),
(42, 1, 'gzip_output', 'n'),
(43, 1, 'default_site_timezone', ''),
(44, 1, 'date_format', '%n/%j/%Y'),
(45, 1, 'time_format', '12'),
(46, 1, 'mail_protocol', 'mail'),
(47, 1, 'email_newline', '\\n'),
(48, 1, 'smtp_server', ''),
(49, 1, 'smtp_username', ''),
(50, 1, 'smtp_password', ''),
(51, 1, 'email_smtp_crypto', 'ssl'),
(52, 1, 'email_debug', 'n'),
(53, 1, 'email_charset', 'utf-8'),
(54, 1, 'email_batchmode', 'n'),
(55, 1, 'email_batch_size', ''),
(56, 1, 'mail_format', 'plain'),
(57, 1, 'word_wrap', 'y'),
(58, 1, 'email_console_timelock', '5'),
(59, 1, 'log_email_console_msgs', 'y'),
(60, 1, 'log_search_terms', 'y'),
(61, 1, 'deny_duplicate_data', 'y'),
(62, 1, 'redirect_submitted_links', 'n'),
(63, 1, 'enable_censoring', 'n'),
(64, 1, 'censored_words', ''),
(65, 1, 'censor_replacement', ''),
(66, 1, 'banned_ips', ''),
(67, 1, 'banned_emails', ''),
(68, 1, 'banned_usernames', ''),
(69, 1, 'banned_screen_names', ''),
(70, 1, 'ban_action', 'restrict'),
(71, 1, 'ban_message', 'This site is currently unavailable'),
(72, 1, 'ban_destination', 'http://www.yahoo.com/'),
(73, 1, 'enable_emoticons', 'y'),
(74, 1, 'emoticon_url', '{base_url}images/smileys/'),
(75, 1, 'recount_batch_total', '1000'),
(76, 1, 'new_version_check', 'y'),
(77, 1, 'enable_throttling', 'n'),
(78, 1, 'banish_masked_ips', 'y'),
(79, 1, 'max_page_loads', '10'),
(80, 1, 'time_interval', '8'),
(81, 1, 'lockout_time', '30'),
(82, 1, 'banishment_type', 'message'),
(83, 1, 'banishment_url', ''),
(84, 1, 'banishment_message', 'You have exceeded the allowed page load frequency.'),
(85, 1, 'enable_search_log', 'y'),
(86, 1, 'max_logged_searches', '500'),
(87, 1, 'un_min_len', '4'),
(88, 1, 'pw_min_len', '5'),
(89, 1, 'allow_member_registration', 'n'),
(90, 1, 'allow_member_localization', 'y'),
(91, 1, 'req_mbr_activation', 'email'),
(92, 1, 'new_member_notification', 'n'),
(93, 1, 'mbr_notification_emails', ''),
(94, 1, 'require_terms_of_service', 'y'),
(95, 1, 'default_primary_role', '5'),
(96, 1, 'profile_trigger', 'member1665070903'),
(97, 1, 'member_theme', 'default'),
(98, 1, 'avatar_url', '{base_url}images/avatars/'),
(99, 1, 'avatar_path', '{base_path}images/avatars/'),
(100, 1, 'avatar_max_width', '100'),
(101, 1, 'avatar_max_height', '100'),
(102, 1, 'avatar_max_kb', '50'),
(103, 1, 'enable_photos', 'n'),
(104, 1, 'photo_url', '{base_url}images/member_photos/'),
(105, 1, 'photo_path', '/'),
(106, 1, 'photo_max_width', '100'),
(107, 1, 'photo_max_height', '100'),
(108, 1, 'photo_max_kb', '50'),
(109, 1, 'allow_signatures', 'y'),
(110, 1, 'sig_maxlength', '500'),
(111, 1, 'sig_allow_img_hotlink', 'n'),
(112, 1, 'sig_allow_img_upload', 'n'),
(113, 1, 'sig_img_url', '{base_url}images/signature_attachments/'),
(114, 1, 'sig_img_path', '{base_path}images/signature_attachments/'),
(115, 1, 'sig_img_max_width', '480'),
(116, 1, 'sig_img_max_height', '80'),
(117, 1, 'sig_img_max_kb', '30'),
(118, 1, 'prv_msg_enabled', 'y'),
(119, 1, 'prv_msg_allow_attachments', 'y'),
(120, 1, 'prv_msg_upload_path', '{base_path}images/pm_attachments/'),
(121, 1, 'prv_msg_max_attachments', '3'),
(122, 1, 'prv_msg_attach_maxsize', '250'),
(123, 1, 'prv_msg_attach_total', '100'),
(124, 1, 'prv_msg_html_format', 'safe'),
(125, 1, 'prv_msg_auto_links', 'y'),
(126, 1, 'prv_msg_max_chars', '6000'),
(127, 1, 'memberlist_order_by', 'member_id'),
(128, 1, 'memberlist_sort_order', 'desc'),
(129, 1, 'memberlist_row_limit', '20'),
(130, 1, 'site_404', ''),
(131, 1, 'save_tmpl_revisions', 'n'),
(132, 1, 'max_tmpl_revisions', '5'),
(133, 1, 'strict_urls', 'y'),
(134, 1, 'enable_template_routes', 'y'),
(135, 1, 'image_resize_protocol', 'gd2'),
(136, 1, 'image_library_path', ''),
(137, 1, 'word_separator', 'dash'),
(138, 1, 'use_category_name', 'n'),
(139, 1, 'reserved_category_word', 'category'),
(140, 1, 'auto_convert_high_ascii', 'n'),
(141, 1, 'new_posts_clear_caches', 'y'),
(142, 1, 'auto_assign_cat_parents', 'y'),
(143, 0, 'cache_driver', 'file'),
(144, 0, 'cookie_prefix', ''),
(145, 0, 'debug', '1'),
(146, 0, 'file_manager_compatibility_mode', 'n'),
(147, 0, 'is_system_on', 'y'),
(148, 0, 'cli_enabled', 'y'),
(149, 0, 'legacy_member_data', 'n'),
(150, 0, 'legacy_channel_data', 'n'),
(151, 0, 'legacy_category_field_data', 'n'),
(152, 0, 'enable_dock', 'y'),
(153, 0, 'enable_frontedit', 'y'),
(154, 0, 'automatic_frontedit_links', 'y'),
(155, 0, 'enable_mfa', 'y'),
(156, 0, 'autosave_interval_seconds', '10'),
(157, 1, 'site_license_key', ''),
(158, 0, 'multiple_sites_enabled', 'n'),
(159, 1, 'show_ee_news', 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_consents`
--

CREATE TABLE `exp_consents` (
  `consent_id` int UNSIGNED NOT NULL,
  `consent_request_id` int UNSIGNED NOT NULL,
  `consent_request_version_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `request_copy` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consent_given` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` int DEFAULT NULL,
  `response_date` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_consent_audit_log`
--

CREATE TABLE `exp_consent_audit_log` (
  `consent_audit_id` int UNSIGNED NOT NULL,
  `consent_request_id` int UNSIGNED NOT NULL,
  `consent_request_version_id` int UNSIGNED DEFAULT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_consent_requests`
--

CREATE TABLE `exp_consent_requests` (
  `consent_request_id` int UNSIGNED NOT NULL,
  `consent_request_version_id` int UNSIGNED DEFAULT NULL,
  `user_created` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `double_opt_in` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_consent_requests`
--

INSERT INTO `exp_consent_requests` (`consent_request_id`, `consent_request_version_id`, `user_created`, `title`, `consent_name`, `double_opt_in`, `retention_period`) VALUES
(1, 1, 'n', 'Functionality Cookies', 'ee:cookies_functionality', 'n', NULL),
(2, 2, 'n', 'Performance Cookies', 'ee:cookies_performance', 'n', NULL),
(3, 3, 'n', 'Targeting Cookies', 'ee:cookies_targeting', 'n', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_consent_request_versions`
--

CREATE TABLE `exp_consent_request_versions` (
  `consent_request_version_id` int UNSIGNED NOT NULL,
  `consent_request_id` int UNSIGNED NOT NULL,
  `request` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `create_date` int NOT NULL DEFAULT '0',
  `author_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_consent_request_versions`
--

INSERT INTO `exp_consent_request_versions` (`consent_request_version_id`, `consent_request_id`, `request`, `request_format`, `create_date`, `author_id`) VALUES
(1, 1, 'These cookies help us personalize content and functionality for you, including remembering changes you have made to parts of the website that you can customize, or selections for services made on previous visits. If you do not allow these cookies, some portions of our website may be less friendly and easy to use, forcing you to enter content or set your preferences on each visit.', 'none', 1665070903, 0),
(2, 2, 'These cookies allow us measure how visitors use our website, which pages are popular, and what our traffic sources are. This helps us improve how our website works and make it easier for all visitors to find what they are looking for. The information is aggregated and anonymous, and cannot be used to identify you. If you do not allow these cookies, we will be unable to use your visits to our website to help make improvements.', 'none', 1665070903, 0),
(3, 3, 'These cookies are usually placed by third-party advertising networks, which may use information about your website visits to develop a profile of your interests. This information may be shared with other advertisers and/or websites to deliver more relevant advertising to you across multiple websites. If you do not allow these cookies, visits to this website will not be shared with advertising partners and will not contribute to targeted advertising on other websites.', 'none', 1665070903, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_consent_request_version_cookies`
--

CREATE TABLE `exp_consent_request_version_cookies` (
  `consent_request_version_id` int UNSIGNED NOT NULL,
  `cookie_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_content_types`
--

CREATE TABLE `exp_content_types` (
  `content_type_id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_content_types`
--

INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES
(2, 'channel'),
(1, 'grid');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_cookie_settings`
--

CREATE TABLE `exp_cookie_settings` (
  `cookie_id` int UNSIGNED NOT NULL,
  `cookie_provider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_lifetime` int UNSIGNED DEFAULT NULL,
  `cookie_enforced_lifetime` int UNSIGNED DEFAULT NULL,
  `cookie_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_cookie_settings`
--

INSERT INTO `exp_cookie_settings` (`cookie_id`, `cookie_provider`, `cookie_name`, `cookie_lifetime`, `cookie_enforced_lifetime`, `cookie_title`, `cookie_description`) VALUES
(1, 'ee', 'csrf_token', 7200, NULL, 'CSRF Token', 'A security cookie used to identify the user and prevent Cross Site Request Forgery attacks.'),
(2, 'ee', 'flash', 0, NULL, 'Flash data', 'User feedback messages, encrypted for security.'),
(3, 'ee', 'remember', 1209600, NULL, 'Remember Me', 'Determines whether a user is automatically logged in upon visiting the site.'),
(4, 'ee', 'sessionid', 3600, NULL, 'Session ID', 'Session id, used to associate a logged in user with their data.'),
(5, 'ee', 'visitor_consents', NULL, NULL, 'Visitor Consents', 'Saves responses to Consent requests for non-logged in visitors'),
(6, 'ee', 'last_activity', NULL, NULL, 'Last Activity', 'Records the time of the last page load. Used in in calculating active sessions.'),
(7, 'ee', 'last_visit', NULL, NULL, 'Last Visit', 'Date of the user’s last visit, based on the last_activity cookie. Can be shown as a statistic for members and used by forum and comments to show unread topics for both members and guests.'),
(8, 'ee', 'anon', NULL, NULL, 'Anonymize', 'Determines whether the user’s username is displayed in the list of currently logged in members.'),
(9, 'ee', 'tracker', 0, NULL, 'Tracker', 'Contains the last 5 pages viewed, encrypted for security. Typically used for form or error message returns.'),
(10, 'cp', 'viewtype', 31104000, NULL, 'Filemanager View Type', 'Determines View Type to be used in Filemanager (table or thumbs view)'),
(11, 'cp', 'cp_last_site_id', NULL, NULL, 'CP Last Site ID', 'MSM cookie indicating the last site accessed in the Control Panel.'),
(12, 'cp', 'ee_cp_viewmode', NULL, NULL, 'CP View Mode', 'Determines view mode for the Control Panel.'),
(13, 'cp', 'secondary_sidebar', NULL, NULL, 'Secondary Sidebar State', 'Determines whether secondary navigation sidebar in the Control Panel should be collapsed for each corresponding section.'),
(14, 'cp', 'collapsed_nav', NULL, NULL, 'Collapsed Navigation', 'Determines whether navigation sidebar in the Control Panel should be collapsed.'),
(15, 'comment', 'my_email', NULL, NULL, 'My email', 'Email address specified when posting a comment.'),
(16, 'comment', 'my_location', NULL, NULL, 'My location', 'Location specified when posting a comment.'),
(17, 'comment', 'my_name', NULL, NULL, 'My name', 'Name specified when posting a comment.'),
(18, 'comment', 'my_url', NULL, NULL, 'My URL', 'URL specified when posting a comment.'),
(19, 'comment', 'notify_me', NULL, NULL, 'Notify me', 'If set to ‘yes’, notifications will be sent to the saved email address when new comments are made.'),
(20, 'comment', 'save_info', NULL, NULL, 'Save info', 'If set to ‘yes’, allows additional cookies (my_email, my_location, my_name, my_url) to store guest user information for use when filling out comment forms. This cookie is only set if you submit a comment.'),
(21, 'pro', 'frontedit', 31104000, NULL, 'Front-end editing', 'Determines whether ExpressioEngine front-end editing features should be enabled.');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_cp_log`
--

CREATE TABLE `exp_cp_log` (
  `id` int NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int UNSIGNED NOT NULL,
  `username` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int NOT NULL,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'admin', '172.31.0.1', 1665070929, 'Logged in'),
(2, 1, 1, 'admin', '192.168.64.1', 1665146565, 'Logged in'),
(3, 1, 1, 'admin', '192.168.64.1', 1665146827, 'Channel Created&nbsp;&nbsp;Homepage'),
(4, 1, 1, 'admin', '192.168.96.1', 1665149927, 'Logged in'),
(5, 1, 1, 'admin', '192.168.96.1', 1665152388, 'Logged in'),
(6, 1, 1, 'admin', '192.168.96.1', 1665157069, 'Logged in'),
(7, 1, 1, 'admin', '192.168.96.1', 1665221186, 'Logged in'),
(8, 1, 1, 'admin', '192.168.112.1', 1665225212, 'Channel Created&nbsp;&nbsp;Event'),
(9, 1, 1, 'admin', '192.168.208.1', 1665227034, 'Logged in'),
(10, 1, 1, 'admin', '192.168.144.1', 1665235406, 'Logged in'),
(11, 1, 1, 'admin', '192.168.144.1', 1665238436, 'The following field was removed and its data was deleted: <b>Event</b>'),
(12, 1, 1, 'admin', '192.168.144.1', 1665243613, 'Logged in'),
(13, 1, 1, 'admin', '192.168.144.1', 1665243672, 'Logged in'),
(14, 1, 1, 'admin', '192.168.144.1', 1665246454, 'Channel Created&nbsp;&nbsp;All Shows'),
(15, 1, 1, 'admin', '192.168.208.1', 1665250431, 'Logged in'),
(16, 1, 1, 'admin', '192.168.224.1', 1665250683, 'Logged in'),
(17, 1, 1, 'admin', '192.168.224.1', 1665301485, 'Logged in'),
(18, 1, 1, 'admin', '192.168.224.1', 1665301493, 'Logged in'),
(19, 1, 1, 'admin', '172.23.0.1', 1665308107, 'Logged in'),
(20, 1, 1, 'admin', '172.31.0.6', 1665328511, 'Logged in'),
(21, 1, 1, 'admin', '192.168.0.6', 1665351304, 'Logged in'),
(22, 1, 1, 'admin', '192.168.0.6', 1665381650, 'Logged in'),
(23, 1, 1, 'admin', '192.168.0.6', 1665382259, 'Logged out'),
(24, 1, 1, 'admin', '192.168.0.6', 1665382277, 'Logged in'),
(25, 1, 1, 'admin', '192.168.0.6', 1665385718, 'Logged out');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_dashboard_layouts`
--

CREATE TABLE `exp_dashboard_layouts` (
  `layout_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED DEFAULT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_dashboard_layout_widgets`
--

CREATE TABLE `exp_dashboard_layout_widgets` (
  `layout_id` int UNSIGNED NOT NULL,
  `widget_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_dashboard_widgets`
--

CREATE TABLE `exp_dashboard_widgets` (
  `widget_id` int UNSIGNED NOT NULL,
  `widget_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `widget_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_dashboard_widgets`
--

INSERT INTO `exp_dashboard_widgets` (`widget_id`, `widget_name`, `widget_data`, `widget_type`, `widget_source`, `widget_file`) VALUES
(1, NULL, NULL, 'php', 'pro', 'comments'),
(2, NULL, NULL, 'php', 'pro', 'eecms_news'),
(3, NULL, NULL, 'php', 'pro', 'members'),
(4, NULL, NULL, 'php', 'pro', 'recent_entries'),
(5, NULL, NULL, 'php', 'pro', 'recent_templates'),
(6, NULL, NULL, 'html', 'pro', 'support');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_developer_log`
--

CREATE TABLE `exp_developer_log` (
  `log_id` int UNSIGNED NOT NULL,
  `timestamp` int UNSIGNED NOT NULL,
  `viewed` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int UNSIGNED DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int UNSIGNED NOT NULL DEFAULT '0',
  `template_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hash` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_docks`
--

CREATE TABLE `exp_docks` (
  `dock_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_docks`
--

INSERT INTO `exp_docks` (`dock_id`, `site_id`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_dock_prolets`
--

CREATE TABLE `exp_dock_prolets` (
  `dock_id` int UNSIGNED NOT NULL,
  `prolet_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_dock_prolets`
--

INSERT INTO `exp_dock_prolets` (`dock_id`, `prolet_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_email_cache`
--

CREATE TABLE `exp_email_cache` (
  `cache_id` int UNSIGNED NOT NULL,
  `cache_date` int UNSIGNED NOT NULL DEFAULT '0',
  `total_sent` int UNSIGNED NOT NULL,
  `from_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_array` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtype` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_fmt` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordwrap` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_email_cache_mg`
--

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int UNSIGNED NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_email_cache_ml`
--

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int UNSIGNED NOT NULL,
  `list_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_email_console_cache`
--

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int UNSIGNED NOT NULL,
  `cache_date` int UNSIGNED NOT NULL DEFAULT '0',
  `member_id` int UNSIGNED NOT NULL,
  `member_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_entry_manager_views`
--

CREATE TABLE `exp_entry_manager_views` (
  `view_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_entry_versioning`
--

CREATE TABLE `exp_entry_versioning` (
  `version_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `author_id` int UNSIGNED NOT NULL,
  `version_date` int NOT NULL,
  `version_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_extensions`
--

CREATE TABLE `exp_extensions` (
  `extension_id` int UNSIGNED NOT NULL,
  `class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '10',
  `version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Comment_ext', 'addCommentMenu', 'cp_custom_menu', 'a:0:{}', 10, '2.3.3', 'y'),
(2, 'Structure_ext', 'after_channel_entry_save', 'after_channel_entry_save', 'a:0:{}', 10, '6.0.0', 'y'),
(3, 'Structure_ext', 'sessions_end', 'sessions_end', 'a:0:{}', 10, '6.0.0', 'y'),
(4, 'Structure_ext', 'entry_submission_redirect', 'entry_submission_redirect', 'a:0:{}', 10, '6.0.0', 'y'),
(5, 'Structure_ext', 'cp_member_login', 'cp_member_login', 'a:0:{}', 10, '6.0.0', 'y'),
(6, 'Structure_ext', 'sessions_start', 'sessions_start', 'a:0:{}', 10, '6.0.0', 'y'),
(7, 'Structure_ext', 'pagination_create', 'pagination_create', 'a:0:{}', 10, '6.0.0', 'y'),
(8, 'Structure_ext', 'wygwam_config', 'wygwam_config', 'a:0:{}', 10, '6.0.0', 'y'),
(9, 'Structure_ext', 'core_template_route', 'core_template_route', 'a:0:{}', 10, '6.0.0', 'y'),
(10, 'Structure_ext', 'entry_submission_end', 'entry_submission_end', 'a:0:{}', 10, '6.0.0', 'y'),
(11, 'Structure_ext', 'channel_form_submit_entry_end', 'channel_form_submit_entry_end', 'a:0:{}', 10, '6.0.0', 'y'),
(12, 'Structure_ext', 'template_post_parse', 'template_post_parse', 'a:0:{}', 10, '6.0.0', 'y'),
(13, 'Structure_ext', 'cp_custom_menu', 'cp_custom_menu', 'a:0:{}', 10, '6.0.0', 'y'),
(14, 'Structure_ext', 'publish_live_preview_route', 'publish_live_preview_route', 'a:0:{}', 10, '6.0.0', 'y'),
(15, 'Structure_ext', 'entry_save_and_close_redirect', 'entry_save_and_close_redirect', 'a:0:{}', 10, '6.0.0', 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_fieldtypes`
--

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0.0', 'YTowOnt9', 'n'),
(3, 'number', '1.0.0', 'YTowOnt9', 'n'),
(4, 'textarea', '1.0.0', 'YTowOnt9', 'n'),
(5, 'date', '1.0.0', 'YTowOnt9', 'n'),
(6, 'duration', '1.0.0', 'YTowOnt9', 'n'),
(7, 'email_address', '1.0.0', 'YTowOnt9', 'n'),
(8, 'file', '1.1.0', 'YTowOnt9', 'n'),
(9, 'fluid_field', '1.0.0', 'YTowOnt9', 'n'),
(10, 'grid', '1.0.0', 'YTowOnt9', 'n'),
(11, 'file_grid', '1.0.0', 'YTowOnt9', 'n'),
(12, 'multi_select', '1.0.0', 'YTowOnt9', 'n'),
(13, 'checkboxes', '1.0.0', 'YTowOnt9', 'n'),
(14, 'radio', '1.0.0', 'YTowOnt9', 'n'),
(15, 'relationship', '1.0.0', 'YTowOnt9', 'n'),
(16, 'rte', '2.1.0', 'YTowOnt9', 'n'),
(17, 'slider', '1.0.0', 'YTowOnt9', 'n'),
(18, 'range_slider', '1.0.0', 'YTowOnt9', 'n'),
(19, 'toggle', '1.0.0', 'YTowOnt9', 'n'),
(20, 'url', '1.0.0', 'YTowOnt9', 'n'),
(21, 'colorpicker', '1.0.0', 'YTowOnt9', 'n'),
(22, 'selectable_buttons', '1.0.0', 'YTowOnt9', 'n'),
(23, 'notes', '1.0.0', 'YTowOnt9', 'n'),
(24, 'structure', '6.0.0', 'YToxOntzOjE5OiJzdHJ1Y3R1cmVfbGlzdF90eXBlIjtzOjU6InBhZ2VzIjt9', 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_field_conditions`
--

CREATE TABLE `exp_field_conditions` (
  `condition_id` int UNSIGNED NOT NULL,
  `condition_set_id` int UNSIGNED NOT NULL,
  `condition_field_id` int UNSIGNED NOT NULL,
  `evaluation_rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_field_condition_sets`
--

CREATE TABLE `exp_field_condition_sets` (
  `condition_set_id` int UNSIGNED NOT NULL,
  `match` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_field_condition_sets_channel_fields`
--

CREATE TABLE `exp_field_condition_sets_channel_fields` (
  `condition_set_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_field_groups`
--

CREATE TABLE `exp_field_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED DEFAULT '1',
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 0, 'Event Fields');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_files`
--

CREATE TABLE `exp_files` (
  `file_id` int UNSIGNED NOT NULL,
  `model_type` enum('File','Directory') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'File',
  `site_id` int UNSIGNED DEFAULT '1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int UNSIGNED DEFAULT '0',
  `directory_id` int UNSIGNED DEFAULT '0',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int UNSIGNED DEFAULT '0',
  `upload_date` int DEFAULT NULL,
  `modified_by_member_id` int UNSIGNED DEFAULT '0',
  `modified_date` int DEFAULT NULL,
  `file_hw_original` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total_records` int UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `model_type`, `site_id`, `title`, `upload_location_id`, `directory_id`, `mime_type`, `file_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`, `total_records`) VALUES
(8, 'File', 1, 'JT_300x300.jpg', 4, 0, 'image/jpeg', 'img', 'JT_300x300.jpg', 19784, NULL, NULL, NULL, 1, 1665313721, 1, 1665313721, '400 400', 1),
(9, 'File', 1, 'abba-orchestral-2021-300x300.jpg', 4, 0, 'image/jpeg', 'img', 'abba-orchestral-2021-300x300.jpg', 25139, NULL, NULL, NULL, 1, 1665313721, 1, 1665313721, '400 400', 1),
(10, 'File', 1, 'stormzy-2020-300x300.jpg', 4, 0, 'image/jpeg', 'img', 'stormzy-2020-300x300.jpg', 8387, NULL, NULL, NULL, 1, 1665313721, 1, 1665313721, '400 400', 1),
(11, 'File', 1, 'paul-heaton-300x300.png', 4, 0, 'image/png', 'img', 'paul-heaton-300x300.png', 58798, NULL, NULL, NULL, 1, 1665313721, 1, 1665313721, '400 400', 1),
(12, 'File', 1, 'Simply-Red-2020-300x300.jpg', 4, 0, 'image/jpeg', 'img', 'Simply-Red-2020-300x300.jpg', 17377, NULL, NULL, NULL, 1, 1665313721, 1, 1665313721, '400 400', 1),
(13, 'File', 1, 'TWOD_300x300.jpg', 4, 0, 'image/jpeg', 'img', 'TWOD_300x300.jpg', 32195, NULL, NULL, NULL, 1, 1665313722, 1, 1665313722, '400 400', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_file_categories`
--

CREATE TABLE `exp_file_categories` (
  `file_id` int UNSIGNED NOT NULL,
  `cat_id` int UNSIGNED NOT NULL,
  `sort` int UNSIGNED DEFAULT '0',
  `is_cover` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_file_data`
--

CREATE TABLE `exp_file_data` (
  `file_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_file_dimensions`
--

CREATE TABLE `exp_file_dimensions` (
  `id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `upload_location_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int DEFAULT '0',
  `height` int DEFAULT '0',
  `quality` tinyint UNSIGNED DEFAULT '90',
  `watermark_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_file_manager_views`
--

CREATE TABLE `exp_file_manager_views` (
  `view_id` int UNSIGNED NOT NULL,
  `viewtype` varchar(10) NOT NULL DEFAULT 'list',
  `upload_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_file_usage`
--

CREATE TABLE `exp_file_usage` (
  `file_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL DEFAULT '0',
  `cat_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_file_usage`
--

INSERT INTO `exp_file_usage` (`file_id`, `entry_id`, `cat_id`) VALUES
(12, 11, 0),
(11, 12, 0),
(10, 13, 0),
(13, 14, 0),
(9, 16, 0),
(8, 17, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_file_watermarks`
--

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int UNSIGNED NOT NULL,
  `wm_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int UNSIGNED DEFAULT NULL,
  `wm_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int UNSIGNED DEFAULT NULL,
  `wm_opacity` int UNSIGNED DEFAULT NULL,
  `wm_hor_offset` int UNSIGNED DEFAULT NULL,
  `wm_vrt_offset` int UNSIGNED DEFAULT NULL,
  `wm_x_transp` int DEFAULT NULL,
  `wm_y_transp` int DEFAULT NULL,
  `wm_font_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int UNSIGNED DEFAULT NULL,
  `wm_shadow_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_fluid_field_data`
--

CREATE TABLE `exp_fluid_field_data` (
  `id` int UNSIGNED NOT NULL,
  `fluid_field_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL,
  `field_data_id` int UNSIGNED NOT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_global_variables`
--

CREATE TABLE `exp_global_variables` (
  `variable_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `variable_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_grid_columns`
--

CREATE TABLE `exp_grid_columns` (
  `col_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED DEFAULT NULL,
  `content_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int UNSIGNED DEFAULT NULL,
  `col_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int UNSIGNED DEFAULT NULL,
  `col_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_html_buttons`
--

CREATE TABLE `exp_html_buttons` (
  `id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int NOT NULL DEFAULT '0',
  `tag_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int UNSIGNED NOT NULL,
  `tag_row` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'html_btn_bold', '<strong>', '</strong>', 'b', 1, '1', 'html-bold'),
(2, 1, 0, 'html_btn_italic', '<em>', '</em>', 'i', 2, '1', 'html-italic'),
(3, 1, 0, 'html_btn_blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'html-quote'),
(4, 1, 0, 'html_btn_anchor', '<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>', '</a>', 'k', 4, '1', 'html-link'),
(5, 1, 0, 'html_btn_picture', '<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />', '', '', 5, '1', 'html-upload');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_layout_publish`
--

CREATE TABLE `exp_layout_publish` (
  `layout_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL DEFAULT '0',
  `layout_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_layout_publish`
--

INSERT INTO `exp_layout_publish` (`layout_id`, `site_id`, `channel_id`, `layout_name`, `field_layout`) VALUES
(1, 1, 2, 'Event Layout', 'a:5:{i:0;a:4:{s:2:\"id\";s:7:\"publish\";s:4:\"name\";s:7:\"publish\";s:7:\"visible\";b:1;s:6:\"fields\";a:6:{i:0;a:4:{s:5:\"field\";s:5:\"title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:9:\"url_title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:4:{s:5:\"field\";s:10:\"field_id_5\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:3;a:4:{s:5:\"field\";s:10:\"field_id_2\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:4;a:4:{s:5:\"field\";s:10:\"field_id_3\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:5;a:4:{s:5:\"field\";s:10:\"field_id_4\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:1;a:4:{s:2:\"id\";s:4:\"date\";s:4:\"name\";s:4:\"date\";s:7:\"visible\";b:1;s:6:\"fields\";a:2:{i:0;a:4:{s:5:\"field\";s:10:\"entry_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:15:\"expiration_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:2;a:4:{s:2:\"id\";s:10:\"categories\";s:4:\"name\";s:10:\"categories\";s:7:\"visible\";b:1;s:6:\"fields\";a:0:{}}i:3;a:4:{s:2:\"id\";s:7:\"options\";s:4:\"name\";s:7:\"options\";s:7:\"visible\";b:1;s:6:\"fields\";a:3:{i:0;a:4:{s:5:\"field\";s:10:\"channel_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:6:\"status\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:4:{s:5:\"field\";s:9:\"author_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:4;a:4:{s:2:\"id\";s:9:\"structure\";s:4:\"name\";s:9:\"structure\";s:7:\"visible\";b:1;s:6:\"fields\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_layout_publish_member_roles`
--

CREATE TABLE `exp_layout_publish_member_roles` (
  `layout_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_layout_publish_member_roles`
--

INSERT INTO `exp_layout_publish_member_roles` (`layout_id`, `role_id`) VALUES
(1, 1),
(1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_members`
--

CREATE TABLE `exp_members` (
  `member_id` int UNSIGNED NOT NULL,
  `role_id` int NOT NULL DEFAULT '0',
  `pending_role_id` int NOT NULL DEFAULT '0',
  `username` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backup_mfa_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `avatar_filename` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` int UNSIGNED DEFAULT NULL,
  `avatar_height` int UNSIGNED DEFAULT NULL,
  `photo_filename` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int UNSIGNED DEFAULT NULL,
  `photo_height` int UNSIGNED DEFAULT NULL,
  `sig_img_filename` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int UNSIGNED DEFAULT NULL,
  `sig_img_height` int UNSIGNED DEFAULT NULL,
  `ignore_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `private_messages` int UNSIGNED NOT NULL DEFAULT '0',
  `accept_messages` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int NOT NULL DEFAULT '0',
  `last_bulletin_date` int NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_visit` int UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int UNSIGNED NOT NULL DEFAULT '0',
  `total_entries` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_email_date` int UNSIGNED NOT NULL DEFAULT '0',
  `in_authorlist` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template_size` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notepad_size` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quick_links` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quick_tabs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `show_sidebar` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cp_homepage_custom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dismissed_banner` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_mfa` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `role_id`, `pending_role_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `backup_mfa_code`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `dismissed_banner`, `enable_mfa`) VALUES
(1, 1, 0, 'admin', 'admin', '$2y$10$.Zdtur8yyWxvp2sdAzCez.HKF4g68lVNRt3CpxMZy.RF8VMhFobP2', '', '5c1fceccf41c9795358b64deadf2384e5ed24f1f', 'c365942f3202541a6601350bd5b871d6b90d6e54', NULL, NULL, 'test@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '172.31.0.1', 1665070903, 1665353115, 1665385460, 8, 0, 0, 0, 1665338280, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, 'Pages|admin.php?/cp/addons/settings/structure|1', NULL, 'n', 0, NULL, NULL, NULL, 'y', 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_members_roles`
--

CREATE TABLE `exp_members_roles` (
  `member_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_members_roles`
--

INSERT INTO `exp_members_roles` (`member_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_members_role_groups`
--

CREATE TABLE `exp_members_role_groups` (
  `member_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_member_bulletin_board`
--

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED NOT NULL,
  `bulletin_group` int UNSIGNED NOT NULL,
  `bulletin_date` int UNSIGNED NOT NULL,
  `hash` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int UNSIGNED NOT NULL DEFAULT '0',
  `bulletin_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_member_data`
--

CREATE TABLE `exp_member_data` (
  `member_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_member_fields`
--

CREATE TABLE `exp_member_fields` (
  `m_field_id` int UNSIGNED NOT NULL,
  `m_field_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint DEFAULT '8',
  `m_field_maxl` smallint DEFAULT NULL,
  `m_field_width` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_order` int UNSIGNED DEFAULT NULL,
  `m_field_text_direction` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_member_news_views`
--

CREATE TABLE `exp_member_news_views` (
  `news_id` int UNSIGNED NOT NULL,
  `version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_member_news_views`
--

INSERT INTO `exp_member_news_views` (`news_id`, `version`, `member_id`) VALUES
(1, '7.1.6', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_member_search`
--

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `search_date` int UNSIGNED NOT NULL,
  `keywords` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int UNSIGNED NOT NULL,
  `query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_menu_items`
--

CREATE TABLE `exp_menu_items` (
  `item_id` int UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `set_id` int DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_menu_sets`
--

CREATE TABLE `exp_menu_sets` (
  `set_id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_menu_sets`
--

INSERT INTO `exp_menu_sets` (`set_id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_message_attachments`
--

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment_size` int UNSIGNED NOT NULL DEFAULT '0',
  `is_temp` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_message_copies`
--

CREATE TABLE `exp_message_copies` (
  `copy_id` int UNSIGNED NOT NULL,
  `message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `recipient_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message_received` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int UNSIGNED NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_message_data`
--

CREATE TABLE `exp_message_data` (
  `message_id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message_date` int UNSIGNED NOT NULL DEFAULT '0',
  `message_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int UNSIGNED NOT NULL DEFAULT '0',
  `message_status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_message_folders`
--

CREATE TABLE `exp_message_folders` (
  `member_id` int UNSIGNED NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_message_listed`
--

CREATE TABLE `exp_message_listed` (
  `listed_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL DEFAULT '0',
  `listed_member` int UNSIGNED NOT NULL DEFAULT '0',
  `listed_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_migrations`
--

CREATE TABLE `exp_migrations` (
  `migration_id` int UNSIGNED NOT NULL,
  `migration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `migration_location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `migration_group` int UNSIGNED DEFAULT NULL,
  `migration_run_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_modules`
--

CREATE TABLE `exp_modules` (
  `module_id` int UNSIGNED NOT NULL,
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Channel', '2.1.1', 'n', 'n'),
(2, 'Comment', '2.3.3', 'y', 'n'),
(3, 'Consent', '1.0.0', 'n', 'n'),
(4, 'Member', '2.3.0', 'n', 'n'),
(5, 'Stats', '2.2.0', 'n', 'n'),
(6, 'Rte', '2.1.0', 'y', 'n'),
(7, 'File', '1.1.0', 'n', 'n'),
(8, 'Filepicker', '1.0', 'y', 'n'),
(9, 'Relationship', '1.0.0', 'n', 'n'),
(10, 'Search', '2.3.0', 'n', 'n'),
(11, 'Pro', '2.0.0', 'n', 'n'),
(12, 'Structure', '6.0.0', 'y', 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_module_member_roles`
--

CREATE TABLE `exp_module_member_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `module_id` mediumint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_online_users`
--

CREATE TABLE `exp_online_users` (
  `online_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int NOT NULL DEFAULT '0',
  `in_forum` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int UNSIGNED NOT NULL DEFAULT '0',
  `anon` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_password_lockout`
--

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int UNSIGNED NOT NULL,
  `login_date` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(2, 1665328528, '172.31.0.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'admin'),
(3, 1665351263, '192.168.0.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'admin'),
(4, 1665351272, '192.168.0.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'admin@test.com'),
(5, 1665351277, '192.168.0.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'admin@test.com'),
(6, 1665351290, '192.168.0.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'admin@test.com');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_permissions`
--

CREATE TABLE `exp_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL,
  `permission` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_permissions`
--

INSERT INTO `exp_permissions` (`permission_id`, `role_id`, `site_id`, `permission`) VALUES
(1, 1, 1, 'can_view_offline_system'),
(2, 1, 1, 'can_access_cp'),
(3, 1, 1, 'can_access_dock'),
(4, 1, 1, 'can_access_footer_report_bug'),
(5, 1, 1, 'can_access_footer_new_ticket'),
(6, 1, 1, 'can_access_footer_user_guide'),
(7, 1, 1, 'can_view_homepage_news'),
(8, 1, 1, 'can_upload_new_files'),
(9, 1, 1, 'can_edit_files'),
(10, 1, 1, 'can_delete_files'),
(11, 1, 1, 'can_upload_new_toolsets'),
(12, 1, 1, 'can_edit_toolsets'),
(13, 1, 1, 'can_delete_toolsets'),
(14, 1, 1, 'can_create_upload_directories'),
(15, 1, 1, 'can_edit_upload_directories'),
(16, 1, 1, 'can_delete_upload_directories'),
(17, 1, 1, 'can_access_files'),
(18, 1, 1, 'can_access_design'),
(19, 1, 1, 'can_access_addons'),
(20, 1, 1, 'can_access_members'),
(21, 1, 1, 'can_access_sys_prefs'),
(22, 1, 1, 'can_access_comm'),
(23, 1, 1, 'can_access_utilities'),
(24, 1, 1, 'can_access_data'),
(25, 1, 1, 'can_access_logs'),
(26, 1, 1, 'can_admin_channels'),
(27, 1, 1, 'can_create_channels'),
(28, 1, 1, 'can_edit_channels'),
(29, 1, 1, 'can_delete_channels'),
(30, 1, 1, 'can_create_channel_fields'),
(31, 1, 1, 'can_edit_channel_fields'),
(32, 1, 1, 'can_delete_channel_fields'),
(33, 1, 1, 'can_create_statuses'),
(34, 1, 1, 'can_delete_statuses'),
(35, 1, 1, 'can_edit_statuses'),
(36, 1, 1, 'can_create_categories'),
(37, 1, 1, 'can_create_roles'),
(38, 1, 1, 'can_delete_roles'),
(39, 1, 1, 'can_edit_roles'),
(40, 1, 1, 'can_admin_design'),
(41, 1, 1, 'can_create_members'),
(42, 1, 1, 'can_edit_members'),
(43, 1, 1, 'can_delete_members'),
(44, 1, 1, 'can_admin_roles'),
(45, 1, 1, 'can_admin_mbr_templates'),
(46, 1, 1, 'can_ban_users'),
(47, 1, 1, 'can_admin_addons'),
(48, 1, 1, 'can_create_templates'),
(49, 1, 1, 'can_edit_templates'),
(50, 1, 1, 'can_delete_templates'),
(51, 1, 1, 'can_create_template_groups'),
(52, 1, 1, 'can_edit_template_groups'),
(53, 1, 1, 'can_delete_template_groups'),
(54, 1, 1, 'can_create_template_partials'),
(55, 1, 1, 'can_edit_template_partials'),
(56, 1, 1, 'can_delete_template_partials'),
(57, 1, 1, 'can_create_template_variables'),
(58, 1, 1, 'can_delete_template_variables'),
(59, 1, 1, 'can_edit_template_variables'),
(60, 1, 1, 'can_edit_categories'),
(61, 1, 1, 'can_delete_categories'),
(62, 1, 1, 'can_view_other_entries'),
(63, 1, 1, 'can_edit_other_entries'),
(64, 1, 1, 'can_assign_post_authors'),
(65, 1, 1, 'can_delete_self_entries'),
(66, 1, 1, 'can_delete_all_entries'),
(67, 1, 1, 'can_view_other_comments'),
(68, 1, 1, 'can_edit_own_comments'),
(69, 1, 1, 'can_delete_own_comments'),
(70, 1, 1, 'can_edit_all_comments'),
(71, 1, 1, 'can_delete_all_comments'),
(72, 1, 1, 'can_moderate_comments'),
(73, 1, 1, 'can_send_cached_email'),
(74, 1, 1, 'can_email_roles'),
(75, 1, 1, 'can_email_from_profile'),
(76, 1, 1, 'can_view_profiles'),
(77, 1, 1, 'can_edit_html_buttons'),
(78, 1, 1, 'can_post_comments'),
(79, 1, 1, 'can_delete_self'),
(80, 1, 1, 'can_send_private_messages'),
(81, 1, 1, 'can_attach_in_private_messages'),
(82, 1, 1, 'can_send_bulletins'),
(83, 1, 1, 'can_search'),
(84, 1, 1, 'can_create_entries'),
(85, 1, 1, 'can_edit_self_entries'),
(86, 1, 1, 'can_access_security_settings'),
(87, 1, 1, 'can_access_translate'),
(88, 1, 1, 'can_access_import'),
(89, 1, 1, 'can_access_sql_manager'),
(90, 1, 1, 'can_moderate_spam'),
(91, 1, 1, 'can_manage_consents'),
(92, 3, 1, 'can_view_online_system'),
(93, 4, 1, 'can_view_online_system'),
(94, 5, 1, 'can_view_online_system'),
(95, 5, 1, 'can_email_from_profile'),
(96, 5, 1, 'can_view_profiles'),
(97, 5, 1, 'can_edit_html_buttons'),
(98, 5, 1, 'can_delete_self'),
(99, 5, 1, 'can_send_private_messages'),
(100, 5, 1, 'can_attach_in_private_messages'),
(107, 5, 1, 'can_create_entries_channel_id_2'),
(108, 5, 1, 'can_edit_self_entries_channel_id_2'),
(109, 5, 1, 'can_delete_self_entries_channel_id_2'),
(110, 5, 1, 'can_edit_other_entries_channel_id_2'),
(111, 5, 1, 'can_delete_all_entries_channel_id_2'),
(112, 5, 1, 'can_assign_post_authors_channel_id_2');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_plugins`
--

CREATE TABLE `exp_plugins` (
  `plugin_id` int UNSIGNED NOT NULL,
  `plugin_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_plugins`
--

INSERT INTO `exp_plugins` (`plugin_id`, `plugin_name`, `plugin_package`, `plugin_version`, `is_typography_related`) VALUES
(3, 'Download Content', 'download_content', '3.1.0', 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_prolets`
--

CREATE TABLE `exp_prolets` (
  `prolet_id` int UNSIGNED NOT NULL,
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_prolets`
--

INSERT INTO `exp_prolets` (`prolet_id`, `source`, `class`) VALUES
(1, 'pro', 'Entries_pro'),
(2, 'structure', 'Structure_pro');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_relationships`
--

CREATE TABLE `exp_relationships` (
  `relationship_id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `child_id` int UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int UNSIGNED NOT NULL DEFAULT '0',
  `fluid_field_data_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_field_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_col_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_row_id` int UNSIGNED NOT NULL DEFAULT '0',
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_remember_me`
--

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int DEFAULT '1',
  `expiration` int DEFAULT '0',
  `last_refresh` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_remember_me`
--

INSERT INTO `exp_remember_me` (`remember_me_id`, `member_id`, `ip_address`, `user_agent`, `admin_sess`, `site_id`, `expiration`, `last_refresh`) VALUES
('2209f6bd444d118ee71f9df4cced3e1e3378aab3', 1, '172.31.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, 1, 1666280529, 1665070929);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_reset_password`
--

CREATE TABLE `exp_reset_password` (
  `reset_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `resetcode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_revision_tracker`
--

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int UNSIGNED NOT NULL,
  `item_id` int UNSIGNED NOT NULL,
  `item_table` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` int NOT NULL,
  `item_author_id` int UNSIGNED NOT NULL,
  `item_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_roles`
--

CREATE TABLE `exp_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_members` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `is_locked` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_roles`
--

INSERT INTO `exp_roles` (`role_id`, `name`, `short_name`, `description`, `total_members`, `is_locked`) VALUES
(1, 'Super Admin', 'super_admin', NULL, 0, 'y'),
(2, 'Banned', 'banned', NULL, 0, 'n'),
(3, 'Guests', 'guests', NULL, 0, 'n'),
(4, 'Pending', 'pending', NULL, 0, 'n'),
(5, 'Members', 'members', NULL, 0, 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_roles_role_groups`
--

CREATE TABLE `exp_roles_role_groups` (
  `role_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_role_groups`
--

CREATE TABLE `exp_role_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_role_settings`
--

CREATE TABLE `exp_role_settings` (
  `id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `menu_set_id` int UNSIGNED NOT NULL DEFAULT '1',
  `mbr_delete_notify_emails` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exclude_from_moderation` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint UNSIGNED NOT NULL,
  `prv_msg_send_limit` smallint UNSIGNED NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint UNSIGNED NOT NULL DEFAULT '60',
  `include_in_authorlist` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int UNSIGNED NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `require_mfa` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_role_settings`
--

INSERT INTO `exp_role_settings` (`id`, `role_id`, `site_id`, `menu_set_id`, `mbr_delete_notify_emails`, `exclude_from_moderation`, `search_flood_control`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `require_mfa`) VALUES
(1, 1, 1, 1, NULL, 'y', 0, 20, 60, 'y', 'y', NULL, 0, NULL, 'n'),
(2, 2, 1, 1, NULL, 'n', 60, 20, 60, 'n', 'n', NULL, 0, NULL, 'n'),
(3, 3, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n'),
(4, 4, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n'),
(5, 5, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_rte_toolsets`
--

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int UNSIGNED NOT NULL,
  `toolset_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toolset_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `toolset_name`, `toolset_type`, `settings`) VALUES
(1, 'CKEditor Basic', 'ckeditor', 'YTo1OntzOjQ6InR5cGUiO3M6ODoiY2tlZGl0b3IiO3M6NzoidG9vbGJhciI7YTo2OntpOjA7czo0OiJib2xkIjtpOjE7czo2OiJpdGFsaWMiO2k6MjtzOjk6InVuZGVybGluZSI7aTozO3M6MTI6Im51bWJlcmVkTGlzdCI7aTo0O3M6MTI6ImJ1bGxldGVkTGlzdCI7aTo1O3M6NDoibGluayI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO3M6MTA6Im1lZGlhRW1iZWQiO2E6MTp7czoxNDoicHJldmlld3NJbkRhdGEiO2I6MTt9fQ=='),
(2, 'CKEditor Full', 'ckeditor', 'YTo1OntzOjQ6InR5cGUiO3M6ODoiY2tlZGl0b3IiO3M6NzoidG9vbGJhciI7YTozMDp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czoxMzoic3RyaWtldGhyb3VnaCI7aTozO3M6OToidW5kZXJsaW5lIjtpOjQ7czo5OiJzdWJzY3JpcHQiO2k6NTtzOjExOiJzdXBlcnNjcmlwdCI7aTo2O3M6MTA6ImJsb2NrcXVvdGUiO2k6NztzOjQ6ImNvZGUiO2k6ODtzOjc6ImhlYWRpbmciO2k6OTtzOjEyOiJyZW1vdmVGb3JtYXQiO2k6MTA7czo0OiJ1bmRvIjtpOjExO3M6NDoicmVkbyI7aToxMjtzOjEyOiJudW1iZXJlZExpc3QiO2k6MTM7czoxMjoiYnVsbGV0ZWRMaXN0IjtpOjE0O3M6Nzoib3V0ZGVudCI7aToxNTtzOjY6ImluZGVudCI7aToxNjtzOjQ6ImxpbmsiO2k6MTc7czoxMToiZmlsZW1hbmFnZXIiO2k6MTg7czoxMToiaW5zZXJ0VGFibGUiO2k6MTk7czoxMDoibWVkaWFFbWJlZCI7aToyMDtzOjk6Imh0bWxFbWJlZCI7aToyMTtzOjE0OiJhbGlnbm1lbnQ6bGVmdCI7aToyMjtzOjE1OiJhbGlnbm1lbnQ6cmlnaHQiO2k6MjM7czoxNjoiYWxpZ25tZW50OmNlbnRlciI7aToyNDtzOjE3OiJhbGlnbm1lbnQ6anVzdGlmeSI7aToyNTtzOjE0OiJob3Jpem9udGFsTGluZSI7aToyNjtzOjE3OiJzcGVjaWFsQ2hhcmFjdGVycyI7aToyNztzOjg6InJlYWRNb3JlIjtpOjI4O3M6OToiZm9udENvbG9yIjtpOjI5O3M6MTk6ImZvbnRCYWNrZ3JvdW5kQ29sb3IiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTA6InVwbG9hZF9kaXIiO3M6MzoiYWxsIjtzOjEwOiJtZWRpYUVtYmVkIjthOjE6e3M6MTQ6InByZXZpZXdzSW5EYXRhIjtiOjE7fX0='),
(3, 'Redactor Basic', 'redactor', 'YTo0OntzOjQ6InR5cGUiO3M6ODoicmVkYWN0b3IiO3M6NzoidG9vbGJhciI7YToyOntzOjc6ImJ1dHRvbnMiO2E6Njp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czo5OiJ1bmRlcmxpbmUiO2k6MztzOjI6Im9sIjtpOjQ7czoyOiJ1bCI7aTo1O3M6NDoibGluayI7fXM6NzoicGx1Z2lucyI7YTowOnt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30='),
(4, 'Redactor Full', 'redactor', 'YTo0OntzOjQ6InR5cGUiO3M6ODoicmVkYWN0b3IiO3M6NzoidG9vbGJhciI7YToyOntzOjc6ImJ1dHRvbnMiO2E6MTY6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjY6ImZvcm1hdCI7aToyO3M6NDoiYm9sZCI7aTozO3M6NjoiaXRhbGljIjtpOjQ7czo3OiJkZWxldGVkIjtpOjU7czo5OiJ1bmRlcmxpbmUiO2k6NjtzOjQ6InJlZG8iO2k6NztzOjQ6InVuZG8iO2k6ODtzOjI6Im9sIjtpOjk7czoyOiJ1bCI7aToxMDtzOjY6ImluZGVudCI7aToxMTtzOjc6Im91dGRlbnQiO2k6MTI7czozOiJzdXAiO2k6MTM7czozOiJzdWIiO2k6MTQ7czo0OiJsaW5rIjtpOjE1O3M6NDoibGluZSI7fXM6NzoicGx1Z2lucyI7YToxNTp7aTowO3M6OToiYWxpZ25tZW50IjtpOjE7czoxNjoicnRlX2RlZmluZWRsaW5rcyI7aToyO3M6MTE6ImZpbGVicm93c2VyIjtpOjM7czo1OiJwYWdlcyI7aTo0O3M6MTE6ImlubGluZXN0eWxlIjtpOjU7czo5OiJmb250Y29sb3IiO2k6NjtzOjc6ImxpbWl0ZXIiO2k6NztzOjc6ImNvdW50ZXIiO2k6ODtzOjEwOiJwcm9wZXJ0aWVzIjtpOjk7czoxMjoic3BlY2lhbGNoYXJzIjtpOjEwO3M6NToidGFibGUiO2k6MTE7czo1OiJ2aWRlbyI7aToxMjtzOjY6IndpZGdldCI7aToxMztzOjg6InJlYWRtb3JlIjtpOjE0O3M6MTA6ImZ1bGxzY3JlZW4iO319czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJ1cGxvYWRfZGlyIjtzOjM6ImFsbCI7fQ==');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_search`
--

CREATE TABLE `exp_search` (
  `search_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL DEFAULT '1',
  `search_date` int NOT NULL,
  `keywords` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int NOT NULL,
  `per_page` tinyint UNSIGNED NOT NULL,
  `query` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_result_page` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_search_log`
--

CREATE TABLE `exp_search_log` (
  `id` int NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int UNSIGNED NOT NULL,
  `screen_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int NOT NULL,
  `search_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_security_hashes`
--

CREATE TABLE `exp_security_hashes` (
  `hash_id` int UNSIGNED NOT NULL,
  `date` int UNSIGNED NOT NULL,
  `session_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(19, 1665381418, 'f93842dc5723ca706368b6352c5169edf5dbce9a', '5014fa4d290377dd1c80386a60e1cd205583d446');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_sessions`
--

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int UNSIGNED NOT NULL DEFAULT '0',
  `auth_timeout` int UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int UNSIGNED NOT NULL DEFAULT '0',
  `can_debug` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mfa_flag` enum('skip','show','required') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'skip',
  `pro_banner_seen` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`, `mfa_flag`, `pro_banner_seen`) VALUES
('f93842dc5723ca706368b6352c5169edf5dbce9a', 1, 1, '192.168.0.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', NULL, 'eb26d6baa7e45a264e16771a3eaf8483', 1665381418, 0, 1665381650, '0', 'skip', 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_sites`
--

CREATE TABLE `exp_sites` (
  `site_id` int UNSIGNED NOT NULL,
  `site_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `site_color` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_bootstrap_checksums` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_color`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'Kooba test', 'default_site', NULL, '', 'YToxOntzOjMwOiIvdmFyL3d3dy9odG1sL3B1YmxpYy9pbmRleC5waHAiO3M6MzI6IjAzZGZkZTZmZWU1NGQyMzAyZGVkMTU5NDBhMjRlZmQ3Ijt9', 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_snippets`
--

CREATE TABLE `exp_snippets` (
  `snippet_id` int UNSIGNED NOT NULL,
  `site_id` int NOT NULL,
  `snippet_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_specialty_templates`
--

CREATE TABLE `exp_specialty_templates` (
  `template_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `enable_template` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0',
  `last_author_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`) VALUES
(1, 1, 'y', 'offline_template', '', 'system', NULL, '<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>System Offline</title>\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>System Offline</h3>\n                    </div>\n					<div class=\"panel-body\">\n					This site is currently offline\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>', NULL, 1665070903, 0),
(2, 1, 'y', 'message_template', '', 'system', NULL, '<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>{title}</title>\n        <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n        <meta name=\"referrer\" content=\"no-referrer\">\n        {meta_refresh}\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>{heading}</h3>\n                    </div>\n                    <div class=\"panel-body\">\n                        {content}\n\n\n                    </div>\n                    <div class=\"panel-footer\">\n                        {link}\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>', NULL, 1665070903, 0),
(3, 1, 'y', 'post_install_message_template', '', 'system', NULL, '<!doctype html>\n<html>\n	<head>\n		<title>Welcome to ExpressionEngine!</title>\n		<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" lang=\"en-us\" dir=\"ltr\">\n		<meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n		<link href=\"{theme_folder_url}cp/css/common.min.css\" rel=\"stylesheet\">\n			</head>\n	<body class=\"installer-page\">\n		<section class=\"flex-wrap\">\n			<section class=\"wrap\">\n				<div class=\"login__logo\">\n  <svg width=\"281px\" height=\"36px\" viewBox=\"0 0 281 36\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n  <title>ExpressionEngine</title>\n  <defs>\n      <polygon id=\"path-1\" points=\"0.3862 0.1747 18.6557 0.1747 18.6557 21.5 0.3862 21.5\"></polygon>\n      <polygon id=\"path-3\" points=\"0.3926 0.17455 13.9915 0.17455 13.9915 15.43755 0.3926 15.43755\"></polygon>\n      <polygon id=\"path-5\" points=\"0 0.06905 25.8202 0.06905 25.8202 31.6178513 0 31.6178513\"></polygon>\n      <polygon id=\"path-7\" points=\"0.10635 0.204 25.9268587 0.204 25.9268587 31.7517 0.10635 31.7517\"></polygon>\n  </defs>\n  <g id=\"logo\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\n      <g id=\"expressionengine\">\n          <path d=\"M92.88015,27.0665 L89.28865,20.955 L94.66665,14.6405 L94.77265,13.9 L91.11315,13.9 L87.86765,17.95 C87.76015,18.0845 87.57265,18.353 87.30415,19.2645 C87.33065,18.353 87.14315,18.0845 87.08965,17.9775 L84.80915,13.9 L80.59815,13.9 L84.62115,20.8475 L78.21065,28.3045 L82.42165,28.3045 L86.04315,23.905 C86.23065,23.664 86.52565,23.154 86.66065,22.5915 C86.66065,23.154 86.79465,23.6905 86.92865,23.905 L89.42265,28.3045 L92.70265,28.3045 L92.88015,27.0665 Z\" id=\"Fill-1\"></path>\n          <path d=\"M80.2395,11.9686 L70.9585,11.9686 L70.288,16.6091 L78.7645,16.6091 L77.4495,19.6141 L69.751,19.6141 C69.805,19.8011 69.805,20.0156 69.778,20.1231 L69.027,25.3011 L78.3345,25.3011 L77.9055,28.3046 L65.003,28.3046 L67.7925,8.9651 L80.6685,8.9651 L80.2395,11.9686 Z\" id=\"Fill-3\"></path>\n          <path d=\"M102.3328,16.20735 C101.5283,16.20735 100.5628,16.34085 99.3558,17.11935 L98.1493,25.46185 C98.8998,25.83735 99.9723,25.99835 100.8848,25.99835 C103.0573,25.99835 104.2378,24.60235 104.7478,20.98085 C104.8548,20.28385 104.9083,19.69385 104.9083,19.18485 C104.9083,17.03835 104.0508,16.20735 102.3328,16.20735 M108.3418,20.98085 C107.6718,25.70235 105.5783,28.73385 100.5093,28.73385 C99.5708,28.73385 98.4978,28.54635 97.5313,28.08985 C97.6128,28.38435 97.6933,28.73385 97.6393,29.02935 L96.8073,34.79585 L93.2133,34.79585 L96.2178,13.89985 L98.7928,13.89985 L99.0878,15.08085 C100.3213,14.00685 101.7703,13.47035 103.1113,13.47035 C106.9473,13.47035 108.5023,15.69685 108.5023,19.05035 C108.5023,19.66735 108.4483,20.31135 108.3418,20.98085\" id=\"Fill-5\"></path>\n          <path d=\"M119.33865,16.69 C118.74815,16.609 118.13215,16.555 117.48715,16.555 C116.46815,16.555 115.39515,16.716 114.45615,17.28 L112.87415,28.3045 L109.27965,28.3045 L111.34515,13.8995 L114.29515,13.8995 L114.51115,15.0535 C115.71715,13.8995 116.92465,13.4705 118.21215,13.4705 C118.72265,13.4705 119.25865,13.5515 119.79515,13.659 L119.33865,16.69 Z\" id=\"Fill-7\"></path>\n          <path d=\"M127.43385,16.31455 C125.39585,16.31455 124.40285,17.09155 123.81285,19.61405 L129.71435,19.61405 C129.76785,19.29205 129.79435,18.99655 129.79435,18.72855 C129.79435,17.14555 129.01685,16.31455 127.43385,16.31455 M133.03985,22.13505 L123.35635,22.13505 C123.30235,22.56405 123.27685,22.93955 123.27685,23.28855 C123.27685,25.05905 124.08085,25.89105 126.06585,25.89105 C127.91685,25.89105 128.96335,25.08605 129.74035,23.90505 L132.44985,25.00505 C131.18885,27.41855 128.82885,28.73355 125.66385,28.73355 C121.58635,28.73355 119.73535,26.56055 119.73535,22.93955 C119.73535,22.34955 119.78885,21.73305 119.86985,21.08855 C120.64685,15.80405 122.95485,13.47055 127.86285,13.47055 C132.31635,13.47055 133.33585,16.60905 133.33585,19.29205 C133.33585,20.09655 133.17435,21.16955 133.03985,22.13505\" id=\"Fill-9\"></path>\n          <path d=\"M144.11795,17.70905 C143.60895,16.79705 142.66995,16.28705 141.19395,16.28705 C140.04145,16.28705 138.64595,16.52905 138.64595,17.97755 C138.64595,18.48755 138.88745,18.91655 139.53145,19.02405 L142.64245,19.58655 C144.60095,19.93605 146.20995,21.03455 146.20995,23.12755 C146.20995,27.23155 142.80295,28.73355 139.23545,28.73355 C136.71445,28.73355 134.73045,27.87555 133.76445,25.62255 L136.76845,24.52255 C137.33245,25.54155 138.24395,25.99805 139.61245,25.99805 C140.95345,25.99805 142.61595,25.59505 142.61595,23.93255 C142.61595,23.34255 142.34795,22.91355 141.56945,22.77855 L138.21645,22.16255 C136.66095,21.86655 135.13145,20.68655 135.13145,18.46005 C135.13145,14.65055 138.27045,13.47055 141.59695,13.47055 C144.57445,13.47055 146.20995,14.67805 146.93445,16.39455 L144.11795,17.70905 Z\" id=\"Fill-11\"></path>\n          <path d=\"M157.28835,17.70905 C156.77935,16.79705 155.84135,16.28705 154.36435,16.28705 C153.21235,16.28705 151.81785,16.52905 151.81785,17.97755 C151.81785,18.48755 152.05935,18.91655 152.70335,19.02405 L155.81435,19.58655 C157.77285,19.93605 159.38185,21.03455 159.38185,23.12755 C159.38185,27.23155 155.97385,28.73355 152.40635,28.73355 C149.88635,28.73355 147.90085,27.87555 146.93585,25.62255 L149.93885,24.52255 C150.50285,25.54155 151.41585,25.99805 152.78285,25.99805 C154.12535,25.99805 155.78685,25.59505 155.78685,23.93255 C155.78685,23.34255 155.51985,22.91355 154.74135,22.77855 L151.38835,22.16255 C149.83185,21.86655 148.30235,20.68655 148.30235,18.46005 C148.30235,14.65055 151.44085,13.47055 154.76885,13.47055 C157.74485,13.47055 159.38185,14.67805 160.10535,16.39455 L157.28835,17.70905 Z\" id=\"Fill-13\"></path>\n          <path d=\"M168.0188,11.0294 C167.9908,11.2714 167.9908,11.2714 167.7768,11.2714 L164.2888,11.2714 C164.0743,11.2714 164.0743,11.2714 164.1018,11.0294 L164.5858,7.7039 C164.6108,7.4359 164.6108,7.4084 164.8253,7.4084 L168.3133,7.4084 C168.5278,7.4084 168.5278,7.4359 168.5003,7.7039 L168.0188,11.0294 Z M167.2953,28.5464 L165.4688,28.5464 C163.3783,28.5464 162.3583,27.6334 162.3583,25.7564 C162.3583,25.4619 162.3853,25.1659 162.4378,24.8169 L163.5128,17.3874 C163.5378,17.1729 163.6728,16.8509 163.8873,16.6089 L161.2853,16.6089 L161.6618,13.8999 L167.5898,13.8999 L166.0328,24.8169 C166.0083,24.9514 166.0083,25.0864 166.0083,25.1934 C166.0083,25.5154 166.1398,25.6229 166.5443,25.6229 L167.6968,25.6229 L167.2953,28.5464 Z\" id=\"Fill-15\"></path>\n          <path d=\"M176.8977,16.31455 C174.6972,16.31455 173.6242,17.44105 173.0882,21.08855 C172.9807,21.81305 172.9262,22.45705 172.9262,22.99305 C172.9262,25.16605 173.7837,25.89105 175.5282,25.89105 C177.7007,25.89105 178.8562,24.76305 179.3922,21.08855 C179.4997,20.39105 179.5522,19.77455 179.5522,19.23855 C179.5522,17.03805 178.6662,16.31455 176.8977,16.31455 M182.9852,21.08855 C182.2617,26.07805 180.0887,28.73355 175.1262,28.73355 C170.8872,28.73355 169.3582,26.13155 169.3582,22.85955 C169.3582,22.29555 169.4132,21.67955 169.4927,21.08855 C170.2167,16.01905 172.3647,13.47055 177.3267,13.47055 C181.5377,13.47055 183.1197,15.93905 183.1197,19.26455 C183.1197,19.85455 183.0672,20.44455 182.9852,21.08855\" id=\"Fill-17\"></path>\n          <path d=\"M197.21265,19.23835 L195.89815,28.30435 L192.33015,28.30435 L193.64515,19.23835 C193.70015,18.91635 193.72465,18.59485 193.72465,18.29935 C193.72465,17.06535 193.24365,16.26085 191.90115,16.26085 C190.80115,16.26085 189.51415,16.87685 188.46865,17.52085 L186.91165,28.30435 L183.34415,28.30435 L185.41015,13.89985 L188.36115,13.89985 L188.60315,15.21435 C190.26465,13.89985 191.60665,13.47035 193.10865,13.47035 C196.11265,13.47035 197.32015,15.37535 197.32015,17.92385 C197.32015,18.35285 197.26715,18.78185 197.21265,19.23835\" id=\"Fill-19\"></path>\n          <path d=\"M214.45925,11.9686 L205.17825,11.9686 L204.51025,16.6091 L212.98475,16.6091 L211.67025,19.6141 L203.97075,19.6141 C204.02625,19.8011 204.02625,20.0156 203.99875,20.1231 L203.24775,25.3011 L212.55525,25.3011 L212.12675,28.3046 L199.22325,28.3046 L202.01525,8.9651 L214.89075,8.9651 L214.45925,11.9686 Z\" id=\"Fill-21\"></path>\n          <path d=\"M227.8411,19.23835 L226.5266,28.30435 L222.9586,28.30435 L224.2736,19.23835 C224.3261,18.91635 224.3531,18.59485 224.3531,18.29935 C224.3531,17.06535 223.8696,16.26085 222.5301,16.26085 C221.4296,16.26085 220.1426,16.87685 219.0946,17.52085 L217.5401,28.30435 L213.9726,28.30435 L216.0386,13.89985 L218.9871,13.89985 L219.2291,15.21435 C220.8931,13.89985 222.2331,13.47035 223.7371,13.47035 C226.7411,13.47035 227.9486,15.37535 227.9486,17.92385 C227.9486,18.35285 227.8936,18.78185 227.8411,19.23835\" id=\"Fill-23\"></path>\n          <g id=\"Group-27\" transform=\"translate(227.500000, 13.296000)\">\n              <mask id=\"mask-2\" fill=\"white\">\n                  <use xlink:href=\"#path-1\"></use>\n              </mask>\n              <g id=\"Clip-26\"></g>\n              <path d=\"M9.7742,2.9912 C7.7607,2.9912 6.6082,4.1452 6.6082,6.1297 C6.6082,7.4702 7.4667,8.0342 9.0232,8.0342 C11.0342,8.0342 12.1612,6.9617 12.1612,4.9772 C12.1612,3.6622 11.3832,2.9912 9.7742,2.9912 L9.7742,2.9912 Z M10.1207,15.0622 L5.0787,14.1227 C4.2757,14.9812 3.9262,15.5447 3.9262,16.7522 C3.9262,18.1197 4.8917,18.7372 7.4667,18.7372 C9.1557,18.7372 11.4907,18.4687 11.4907,16.2957 C11.4907,15.6262 11.1412,15.2507 10.1207,15.0622 L10.1207,15.0622 Z M18.3312,3.3132 L16.5872,3.3132 C16.3457,3.3132 15.7542,3.2867 15.3002,3.0722 C15.5672,3.7157 15.6742,4.4392 15.6742,5.0307 C15.6742,9.2142 12.3482,10.8237 8.6187,10.8237 C7.7882,10.8237 6.9852,10.7437 6.2862,10.5827 C6.1792,10.5552 6.0717,10.5292 5.9372,10.5292 C5.5352,10.5292 5.2932,10.7437 5.2932,11.1452 C5.2932,11.4137 5.4282,11.6017 6.0167,11.7092 L11.1962,12.6747 C14.0652,13.2112 15.0577,14.4447 15.0577,16.0277 C15.0577,20.6682 10.7122,21.5002 7.0647,21.5002 C4.1682,21.5002 0.3862,20.7217 0.3862,17.1002 C0.3862,15.2232 1.3767,13.6142 2.9857,12.6482 C2.6637,12.2457 2.5042,11.7902 2.5042,11.3597 C2.5042,10.3947 3.2007,9.6437 4.0062,9.2142 C3.4972,8.5707 3.0682,7.5517 3.0682,6.3717 C3.0682,2.1602 6.3387,0.1747 10.1757,0.1747 C11.5177,0.1747 12.9372,0.4167 13.9852,1.0862 L16.0537,0.6212 L18.6557,0.6212 L18.3312,3.3132 Z\" id=\"Fill-25\" mask=\"url(#mask-2)\"></path>\n          </g>\n          <path d=\"M251.54175,11.0294 C251.51675,11.2714 251.51675,11.2714 251.30225,11.2714 L247.81475,11.2714 C247.59975,11.2714 247.59975,11.2714 247.62725,11.0294 L248.10925,7.7039 C248.13625,7.4359 248.13625,7.4084 248.35075,7.4084 L251.83875,7.4084 C252.05275,7.4084 252.05275,7.4359 252.02575,7.7039 L251.54175,11.0294 Z M250.81825,28.5464 L248.99425,28.5464 C246.90175,28.5464 245.88375,27.6334 245.88375,25.7564 C245.88375,25.4619 245.91075,25.1659 245.96375,24.8169 L247.03575,17.3874 C247.06375,17.1729 247.19825,16.8509 247.41275,16.6089 L244.81075,16.6089 L245.18475,13.8999 L251.11275,13.8999 L249.55825,24.8169 C249.53125,24.9514 249.53125,25.0864 249.53125,25.1934 C249.53125,25.5154 249.66575,25.6229 250.06725,25.6229 L251.21975,25.6229 L250.81825,28.5464 Z\" id=\"Fill-28\"></path>\n          <path d=\"M266.32595,19.23835 L265.01095,28.30435 L261.44345,28.30435 L262.75845,19.23835 C262.81345,18.91635 262.83795,18.59485 262.83795,18.29935 C262.83795,17.06535 262.35695,16.26085 261.01445,16.26085 C259.91445,16.26085 258.62695,16.87685 257.58195,17.52085 L256.02445,28.30435 L252.45745,28.30435 L254.52345,13.89985 L257.47445,13.89985 L257.71645,15.21435 C259.37795,13.89985 260.71995,13.47035 262.22195,13.47035 C265.22595,13.47035 266.43345,15.37535 266.43345,17.92385 C266.43345,18.35285 266.38045,18.78185 266.32595,19.23835\" id=\"Fill-30\"></path>\n          <g id=\"Group-34\" transform=\"translate(267.000000, 13.296000)\">\n              <mask id=\"mask-4\" fill=\"white\">\n                  <use xlink:href=\"#path-3\"></use>\n              </mask>\n              <g id=\"Clip-33\"></g>\n              <path d=\"M8.0916,3.01855 C6.0531,3.01855 5.0606,3.79555 4.4691,6.31805 L10.3716,6.31805 C10.4241,5.99605 10.4516,5.70055 10.4516,5.43255 C10.4516,3.84955 9.6731,3.01855 8.0916,3.01855 M13.6971,8.83905 L4.0126,8.83905 C3.9596,9.26805 3.9326,9.64355 3.9326,9.99255 C3.9326,11.76305 4.7381,12.59505 6.7216,12.59505 C8.5731,12.59505 9.6211,11.79005 10.3961,10.60905 L13.1056,11.70905 C11.8461,14.12255 9.4861,15.43755 6.3201,15.43755 C2.2436,15.43755 0.3926,13.26455 0.3926,9.64355 C0.3926,9.05355 0.4446,8.43705 0.5271,7.79255 C1.3031,2.50805 3.6106,0.17455 8.5201,0.17455 C12.9736,0.17455 13.9916,3.31305 13.9916,5.99605 C13.9916,6.80055 13.8316,7.87355 13.6971,8.83905\" id=\"Fill-32\" mask=\"url(#mask-4)\"></path>\n          </g>\n          <path d=\"M20.60205,17.64605 C21.11355,14.75605 22.01655,12.45255 23.28405,10.79305 C24.18105,9.60555 25.17405,9.00405 26.23755,9.00405 C26.80055,9.00405 27.27705,9.22055 27.65305,9.64955 C28.01805,10.06905 28.20405,10.64605 28.20405,11.36305 C28.20405,13.02405 27.45705,14.53555 25.98455,15.86155 C24.91705,16.81355 23.20305,17.51055 20.89205,17.93305 L20.53855,17.99805 L20.60205,17.64605 Z M30.67305,21.68355 C29.37505,22.92855 28.23905,23.80705 27.31805,24.24655 C26.34905,24.70655 25.34805,24.93855 24.34355,24.93855 C23.11755,24.93855 22.12155,24.54805 21.38655,23.77655 C20.65105,23.00705 20.27805,21.90355 20.27805,20.49455 L20.37305,19.08355 L20.56855,19.05005 C24.00755,18.47005 26.60155,17.80655 28.27555,17.07555 C29.93155,16.35405 31.14005,15.49505 31.86855,14.52405 C32.59155,13.56105 32.95655,12.59155 32.95655,11.65055 C32.95655,10.50805 32.52355,9.59355 31.63105,8.84705 C30.73555,8.10155 29.44355,7.72455 27.79455,7.72455 C25.50305,7.72455 23.33455,8.25905 21.34955,9.31405 C19.36805,10.36805 17.78305,11.82905 16.64005,13.65605 C15.50005,15.48105 14.92155,17.41555 14.92155,19.40105 C14.92155,21.61755 15.60505,23.39505 16.95205,24.68005 C18.30455,25.96905 20.19355,26.62005 22.56705,26.62005 C24.25255,26.62005 25.84755,26.28155 27.30805,25.61355 C28.70455,24.97455 30.14905,23.86705 31.60805,22.37255 C31.33005,22.16805 30.87005,21.82855 30.67305,21.68355 L30.67305,21.68355 Z\" id=\"Fill-35\"></path>\n          <g id=\"Group-39\" transform=\"translate(0.000000, 2.796000)\">\n              <mask id=\"mask-6\" fill=\"white\">\n                  <use xlink:href=\"#path-5\"></use>\n              </mask>\n              <g id=\"Clip-38\"></g>\n              <path d=\"M7.2737,19.35005 C5.3202,11.70605 9.9462,3.71505 17.8897,0.06905 C17.6907,0.14055 17.5042,0.22255 17.3077,0.29605 C17.5087,0.20005 17.6882,0.11955 17.8272,0.07205 L2.9432,3.91255 L6.9112,6.26005 C1.7147,10.66105 -0.9663,16.11555 0.3187,21.14505 C2.3302,29.02005 13.3457,33.12605 25.8202,31.10805 C17.1117,31.75655 9.2257,26.99355 7.2737,19.35005\" id=\"Fill-37\" mask=\"url(#mask-6)\"></path>\n          </g>\n          <g id=\"Group-42\" transform=\"translate(23.500000, 0.296000)\">\n              <mask id=\"mask-8\" fill=\"white\">\n                  <use xlink:href=\"#path-7\"></use>\n              </mask>\n              <g id=\"Clip-41\"></g>\n              <path d=\"M18.65285,12.4697 C20.60635,20.1147 15.98135,28.1052 8.03735,31.7517 C8.23585,31.6797 8.42235,31.5977 8.61885,31.5232 C8.41785,31.6212 8.23835,31.7002 8.09935,31.7482 L22.98335,27.9087 L19.01585,25.5612 C24.21185,21.1597 26.89285,15.7042 25.60835,10.6747 C23.59635,2.8027 12.58085,-1.3053 0.10635,0.7142 C8.81435,0.0637 16.70135,4.8267 18.65285,12.4697\" id=\"Fill-40\" mask=\"url(#mask-8)\"></path>\n          </g>\n      </g>\n    </g>\n  </svg>\n</div>\n				<div class=\"panel warn\">\n  <div class=\"panel-heading\" style=\"text-align: center;\">\n    <h3>ExpressionEngine has been installed!</h3>\n  </div>\n  <div class=\"panel-body\">\n    <div class=\"updater-msg\">\n  		<p style=\"margin-bottom: 20px;\">If you see this message, then everything went well.</p>\n\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fal fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If you are site owner, please login into your Control Panel and create your first template.</p>\n    		</div>\n  		</div>\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fal fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If this is your first time using ExpressionEngine CMS, make sure to <a href=\"https://docs.expressionengine.com/latest/getting-started/the-big-picture.html\">check out the documentation</a> to get started.</p>\n    		</div>\n  		</div>\n  	</div>\n  </div>\n  <div class=\"panel-footer\">\n\n  </div>\n</div>\n			</div>\n			<section class=\"bar\">\n				<p style=\"float: left;\"><a href=\"https://expressionengine.com/\" rel=\"external\"><b>ExpressionEngine</b></a></p>\n				<p style=\"float: right;\">&copy;2022 <a href=\"https://packettide.com/\" rel=\"external\">Packet Tide</a>, LLC</p>\n			</section>\n		</section>\n\n	</body>\n</html>', NULL, 1665070903, 0),
(4, 1, 'y', 'mfa_template', '', 'system', NULL, '<!doctype html>\n        <html dir=\"ltr\">\n            <head>\n                <title>{title}</title>\n                <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n                <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n                <meta name=\"referrer\" content=\"no-referrer\">\n                {meta_refresh}\n                <style type=\"text/css\">\n        :root, body {\n            --ee-panel-bg: #fff;\n            --ee-panel-border: #dfe0ef;\n            --ee-text-normal: #0d0d19;\n            --ee-text-secondary: #8f90b0;\n            --ee-main-bg: #f7f7fb;\n            --ee-link: #5D63F1;\n            --ee-link-hover: #171feb;\n            --ee-bg-blank: #fff;\n            --ee-code-border: #dfe0ef;\n\n            --ee-input-color: #0d0d19;\n            --ee-input-bg: #fff;\n            --ee-input-placeholder: #adaec5;\n            --ee-input-border: #cbcbda;\n            --ee-input-border-accent: #ecedf5;\n            --ee-input-focus-border: #5D63F1;\n            --ee-input-focus-shadow: 0 3px 6px -3px rgba(174,151,255,0.14),0 5px 10px -3px rgba(97,114,242,0.05);\n            --ee-button-primary-color: #fff;\n            --ee-button-primary-bg: #5D63F1;\n            --ee-button-primary-border: #5D63F1;\n\n            --ee-bg-0: #f7f7fb;\n            --ee-border: #dfe0ef;\n            --ee-error: #FA5252;\n            --ee-error-light: #fee7e7;\n            --ee-warning: #FFB40B;\n            --ee-warning-light: #fff6e1;\n        }\n\n        @font-face{font-family:Roboto;font-style:normal;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-regular.eot);src:local(\"Roboto\"),local(\"Roboto-Regular\"),url({url_themes}webfonts/roboto-v20-latin-regular.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-regular.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-regular.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-italic.eot);src:local(\"Roboto Italic\"),local(\"Roboto-Italic\"),url({url_themes}webfonts/roboto-v20-latin-italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500.eot);src:local(\"Roboto Medium\"),local(\"Roboto-Medium\"),url({url_themes}webfonts/roboto-v20-latin-500.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500italic.eot);src:local(\"Roboto Medium Italic\"),local(\"Roboto-MediumItalic\"),url({url_themes}webfonts/roboto-v20-latin-500italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700.eot);src:local(\"Roboto Bold\"),local(\"Roboto-Bold\"),url({url_themes}webfonts/roboto-v20-latin-700.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700italic.eot);src:local(\"Roboto Bold Italic\"),local(\"Roboto-BoldItalic\"),url({url_themes}webfonts/roboto-v20-latin-700italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.svg#Roboto) format(\"svg\")}\n        @font-face{font-family:\'Font Awesome 5 Free\';font-style:normal;font-weight:900;font-display:auto;src:url({url_themes}webfonts/fa-solid-900.eot);src:url({url_themes}webfonts/fa-solid-900.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/fa-solid-900.woff2) format(\"woff2\"),url({url_themes}webfonts/fa-solid-900.woff) format(\"woff\"),url({url_themes}webfonts/fa-solid-900.ttf) format(\"truetype\"),url({url_themes}webfonts/fa-solid-900.svg#fontawesome) format(\"svg\")}\n\n        *, :after, :before {\n            box-sizing: inherit;\n        }\n\n        html {\n            box-sizing: border-box;\n            font-size: 15px;\n            height: 100%;\n            line-height: 1.15;\n        }\n\n        body {\n            font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n            height: 100%;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-text-normal);\n            background: var(--ee-main-bg);\n            -webkit-font-smoothing: antialiased;\n            margin: 0;\n        }\n\n        .panel {\n            margin-bottom: 20px;\n            background-color: var(--ee-panel-bg);\n            border: 1px solid var(--ee-panel-border);\n            border-radius: 6px;\n        }\n        .redirect {\n            max-width: 700px;\n            min-width: 350px;\n            position: absolute;\n            left: 50%;\n            top: 0;\n            transform: translate(-50%);\n            height: 100vh;\n            overflow-y: auto;\n            background: transparent;\n            border: none;\n            border-radius: 0;\n            display: flex;\n        }\n\n        .redirect-inner {\n          background-color: var(--ee-panel-bg);\n          border: 1px solid var(--ee-panel-border);\n          border-radius: 6px;\n          height: auto;\n          margin-top: auto;\n          margin-bottom: auto;\n        }\n\n        .redirect-inner .qr-code-wrap {\n            text-align: center;\n        }\n\n        .panel-heading {\n            padding: 20px 25px;\n            position: relative;\n        }\n\n        .panel-body {\n            padding: 20px 25px;\n        }\n\n        .panel-body:after, .panel-body:before {\n            content: \" \";\n            display: table;\n        }\n\n        .redirect p {\n            margin-bottom: 20px;\n        }\n        p {\n            line-height: 1.6;\n        }\n        a, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n            color: inherit;\n            margin: 0;\n            padding: 0;\n            font-weight: inherit;\n        }\n\n        code {\n            font-size: inherit;\n            margin: 0 2px;\n            padding: 3px 6px;\n            border-radius: 5px;\n            border: 1px solid var(--ee-code-border);\n            background-color: var(--ee-bg-blank);\n            font-size: .96em;\n            white-space: normal;\n        }\n\n        a {\n            color: var(--ee-link);\n            text-decoration: none;\n            -webkit-transition: color .15s ease-in-out;\n            -moz-transition: color .15s ease-in-out;\n            -o-transition: color .15s ease-in-out;\n        }\n\n        a:hover {\n            color: var(--ee-link-hover);\n        }\n\n        h3 {\n            font-size: 1.35em;\n            font-weight: 500;\n        }\n\n        ol, ul {\n            padding-left: 0;\n        }\n\n        ol li, ul li {\n            list-style-position: inside;\n        }\n\n        .panel-footer {\n            padding: 20px 25px;\n            position: relative;\n        }\n\n        fieldset {\n            margin: 0;\n            padding: 0;\n            margin-bottom: 20px;\n            border: 0;\n        }\n\n        fieldset.last {\n            margin-bottom: 0;\n        }\n\n        .field-instruct {\n            margin-bottom: 5px;\n        }\n\n        .field-instruct label {\n            display: block;\n            color: var(--ee-text-normal);\n            margin-bottom: 5px;\n            font-weight: 500;\n        }\n\n        .field-instruct :last-child {\n            margin-bottom: 0;\n        }\n\n        .field-instruct em {\n            color: var(--ee-text-secondary);\n            display: block;\n            font-size: .8rem;\n            font-style: normal;\n            margin-bottom: 10px;\n        }\n\n        .field-instruct label+em {\n            margin-top: -5px;\n        }\n\n        button, input, optgroup, select, textarea {\n            font-family: inherit;\n            font-size: 100%;\n            line-height: 1.15;\n            margin: 0;\n        }\n\n        input[type=text], input[type=password] {\n            display: block;\n            width: 100%;\n            padding: 8px 15px;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-input-color);\n            background-color: var(--ee-input-bg);\n            background-image: none;\n            transition: border-color .2s ease,box-shadow .2s ease;\n            -webkit-appearance: none;\n            border: 1px solid var(--ee-input-border);\n            border-radius: 5px;\n        }\n\n        input[type=text]:focus, input[type=password]:focus {\n            border-color: var(--ee-input-focus-border);\n        }\n\n        input:focus {\n            outline: 0;\n        }\n\n        .button {\n            -webkit-appearance: none;\n            display: inline-block;\n            font-weight: 500;\n            text-align: center;\n            vertical-align: middle;\n            touch-action: manipulation;\n            background-image: none;\n            cursor: pointer;\n            border: 1px solid transparent;\n            white-space: nowrap;\n            -webkit-transition: background-color .15s ease-in-out;\n            -moz-transition: background-color .15s ease-in-out;\n            -o-transition: background-color .15s ease-in-out;\n            -webkit-user-select: none;\n            -moz-user-select: none;\n            -ms-user-select: none;\n            user-select: none;\n            padding: 8px 20px!important;\n            font-size: 1rem;\n            line-height: 1.6;\n            border-radius: 5px;\n        }\n\n        .button--wide {\n            display: block;\n            width: 100%;\n        }\n\n        .button--large {\n            padding: 10px 25px!important;\n            font-size: 1.2rem;\n            line-height: 1.7;\n            border-radius: 6px;\n        }\n\n        .button--primary {\n            color: var(--ee-button-primary-color);\n            background-color: var(--ee-button-primary-bg);\n            border-color: var(--ee-button-primary-border);\n        }\n\n        .button.disabled {\n            cursor: not-allowed;\n            opacity: .55;\n            box-shadow: none;\n        }\n\n        .app-notice {\n            border: 1px solid var(--ee-border);\n            overflow: hidden;\n            background-color: var(--ee-bg-0);\n            border-radius: 5px;\n            display: flex;\n            margin-bottom: 20px;\n        }\n\n        .app-notice---error {\n            border-color: var(--ee-error);\n            background-color: var(--ee-error-light);\n        }\n\n        .app-notice---error .app-notice__tag {\n            color: var(--ee-error);\n        }\n\n        .app-notice---important {\n            border-color: var(--ee-warning);\n            background-color: var(--ee-warning-light);\n        }\n\n        .app-notice---important .app-notice__tag {\n            color: var(--ee-warning);\n        }\n\n        .app-notice__tag {\n            padding: 15px 20px;\n            display: flex;\n            align-items: center;\n            justify-content: center;\n            font-size: 16px;\n        }\n\n        .app-notice__icon {\n            position: relative;\n        }\n\n        .app-notice__icon::before {\n            font-family: \'Font Awesome 5 Free\';\n            font-weight: 900;\n            content: \"\\\\f06a\";\n            position: relative;\n            z-index: 2;\n        }\n\n        .app-notice---error .app-notice__icon::after {\n            background: var(--ee-error-light);\n        }\n\n        .app-notice__tag+.app-notice__content {\n            padding-left: 0;\n        }\n\n        .app-notice__content {\n            flex: 1 1;\n            padding: 15px 20px;\n        }\n\n        .app-notice__content p {\n            margin: 0;\n            color: var(--ee-text-primary);\n            opacity: .6;\n        }\n\n                </style>\n            </head>\n            <body>\n                <section class=\"flex-wrap\">\n                    <section class=\"wrap\">\n                        <div class=\"panel redirect\">\n                            <div class=\"redirect-inner\">\n                                <div class=\"panel-heading\">\n                                    <h3>{heading}</h3>\n                                </div>\n                                <div class=\"panel-body\">\n                                    {content}\n                                </div>\n                                <div class=\"panel-footer\">\n                                    {link}\n                                </div>\n                            </div>\n                        </div>\n                    </section>\n                </section>\n            </body>\n        </html>', NULL, 1665070903, 0),
(5, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'email', 'members', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}', NULL, 1665070903, 0),
(6, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'email', 'content', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n', NULL, 1665070903, 0),
(7, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'email', 'comments', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}', NULL, 1665070903, 0),
(8, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'email', 'members', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}', NULL, 1665070903, 0),
(9, 1, 'y', 'forgot_password_instructions', 'Login information', 'email', 'members', 'To reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}', NULL, 1665070903, 0),
(10, 1, 'y', 'password_changed_notification', 'Password changed', 'email', 'members', 'Your password was just changed.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1665070903, 0),
(11, 1, 'y', 'forgot_username_instructions', 'Username information', 'email', 'members', 'Your username is: {username}\n\nIf you didn\'t request your username yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1665070903, 0),
(12, 1, 'y', 'email_changed_notification', 'Email address changed', 'email', 'members', 'Your email address has been changed, and this email address is no longer associated with your account.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1665070903, 0),
(13, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', 'email', 'members', 'Your membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}', NULL, 1665070903, 0),
(14, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', 'email', 'members', 'We\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}', NULL, 1665070903, 0),
(15, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'email', 'comments', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}', NULL, 1665070903, 0),
(16, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'email', 'comments', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}', NULL, 1665070903, 0),
(17, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', 'email', 'private_messages', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}', NULL, 1665070903, 0),
(18, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', 'email', 'private_messages', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}', NULL, 1665070903, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_stats`
--

CREATE TABLE `exp_stats` (
  `stat_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `total_members` mediumint NOT NULL DEFAULT '0',
  `recent_member_id` int NOT NULL DEFAULT '0',
  `recent_member` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint NOT NULL DEFAULT '0',
  `total_comments` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_visitor_date` int UNSIGNED NOT NULL DEFAULT '0',
  `most_visitors` mediumint NOT NULL DEFAULT '0',
  `most_visitor_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_cache_clear` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'admin', 8, 0, 0, 0, 1665338280, 0, 0, 0, 0, 0, 1665751353);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_statuses`
--

CREATE TABLE `exp_statuses` (
  `status_id` int UNSIGNED NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int UNSIGNED NOT NULL,
  `highlight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `status`, `status_order`, `highlight`) VALUES
(1, 'open', 1, '009933'),
(2, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_statuses_roles`
--

CREATE TABLE `exp_statuses_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `status_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_statuses_roles`
--

INSERT INTO `exp_statuses_roles` (`role_id`, `status_id`) VALUES
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_structure`
--

CREATE TABLE `exp_structure` (
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `entry_id` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int UNSIGNED NOT NULL DEFAULT '0',
  `listing_cid` int UNSIGNED NOT NULL DEFAULT '0',
  `lft` smallint UNSIGNED NOT NULL DEFAULT '0',
  `rgt` smallint UNSIGNED NOT NULL DEFAULT '0',
  `dead` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `structure_url_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int UNSIGNED NOT NULL DEFAULT '0',
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_structure`
--

INSERT INTO `exp_structure` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `listing_cid`, `lft`, `rgt`, `dead`, `hidden`, `structure_url_title`, `template_id`, `updated`) VALUES
(0, 0, 0, 2, 0, 1, 52, 'root', 'n', NULL, 0, '2022-10-07 12:48:22'),
(1, 10, 0, 1, 0, 4, 5, '', 'n', 'homepage', 2, NULL),
(1, 11, 0, 2, 0, 8, 9, '', 'n', NULL, 0, NULL),
(1, 12, 0, 2, 0, 12, 13, '', 'n', NULL, 0, NULL),
(1, 13, 0, 2, 0, 16, 17, '', 'n', NULL, 0, NULL),
(1, 14, 0, 2, 0, 20, 21, '', 'n', NULL, 0, NULL),
(1, 16, 0, 2, 0, 24, 25, '', 'n', NULL, 0, NULL),
(1, 17, 0, 2, 0, 28, 29, '', 'n', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_structure_channels`
--

CREATE TABLE `exp_structure_channels` (
  `site_id` smallint UNSIGNED NOT NULL,
  `channel_id` mediumint UNSIGNED NOT NULL,
  `template_id` int UNSIGNED NOT NULL,
  `type` enum('page','listing','asset','unmanaged') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_structure_channels`
--

INSERT INTO `exp_structure_channels` (`site_id`, `channel_id`, `template_id`, `type`, `split_assets`, `show_in_page_selector`) VALUES
(1, 1, 2, 'page', 'n', 'y'),
(1, 2, 0, 'page', 'n', 'y'),
(1, 3, 4, 'listing', 'n', 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_structure_listings`
--

CREATE TABLE `exp_structure_listings` (
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `entry_id` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int UNSIGNED NOT NULL DEFAULT '0',
  `template_id` int UNSIGNED NOT NULL DEFAULT '0',
  `uri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_structure_members`
--

CREATE TABLE `exp_structure_members` (
  `member_id` int UNSIGNED NOT NULL DEFAULT '0',
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `nav_state` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_structure_members`
--

INSERT INTO `exp_structure_members` (`member_id`, `site_id`, `nav_state`) VALUES
(1, 1, 'false');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_structure_nav_history`
--

CREATE TABLE `exp_structure_nav_history` (
  `id` int UNSIGNED NOT NULL,
  `site_id` smallint UNSIGNED NOT NULL,
  `site_pages` longtext COLLATE utf8mb4_unicode_ci,
  `structure` longtext COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `structure_version` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `current` smallint UNSIGNED NOT NULL DEFAULT '0',
  `restored_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_structure_nav_history`
--

INSERT INTO `exp_structure_nav_history` (`id`, `site_id`, `site_pages`, `structure`, `note`, `structure_version`, `date`, `current`, `restored_date`) VALUES
(1, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YToxOntpOjE7czoxMDoiL2hvbWVwYWdlLyI7fXM6OToidGVtcGxhdGVzIjthOjE6e2k6MTtpOjI7fX19', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null}]', 'Post saving entry  \"Homepage\"', '6.0.0', '2022-10-07 12:49:41', 0, NULL),
(2, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6MTp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO31zOjk6InRlbXBsYXRlcyI7YToxOntpOjE7aToyO319fQ==', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 2\n)\n', '6.0.0', '2022-10-08 14:21:42', 0, NULL),
(3, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Mjp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7fXM6OToidGVtcGxhdGVzIjthOjI6e2k6MTtpOjI7aTozO2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"ABBA Orchestral\"', '6.0.0', '2022-10-08 17:33:34', 0, NULL),
(4, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Mzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7fXM6OToidGVtcGxhdGVzIjthOjM6e2k6MTtpOjI7aTozO2k6MDtpOjg7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"The War on Drugs\"', '6.0.0', '2022-10-08 17:52:34', 0, NULL),
(5, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6NDp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7fXM6OToidGVtcGxhdGVzIjthOjQ6e2k6MTtpOjI7aTozO2k6MDtpOjg7aTowO2k6NjtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Simply Red\"', '6.0.0', '2022-10-08 17:52:54', 0, NULL),
(6, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6NTp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6NTp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Stormzy\"', '6.0.0', '2022-10-08 17:53:10', 0, NULL),
(7, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTtpOjI7aTozO2k6MDtpOjg7aTowO2k6NjtpOjA7aTo3O2k6MDtpOjU7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Paul Heaton and Jacqui Abbott\"', '6.0.0', '2022-10-08 17:53:30', 0, NULL),
(8, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"James Taylor & his All-Star Band\"', '6.0.0', '2022-10-08 17:53:51', 0, NULL),
(9, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"The War on Drugs\"', '6.0.0', '2022-10-09 11:10:04', 0, NULL),
(10, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Simply Red\"', '6.0.0', '2022-10-09 11:10:26', 0, NULL),
(11, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Stormzy\"', '6.0.0', '2022-10-09 11:10:45', 0, NULL),
(12, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Paul Heaton and Jacqui Abbott\"', '6.0.0', '2022-10-09 11:11:01', 0, NULL),
(13, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"James Taylor & his All-Star Band\"', '6.0.0', '2022-10-09 11:11:18', 0, NULL),
(14, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"ABBA Orchestral\"', '6.0.0', '2022-10-09 11:11:31', 0, NULL),
(15, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Stormzy\"', '6.0.0', '2022-10-09 12:40:21', 0, NULL),
(16, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"The War on Drugs\"', '6.0.0', '2022-10-09 13:29:15', 0, NULL),
(17, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"The War on Drugs\"', '6.0.0', '2022-10-09 17:02:17', 0, NULL),
(18, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Simply Red\"', '6.0.0', '2022-10-09 17:02:27', 0, NULL),
(19, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Paul Heaton and Jacqui Abbott\"', '6.0.0', '2022-10-09 17:02:36', 0, NULL),
(20, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"James Taylor & his All-Star Band\"', '6.0.0', '2022-10-09 17:02:43', 0, NULL),
(21, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"ABBA Orchestral\"', '6.0.0', '2022-10-09 17:02:54', 0, NULL),
(22, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Stormzy\"', '6.0.0', '2022-10-09 17:03:06', 0, NULL),
(23, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Homepage\"', '6.0.0', '2022-10-09 17:03:14', 0, NULL),
(24, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"ABBA Orchestral\"', '6.0.0', '2022-10-09 17:03:30', 0, NULL),
(25, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"James Taylor & his All-Star Band\"', '6.0.0', '2022-10-09 17:03:42', 0, NULL),
(26, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Simply Red\"', '6.0.0', '2022-10-09 17:03:56', 0, NULL),
(27, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxO3M6MTA6Ii9ob21lcGFnZS8iO2k6MztzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aTo4O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aTo2O3M6MTI6Ii9zaW1wbHktcmVkLyI7aTo3O3M6OToiL3N0b3JtenkvIjtpOjU7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aToxO2k6MjtpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Homepage\"', '6.0.0', '2022-10-09 17:47:37', 0, NULL),
(28, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjY7czoxMjoiL3NpbXBseS1yZWQvIjtpOjc7czo5OiIvc3Rvcm16eS8iO2k6NTtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO31zOjk6InRlbXBsYXRlcyI7YTo2OntpOjM7aTowO2k6ODtpOjA7aTo2O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 1\n)\n', '6.0.0', '2022-10-09 17:48:41', 0, NULL);
INSERT INTO `exp_structure_nav_history` (`id`, `site_id`, `site_pages`, `structure`, `note`, `structure_version`, `date`, `current`, `restored_date`) VALUES
(29, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjY7czoxMjoiL3NpbXBseS1yZWQvIjtpOjc7czo5OiIvc3Rvcm16eS8iO2k6NTtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MztpOjA7aTo4O2k6MDtpOjY7aTowO2k6NztpOjA7aTo1O2k6MDtpOjQ7aTowO2k6MTA7aToyO319fQ==', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null}]', 'Post saving entry  \"Homepage\"', '6.0.0', '2022-10-09 17:48:50', 0, NULL),
(30, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjc7czo5OiIvc3Rvcm16eS8iO2k6NTtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MztpOjA7aTo4O2k6MDtpOjc7aTowO2k6NTtpOjA7aTo0O2k6MDtpOjEwO2k6Mjt9fX0=', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 6\n)\n', '6.0.0', '2022-10-09 17:52:37', 0, NULL),
(31, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjc7czo5OiIvc3Rvcm16eS8iO2k6NTtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO31zOjk6InRlbXBsYXRlcyI7YTo3OntpOjM7aTowO2k6ODtpOjA7aTo3O2k6MDtpOjU7aTowO2k6NDtpOjA7aToxMDtpOjI7aToxMTtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":18,\"rgt\":19,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Simply Red\"', '6.0.0', '2022-10-09 17:53:00', 0, NULL),
(32, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjc7czo5OiIvc3Rvcm16eS8iO2k6NDtzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MztpOjA7aTo4O2k6MDtpOjc7aTowO2k6NDtpOjA7aToxMDtpOjI7aToxMTtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 5\n)\n', '6.0.0', '2022-10-09 17:53:36', 0, NULL),
(33, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjc7czo5OiIvc3Rvcm16eS8iO2k6NDtzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aTozO2k6MDtpOjg7aTowO2k6NztpOjA7aTo0O2k6MDtpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Paul Heaton and Jacqui Abbott\"', '6.0.0', '2022-10-09 17:54:13', 0, NULL),
(34, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MztpOjA7aTo4O2k6MDtpOjQ7aTowO2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":18,\"rgt\":19,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 7\n)\n', '6.0.0', '2022-10-09 17:54:23', 0, NULL),
(35, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjg7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MztpOjA7aTo4O2k6MDtpOjQ7aTowO2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":18,\"rgt\":19,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":22,\"rgt\":23,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"Stormzy\"', '6.0.0', '2022-10-09 17:54:48', 0, NULL),
(36, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MztpOjA7aTo0O2k6MDtpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 8\n)\n', '6.0.0', '2022-10-09 17:55:36', 0, NULL),
(37, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO31zOjk6InRlbXBsYXRlcyI7YTo3OntpOjM7aTowO2k6NDtpOjA7aToxMDtpOjI7aToxMTtpOjA7aToxMjtpOjA7aToxMztpOjA7aToxNDtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"The War on Drugs\"', '6.0.0', '2022-10-09 17:55:54', 0, NULL),
(38, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTozO3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjtpOjQ7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO31zOjk6InRlbXBsYXRlcyI7YTo3OntpOjM7aTowO2k6NDtpOjA7aToxMDtpOjI7aToxMTtpOjA7aToxMjtpOjA7aToxMztpOjA7aToxNDtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 9\n)\n', '6.0.0', '2022-10-09 17:56:36', 0, NULL),
(39, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjtpOjEwO3M6MTA6Ii9ob21lcGFnZS8iO2k6MTE7czoxMjoiL3NpbXBseS1yZWQvIjtpOjEyO3M6MzE6Ii9wYXVsLWhlYXRvbi1hbmQtamFjcXVpLWFiYm90dC8iO2k6MTM7czo5OiIvc3Rvcm16eS8iO2k6MTQ7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Njp7aTo0O2k6MDtpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":18,\"rgt\":19,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":22,\"rgt\":23,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 3\n)\n', '6.0.0', '2022-10-09 17:57:06', 0, NULL),
(40, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTo0O3M6MzI6Ii9qYW1lcy10YXlsb3ItaGlzLWFsbC1zdGFyLWJhbmQvIjtpOjEwO3M6MTA6Ii9ob21lcGFnZS8iO2k6MTE7czoxMjoiL3NpbXBseS1yZWQvIjtpOjEyO3M6MzE6Ii9wYXVsLWhlYXRvbi1hbmQtamFjcXVpLWFiYm90dC8iO2k6MTM7czo5OiIvc3Rvcm16eS8iO2k6MTQ7czoxODoiL3RoZS13YXItb24tZHJ1Z3MvIjtpOjE2O3M6MTc6Ii9hYmJhLW9yY2hlc3RyYWwvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Nzp7aTo0O2k6MDtpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":18,\"rgt\":19,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":22,\"rgt\":23,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":26,\"rgt\":27,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"ABBA Orchestral\"', '6.0.0', '2022-10-09 17:57:49', 0, NULL),
(41, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 4\n)\n', '6.0.0', '2022-10-09 17:58:02', 0, NULL),
(42, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"James Taylor & his All-Star Band\"', '6.0.0', '2022-10-09 17:58:27', 0, NULL),
(43, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"James Taylor & his All-Star Band\"', '6.0.0', '2022-10-09 18:02:49', 0, NULL),
(44, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxODtzOjEyOiIvdGVzdC1ldmVudC8iO31zOjk6InRlbXBsYXRlcyI7YTo4OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjE4O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":18,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":30,\"rgt\":31,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST EVENT\"', '6.0.0', '2022-10-09 18:52:11', 0, NULL),
(45, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 18\n)\n', '6.0.0', '2022-10-09 18:52:42', 0, NULL),
(46, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxOTtzOjEyOiIvdGVzdC1ldmVudC8iO31zOjk6InRlbXBsYXRlcyI7YTo4OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjE5O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":19,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":32,\"rgt\":33,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"test event\"', '6.0.0', '2022-10-10 06:25:37', 0, NULL),
(47, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxOTtzOjEyOiIvdGVzdC1ldmVudC8iO31zOjk6InRlbXBsYXRlcyI7YTo4OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjE5O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":19,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":32,\"rgt\":33,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"SOME event\"', '6.0.0', '2022-10-10 06:26:30', 0, NULL),
(48, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxOTtzOjEyOiIvdGVzdC1ldmVudC8iO31zOjk6InRlbXBsYXRlcyI7YTo4OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjE5O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":19,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":32,\"rgt\":33,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"SOME event\"', '6.0.0', '2022-10-10 06:26:49', 0, NULL),
(49, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxOTtzOjEyOiIvdGVzdC1ldmVudC8iO31zOjk6InRlbXBsYXRlcyI7YTo4OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjE5O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":19,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":32,\"rgt\":33,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"SOME event\"', '6.0.0', '2022-10-10 06:27:07', 0, NULL),
(50, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToxOTtzOjEyOiIvdGVzdC1ldmVudC8iO31zOjk6InRlbXBsYXRlcyI7YTo4OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjE5O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":19,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":32,\"rgt\":33,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"SOME event\"', '6.0.0', '2022-10-10 06:27:15', 0, NULL),
(51, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 19\n)\n', '6.0.0', '2022-10-10 06:28:05', 0, NULL),
(52, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyMDtzOjEyOiIvdGVzdC1ldmVudC8iO31zOjk6InRlbXBsYXRlcyI7YTo4OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjIwO2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":20,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":34,\"rgt\":35,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST EVENT\"', '6.0.0', '2022-10-10 06:38:44', 0, NULL);
INSERT INTO `exp_structure_nav_history` (`id`, `site_id`, `site_pages`, `structure`, `note`, `structure_version`, `date`, `current`, `restored_date`) VALUES
(53, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 20\n)\n', '6.0.0', '2022-10-10 06:39:05', 0, NULL),
(54, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyMTtzOjY6Ii90ZXN0LyI7fXM6OToidGVtcGxhdGVzIjthOjg6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjE7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST\"', '6.0.0', '2022-10-10 06:41:20', 0, NULL),
(55, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6ODp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyMTtzOjY6Ii90ZXN0LyI7fXM6OToidGVtcGxhdGVzIjthOjg6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjE7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST\"', '6.0.0', '2022-10-10 06:41:25', 0, NULL),
(56, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyMTtzOjY6Ii90ZXN0LyI7aToyMjtzOjg6Ii90ZXN0LTIvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6OTp7aToxMDtpOjI7aToxMTtpOjA7aToxMjtpOjA7aToxMztpOjA7aToxNDtpOjA7aToxNjtpOjA7aToxNztpOjA7aToyMTtpOjA7aToyMjtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST 2\"', '6.0.0', '2022-10-10 06:41:34', 0, NULL),
(57, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyMTtzOjY6Ii90ZXN0LyI7aToyMjtzOjg6Ii90ZXN0LTIvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6OTp7aToxMDtpOjI7aToxMTtpOjA7aToxMjtpOjA7aToxMztpOjA7aToxNDtpOjA7aToxNjtpOjA7aToxNztpOjA7aToyMTtpOjA7aToyMjtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST 2\"', '6.0.0', '2022-10-10 06:41:37', 0, NULL),
(58, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6MTA6e2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO2k6MTY7czoxNzoiL2FiYmEtb3JjaGVzdHJhbC8iO2k6MTc7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MjE7czo2OiIvdGVzdC8iO2k6MjI7czo4OiIvdGVzdC0yLyI7aToyMztzOjg6Ii90ZXN0LTMvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6MTA6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjE7aTowO2k6MjI7aTowO2k6MjM7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST 3\"', '6.0.0', '2022-10-10 06:41:47', 0, NULL),
(59, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6MTE6e2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO2k6MTY7czoxNzoiL2FiYmEtb3JjaGVzdHJhbC8iO2k6MTc7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MjE7czo2OiIvdGVzdC8iO2k6MjI7czo4OiIvdGVzdC0yLyI7aToyMztzOjg6Ii90ZXN0LTMvIjtpOjI0O3M6ODoiL3Rlc3QtNC8iO31zOjk6InRlbXBsYXRlcyI7YToxMTp7aToxMDtpOjI7aToxMTtpOjA7aToxMjtpOjA7aToxMztpOjA7aToxNDtpOjA7aToxNjtpOjA7aToxNztpOjA7aToyMTtpOjA7aToyMjtpOjA7aToyMztpOjA7aToyNDtpOjA7fX19', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST 4\"', '6.0.0', '2022-10-10 06:41:58', 0, NULL),
(60, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6MTI6e2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO2k6MTY7czoxNzoiL2FiYmEtb3JjaGVzdHJhbC8iO2k6MTc7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MjE7czo2OiIvdGVzdC8iO2k6MjI7czo4OiIvdGVzdC0yLyI7aToyMztzOjg6Ii90ZXN0LTMvIjtpOjI0O3M6ODoiL3Rlc3QtNC8iO2k6MjU7czo4OiIvdGVzdC01LyI7fXM6OToidGVtcGxhdGVzIjthOjEyOntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjIxO2k6MDtpOjIyO2k6MDtpOjIzO2k6MDtpOjI0O2k6MDtpOjI1O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":44,\"rgt\":45,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST 5\"', '6.0.0', '2022-10-10 06:42:07', 0, NULL),
(61, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6MTM6e2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO2k6MTY7czoxNzoiL2FiYmEtb3JjaGVzdHJhbC8iO2k6MTc7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MjE7czo2OiIvdGVzdC8iO2k6MjI7czo4OiIvdGVzdC0yLyI7aToyMztzOjg6Ii90ZXN0LTMvIjtpOjI0O3M6ODoiL3Rlc3QtNC8iO2k6MjU7czo4OiIvdGVzdC01LyI7aToyNjtzOjk6Ii90aXRsZS02LyI7fXM6OToidGVtcGxhdGVzIjthOjEzOntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjIxO2k6MDtpOjIyO2k6MDtpOjIzO2k6MDtpOjI0O2k6MDtpOjI1O2k6MDtpOjI2O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":44,\"rgt\":45,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":46,\"rgt\":47,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TITLE 6\"', '6.0.0', '2022-10-10 06:43:35', 0, NULL),
(62, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6MTQ6e2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO2k6MTY7czoxNzoiL2FiYmEtb3JjaGVzdHJhbC8iO2k6MTc7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MjE7czo2OiIvdGVzdC8iO2k6MjI7czo4OiIvdGVzdC0yLyI7aToyMztzOjg6Ii90ZXN0LTMvIjtpOjI0O3M6ODoiL3Rlc3QtNC8iO2k6MjU7czo4OiIvdGVzdC01LyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7fXM6OToidGVtcGxhdGVzIjthOjE0OntpOjEwO2k6MjtpOjExO2k6MDtpOjEyO2k6MDtpOjEzO2k6MDtpOjE0O2k6MDtpOjE2O2k6MDtpOjE3O2k6MDtpOjIxO2k6MDtpOjIyO2k6MDtpOjIzO2k6MDtpOjI0O2k6MDtpOjI1O2k6MDtpOjI2O2k6MDtpOjI3O2k6MDt9fX0=', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":44,\"rgt\":45,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":46,\"rgt\":47,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":48,\"rgt\":49,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TITLE 7\"', '6.0.0', '2022-10-10 06:43:48', 0, NULL),
(63, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6MTU6e2k6MTA7czoxMDoiL2hvbWVwYWdlLyI7aToxMTtzOjEyOiIvc2ltcGx5LXJlZC8iO2k6MTI7czozMToiL3BhdWwtaGVhdG9uLWFuZC1qYWNxdWktYWJib3R0LyI7aToxMztzOjk6Ii9zdG9ybXp5LyI7aToxNDtzOjE4OiIvdGhlLXdhci1vbi1kcnVncy8iO2k6MTY7czoxNzoiL2FiYmEtb3JjaGVzdHJhbC8iO2k6MTc7czozMjoiL2phbWVzLXRheWxvci1oaXMtYWxsLXN0YXItYmFuZC8iO2k6MjE7czo2OiIvdGVzdC8iO2k6MjI7czo4OiIvdGVzdC0yLyI7aToyMztzOjg6Ii90ZXN0LTMvIjtpOjI0O3M6ODoiL3Rlc3QtNC8iO2k6MjU7czo4OiIvdGVzdC01LyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7aToyODtzOjg6Ii90ZXN0LTgvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6MTU6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjE7aTowO2k6MjI7aTowO2k6MjM7aTowO2k6MjQ7aTowO2k6MjU7aTowO2k6MjY7aTowO2k6Mjc7aTowO2k6Mjg7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":21,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":44,\"rgt\":45,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":46,\"rgt\":47,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":48,\"rgt\":49,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":28,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":50,\"rgt\":51,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post saving entry  \"TEST 8\"', '6.0.0', '2022-10-10 06:44:44', 0, NULL),
(64, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7fXM6OToidGVtcGxhdGVzIjthOjk6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjY7aTowO2k6Mjc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":22,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":44,\"rgt\":45,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":46,\"rgt\":47,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":28,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":48,\"rgt\":49,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 21\n)\n', '6.0.0', '2022-10-10 06:57:59', 0, NULL),
(65, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7fXM6OToidGVtcGxhdGVzIjthOjk6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjY7aTowO2k6Mjc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":23,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":44,\"rgt\":45,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":28,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":46,\"rgt\":47,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 22\n)\n', '6.0.0', '2022-10-10 06:57:59', 0, NULL),
(66, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7fXM6OToidGVtcGxhdGVzIjthOjk6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjY7aTowO2k6Mjc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":24,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":28,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":44,\"rgt\":45,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 23\n)\n', '6.0.0', '2022-10-10 06:57:59', 0, NULL),
(67, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7fXM6OToidGVtcGxhdGVzIjthOjk6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjY7aTowO2k6Mjc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":25,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":28,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":42,\"rgt\":43,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 24\n)\n', '6.0.0', '2022-10-10 06:57:59', 0, NULL),
(68, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7fXM6OToidGVtcGxhdGVzIjthOjk6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjY7aTowO2k6Mjc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":28,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":40,\"rgt\":41,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 25\n)\n', '6.0.0', '2022-10-10 06:57:59', 0, NULL),
(69, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6OTp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7aToyNjtzOjk6Ii90aXRsZS02LyI7aToyNztzOjk6Ii90aXRsZS03LyI7fXM6OToidGVtcGxhdGVzIjthOjk6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO2k6MjY7aTowO2k6Mjc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":26,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":38,\"rgt\":39,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 28\n)\n', '6.0.0', '2022-10-10 06:57:59', 0, NULL);
INSERT INTO `exp_structure_nav_history` (`id`, `site_id`, `site_pages`, `structure`, `note`, `structure_version`, `date`, `current`, `restored_date`) VALUES
(70, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":27,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":36,\"rgt\":37,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 26\n)\n', '6.0.0', '2022-10-10 06:58:17', 0, NULL),
(71, 1, 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aToxMDtzOjEwOiIvaG9tZXBhZ2UvIjtpOjExO3M6MTI6Ii9zaW1wbHktcmVkLyI7aToxMjtzOjMxOiIvcGF1bC1oZWF0b24tYW5kLWphY3F1aS1hYmJvdHQvIjtpOjEzO3M6OToiL3N0b3JtenkvIjtpOjE0O3M6MTg6Ii90aGUtd2FyLW9uLWRydWdzLyI7aToxNjtzOjE3OiIvYWJiYS1vcmNoZXN0cmFsLyI7aToxNztzOjMyOiIvamFtZXMtdGF5bG9yLWhpcy1hbGwtc3Rhci1iYW5kLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MTA7aToyO2k6MTE7aTowO2k6MTI7aTowO2k6MTM7aTowO2k6MTQ7aTowO2k6MTY7aTowO2k6MTc7aTowO319fQ==', '[{\"site_id\":1,\"entry_id\":10,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"homepage\",\"template_id\":2,\"updated\":null},{\"site_id\":1,\"entry_id\":11,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":12,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":13,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":16,\"rgt\":17,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":14,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":20,\"rgt\":21,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":16,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":24,\"rgt\":25,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":17,\"parent_id\":0,\"channel_id\":2,\"listing_cid\":0,\"lft\":28,\"rgt\":29,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]', 'Post Deleting Entries  -- entry_idsArray\n(\n    [0] => 27\n)\n', '6.0.0', '2022-10-10 06:58:17', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_structure_settings`
--

CREATE TABLE `exp_structure_settings` (
  `id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `var` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `var_value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_structure_settings`
--

INSERT INTO `exp_structure_settings` (`id`, `site_id`, `var`, `var_value`) VALUES
(1, 0, 'action_ajax_move', '39'),
(2, 0, 'module_id', '12'),
(3, 1, 'show_picker', 'y'),
(4, 1, 'show_view_page', 'y'),
(5, 1, 'show_global_add_page', 'y'),
(6, 1, 'hide_hidden_templates', 'y'),
(7, 1, 'redirect_on_login', 'n'),
(8, 1, 'redirect_on_publish', 'n'),
(9, 1, 'add_trailing_slash', 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_templates`
--

CREATE TABLE `exp_templates` (
  `template_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL,
  `template_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0',
  `last_author_id` int UNSIGNED NOT NULL DEFAULT '0',
  `cache` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int UNSIGNED NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `protect_javascript` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`, `enable_frontedit`) VALUES
(1, 1, 1, 'sample-widget', 'webpage', '{widget title=\"Demo dashboard widget\" width=\"half\"}\n\n<p>Random entry: {exp:channel:entries dynamic=\"no\" orderby=\"random\" limit=\"1\"}<a href=\"{cp_url}?/cp/publish/edit/entry/{entry_id}&S={cp_session_id}\">{title}</a>{/exp:channel:entries}</p>\n\n<p>To see this code please visit the template <a href=\"{cp_url}?/cp/design/template/edit/1&S={cp_session_id}\">pro-dashboard-widgets/sample-widget</a>.</p>\n', NULL, 1665070908, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(2, 1, 2, 'index', 'webpage', '{exp:channel:entries channel=\"homepage\" limit=\"1\"}\n<!-- include \"meta-head.html\" -->\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    {embed=\"embeds/meta-head\"}\n</head>\n\n<body>\n<main class=\"main-container\">\n\n    <!-- include \"partial-header.html\" -->\n    {embed=\"embeds/header\"}\n\n    <div class=\"wrapper wrapper--wide whats-on__wrapper tabs\">\n        <div class=\"tabs__panel\" data-tab-id=\"just-announced\" >\n            {embed=\"sections/just-announced\"}\n        </div>\n        <div class=\"tabs__panel\" data-tab-id=\"upcoming\">\n            {embed=\"sections/upcoming\"}\n        </div>\n        <div class=\"tabs__panel\" data-tab-id=\"featured\">\n            {embed=\"sections/featured\"}\n        </div>\n    </div>\n    <div class=\"whats-on__footer\">\n        <a href=\"{site_url}events\" target=\"_blank\"\n           class=\"button\">View All Shows</a>\n    </div>\n    </section>\n</main>\n\n{embed=\"embeds/footer\"}\n</body>\n</html>\n{/exp:channel:entries}', NULL, 1665331005, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(3, 1, 1, 'index', 'webpage', '', NULL, 1665146835, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(4, 1, 3, 'index', 'webpage', '{exp:channel:entries channel=\"event\"}\n\n{embed=\"event/card\" title=\"{title}\" start_date=\"{start_date format=\"%D %d %M %Y\"}\" end_date=\"{end_date format=\"%D %d %M %Y\"}\"}\n\n{/exp:channel:entries}', NULL, 1665325068, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(5, 1, 4, 'meta-head', 'webpage', '<meta charset=\"utf-8\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n<meta name=\"description\" content=\"\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n\n<title>3 Arena</title>\n\n<link rel=\"stylesheet\" href=\"{site_url}css/main.css\">\n\n<script>\n    // Picture element HTML5 shiv\n    document.createElement(\"picture\");\n</script>\n<script src=\"https://cdnjs.cloudflare.com/ajax/libs/picturefill/3.0.3/picturefill.min.js\"\n        integrity=\"sha256-iT+n/otuaeKCgxnASny7bxKeqCDbaV1M7VdX1ZRQtqg=\"\n        crossorigin=\"anonymous\"\n        async></script>', NULL, 1665146835, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(6, 1, 4, 'header', 'webpage', '<section class=\"section section--on-top tabs js-tabs whats-on tabbed-content\"\n         id=\"whatsOn\">\n  <div class=\"wrapper wrapper--even whats-on__wrapper stagger-children\">\n    <div class=\"wrapper__col stagger-child\">\n      <h2 class=\"h4 whats-on__heading\">Shows</h2>\n    </div>\n\n    <div class=\"wrapper__col\"></div>\n\n    <div class=\"wrapper__col stagger-child\">\n      <div class=\"tabs__nav\">\n        <ul class=\"tabs__list tab-navigation\">\n          <li class=\"tabs__item\" data-tab-target=\"just-announced\">\n            <button class=\"tabs__link tabs__link--active js-tabs__link js-tabs__link--active\">\n              Just Announced\n            </button>\n          </li>\n\n          <li class=\"tabs__item\" data-tab-target=\"upcoming\">\n            <button class=\"tabs__link js-tabs__link\">\n              Upcoming\n            </button>\n          </li>\n\n          <li class=\"tabs__item\" data-tab-target=\"featured\">\n            <button class=\"tabs__link js-tabs__link\">\n              Featured\n            </button>\n          </li>\n        </ul>\n      </div>\n    </div>\n  </div>', NULL, 1665146835, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(7, 1, 4, 'index', 'webpage', '', NULL, 1665146835, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(19, 1, 5, 'just-announced', 'webpage', '{exp:channel:entries channel=\"event\" orderby={entry_date} limit=\"6\"}\n    {if event_type == \'just-announced\'}\n        {embed=\"events/card\" entry_id=\"{entry_id}\"}\n    {/if}\n{/exp:channel:entries}', NULL, 1665332244, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(20, 1, 5, 'upcoming', 'webpage', '{exp:channel:entries channel=\"event\" sort=\"asc\" limit=\"6\" }\n    {if event_type == \'upcoming\'}\n        {embed=\"events/card\" entry_id=\"{entry_id}\"}\n    {/if}\n{/exp:channel:entries}', NULL, 1665332244, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(21, 1, 5, 'featured', 'webpage', '{exp:channel:entries channel=\"event\" sort=\"asc\" limit=\"6\"}\n    {if event_type == \'featured\'}\n        {embed=\"events/card\" entry_id=\"{entry_id}\"}\n    {/if}\n{/exp:channel:entries}', NULL, 1665322960, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(22, 1, 3, 'card', 'webpage', '<article class=\"card-link\"\n         style=\"transition-delay: 450ms;\">\n  <div class=\"card-link__image\">\n    <a href=\"{site_url}/event/{url_title}\"\n       class=\"card-link__image-link\">\n      {if embed:image}\n        <!-- 400 x 400 -->\n        <picture>\n          <source src=\"{embed:image:webp:resize width=\'400\' height=\'400\'}\" type=\"image/webp\">\n          <img src=\"{embed:image:resize width=\'400\' height=\'400\'}\"\n               alt=\"{embed:title}\"\n               class=\"card-link__image-source\">\n        </picture>\n      {/if}\n    </a>\n  </div>\n\n  <div class=\"card-link__content\">\n    <div class=\"card-link__titles\">\n      <h3 class=\"h4 card-link__heading\">\n        <a class=\"card-link__heading-link\"\n           href=\"{site_url}/event/{url_title}\">{embed:title}</a>\n      </h3>\n      <p class=\"card-link__sub-heading\">\n        {if embed:start_date}\n          <time datetime=\"{embed:start_date}\">{embed:start_date}</time>\n        {/if}\n        {if embed:end_date}\n          <time datetime=\"{embed:end_date}\">{embed:end_date format=\"%Y-%m-%d\"}</time>\n        {/if}\n      </p>\n    </div>\n\n    <div class=\"card-link__info\">\n      <ul class=\"card-link__list\">\n\n      </ul>\n      <div class=\"card-link__ctas\">\n        <div class=\"inline-ctas\">\n          <a href=\"{site_url}/event/{url_title}\"\n             class=\"inline-ctas__cta text-pink\">\n            <span class=\"inline-ctas__text\">Learn more</span>\n            <i class=\"icon-right-arrow inline-ctas__arrow\"></i>\n          </a>\n\n          <a href=\"{site_url}/event/{url_title}\"\n             target=\"_blank\"\n             rel=\"noreferrer\"\n             class=\"inline-ctas__cta text-white\">\n            <i class=\"icon-ticket inline-ctas__icon\"></i>\n            <span class=\"inline-ctas__text\">Buy Now</span>\n            <i class=\"icon-right-arrow inline-ctas__arrow\"></i>\n          </a>\n        </div>\n      </div>\n    </div>\n  </div>\n</article>', NULL, 1665339664, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(23, 1, 5, 'index', 'webpage', '', NULL, 1665248855, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(24, 1, 3, 'entry', 'webpage', '', NULL, 1665325068, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(25, 1, 6, 'card', 'webpage', '{exp:channel:entries channel=\"event\" entry_id=\"{embed:entry_id}\" limit=\"1\" cache=\"no\"}\n<article class=\"card-link\"\n         style=\"transition-delay: 450ms;\">\n    <div class=\"card-link__image\">\n        <a href=\"{site_url}event/{url_title}\"\n           class=\"card-link__image-link\">\n            {if image}\n            <!-- 400 x 400 -->\n            <picture>\n                <source src=\"{image:webp resize:width=\'400\' resize:height=\'400\'}\" type=\"image/webp\">\n                <img src=\"{image:resize width=\'400\' height=\'400\'}\"\n                     alt=\"{embed:title}\"\n                     class=\"card-link__image-source\">\n            </picture>\n            {/if}\n        </a>\n    </div>\n\n    <div class=\"card-link__content\">\n        <div class=\"card-link__titles\">\n            <h3 class=\"h4 card-link__heading\">\n                <a class=\"card-link__heading-link\"\n                   href=\"{site_url}event/{url_title}\">{title}</a>\n            </h3>\n            <p class=\"card-link__sub-heading\">\n                {if start_date}\n                <time datetime=\"{start_date}\">{start_date format=\"%D %d %M %Y\"}</time>\n                {/if}\n                {if start_date && end_date}-{/if}\n                {if end_date}\n                <time datetime=\"{end_date}\">{end_date format=\"%D %d %M %Y\"}</time>\n                {/if}\n            </p>\n        </div>\n\n        <div class=\"card-link__info\">\n            <ul class=\"card-link__list\">\n\n            </ul>\n            <div class=\"card-link__ctas\">\n                <div class=\"inline-ctas\">\n                    <a href=\"{site_url}event/{url_title}\"\n                       class=\"inline-ctas__cta text-pink\">\n                        <span class=\"inline-ctas__text\">Learn more</span>\n                        <i class=\"icon-right-arrow inline-ctas__arrow\"></i>\n                    </a>\n                    {if start_date or end_date}\n                    <a href=\"{site_url}/event/{url_title}\"\n                       target=\"_blank\"\n                       rel=\"noreferrer\"\n                       class=\"inline-ctas__cta text-white\">\n                        <i class=\"icon-ticket inline-ctas__icon\"></i>\n                        <span class=\"inline-ctas__text\">Buy Now</span>\n                        <i class=\"icon-right-arrow inline-ctas__arrow\"></i>\n                    </a>\n                    {if:else}\n                    <span class=\"inline-ctas__text\">\n              <a href=\"{url_title_path=\'events/ics\'}\">Remind Me</a>\n            </span>\n                    <i class=\"icon-right-arrow inline-ctas__arrow\"></i>\n                    </a>\n                    {/if}\n                </div>\n            </div>\n        </div>\n    </div>\n</article>\n{/exp:channel:entries}', NULL, 1665352815, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(26, 1, 6, 'index', 'webpage', '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    {embed=\"embeds/meta-head\"}\n</head>\n\n<body>\n<main class=\"main-container\">\n\n    {embed=\"embeds/events-header\"}\n\n        <div class=\"wrapper wrapper--wide whats-on__wrapper tabs\">\n            <div class=\"tabs__panel\" data-tab-id=\"just-announced\">\n                {exp:channel:entries channel=\"event\"}\n                    {embed=\"events/card\" entry_id=\"{entry_id}\"}\n                {/exp:channel:entries}\n            </div>\n        </div>\n    </section>\n</main>\n\n    {embed=\"embeds/footer\"}\n</body>\n</html>\n', NULL, 1665331143, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(27, 1, 4, 'footer', 'webpage', '<!-- All JS actions that are site wide should be in this file -->\n<script src=\"{site_url}/js/vendors.js\" id=\"vendorsScript\"></script>\n<script src=\"{site_url}/js/main.js\" id=\"mainScript\"></script>\n<script src=\"{site_url}/js/homepage.js\"></script>', NULL, 1665331143, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(28, 1, 4, 'events-header', 'webpage', '<section class=\"section section--on-top tabs js-tabs whats-on tabbed-content\"\n         id=\"whatsOn\">\n    <div class=\"wrapper wrapper--even whats-on__wrapper stagger-children\">\n        <div class=\"wrapper__col stagger-child\">\n            <h2 class=\"h4 whats-on__heading\">Shows</h2>\n        </div>\n        <div class=\"wrapper__col\"></div>\n        <div class=\"wrapper__col stagger-child\">\n            <div class=\"tabs__nav\">\n                <ul class=\"tabs__list tab-navigation\">\n                    <li class=\"tabs__item\" data-tab-target=\"just-announced\"></li>\n                    <li class=\"tabs__item\" data-tab-target=\"upcoming\"></li>\n                    <li class=\"tabs__item\" data-tab-target=\"featured\"></li>\n                </ul>\n            </div>\n        </div>\n    </div>', NULL, 1665329048, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(29, 1, 6, 'ics', 'webpage', '{exp:channel:entries channel=\'event\' limit=\'1\' show_future_entries=\'yes\' require_entry=\'yes\'}\n{if no_results}\n{redirect=\'404\'}\n{/if}\n\n{exp:download_content filename=\'{url_title}.ics\'}\nBEGIN:VCALENDAR\nVERSION:2.0\nBEGIN:VEVENT\nUID:{url_title}-{entry_date format=\'%Y%m%d\'}@{site_name:url_slug}\nDTSTART;TZID={start_date format=\"%D %d %M %Y\"}\nDTEND;TZID={end_date format=\"%D %d %M %Y\"}\nSUMMARY:{title}\nX-APPLE-TRAVEL-ADVISORY-BEHAVIOR:AUTOMATIC\nBEGIN:VALARM\nX-WR-ALARMUID:{url_title}-{entry_date format=\'%Y%m%d\'}@{site_name:url_slug}\nTRIGGER:-PT120M\nACTION:DISPLAY\nEND:VALARM\nEND:VEVENT\nEND:VCALENDAR\n{/exp:download_content}\n\n{/exp:channel:entries}', NULL, 1665337421, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_templates_roles`
--

CREATE TABLE `exp_templates_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `template_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_templates_roles`
--

INSERT INTO `exp_templates_roles` (`role_id`, `template_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(1, 19),
(2, 19),
(3, 19),
(4, 19),
(5, 19),
(1, 20),
(2, 20),
(3, 20),
(4, 20),
(5, 20),
(1, 21),
(2, 21),
(3, 21),
(4, 21),
(5, 21),
(1, 22),
(2, 22),
(3, 22),
(4, 22),
(5, 22),
(1, 23),
(2, 23),
(3, 23),
(4, 23),
(5, 23),
(1, 24),
(2, 24),
(3, 24),
(4, 24),
(5, 24),
(1, 25),
(2, 25),
(3, 25),
(4, 25),
(5, 25),
(1, 26),
(2, 26),
(3, 26),
(4, 26),
(5, 26),
(1, 27),
(2, 27),
(3, 27),
(4, 27),
(5, 27),
(1, 28),
(2, 28),
(3, 28),
(4, 28),
(5, 28),
(1, 29),
(2, 29),
(3, 29),
(4, 29),
(5, 29);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_template_groups`
--

CREATE TABLE `exp_template_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int UNSIGNED NOT NULL,
  `is_site_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'pro-dashboard-widgets', 1, 'n'),
(2, 1, 'site', 2, 'y'),
(3, 1, 'event', 3, 'n'),
(4, 1, 'embeds', 4, 'n'),
(5, 1, 'sections', 5, 'n'),
(6, 1, 'events', 6, 'n');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_template_groups_roles`
--

CREATE TABLE `exp_template_groups_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `template_group_id` mediumint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_template_routes`
--

CREATE TABLE `exp_template_routes` (
  `route_id` int UNSIGNED NOT NULL,
  `template_id` int UNSIGNED NOT NULL,
  `order` int UNSIGNED DEFAULT NULL,
  `route` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_throttle`
--

CREATE TABLE `exp_throttle` (
  `throttle_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int UNSIGNED NOT NULL DEFAULT '0',
  `hits` int UNSIGNED NOT NULL,
  `locked_out` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exp_update_log`
--

CREATE TABLE `exp_update_log` (
  `log_id` int UNSIGNED NOT NULL,
  `timestamp` int UNSIGNED DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int UNSIGNED DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_update_log`
--

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`) VALUES
(1, 1665070903, 'Smartforge::add_key failed. Table \'exp_comments\' does not exist.', 'Smartforge::add_key', 106, '/var/www/html/system/ee/ExpressionEngine/Addons/comment/upd.comment.php'),
(2, 1665070903, 'Smartforge::add_key failed. Table \'exp_dock_prolets\' does not exist.', 'Smartforge::add_key', 202, '/var/www/html/system/ee/ExpressionEngine/Addons/pro/upd.pro.php');

-- --------------------------------------------------------

--
-- Структура таблицы `exp_upload_prefs`
--

CREATE TABLE `exp_upload_prefs` (
  `id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adapter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `adapter_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `server_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_types` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `allow_subfolders` enum('y','n') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `subfolders_on_top` enum('y','n') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `default_modal_view` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `adapter`, `adapter_settings`, `server_path`, `url`, `allowed_types`, `allow_subfolders`, `subfolders_on_top`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`) VALUES
(1, 1, 'Avatars', 'local', NULL, '{base_path}images/avatars/', '{base_url}images/avatars/', 'img', 'n', 'y', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 1, 'Signature Attachments', 'local', NULL, '{base_path}images/signature_attachments/', '{base_url}images/signature_attachments/', 'img', 'n', 'y', 'list', '30', '80', '480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 1, 'PM Attachments', 'local', NULL, '{base_path}images/pm_attachments/', '{base_url}images/pm_attachments/', 'img', 'n', 'y', 'list', '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 1, 'Images', 'local', NULL, '{base_path}/images/', '{base_url}/images/', 'img', 'n', 'n', 'thumb', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `exp_upload_prefs_roles`
--

CREATE TABLE `exp_upload_prefs_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `upload_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exp_upload_prefs_roles`
--

INSERT INTO `exp_upload_prefs_roles` (`role_id`, `upload_id`) VALUES
(5, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `exp_actions`
--
ALTER TABLE `exp_actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Индексы таблицы `exp_captcha`
--
ALTER TABLE `exp_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Индексы таблицы `exp_categories`
--
ALTER TABLE `exp_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `cat_name` (`cat_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `exp_category_field_data`
--
ALTER TABLE `exp_category_field_data`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_category_posts`
--
ALTER TABLE `exp_category_posts`
  ADD PRIMARY KEY (`entry_id`,`cat_id`);

--
-- Индексы таблицы `exp_channels`
--
ALTER TABLE `exp_channels`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `cat_group` (`cat_group`(191)),
  ADD KEY `channel_name` (`channel_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_channels_channel_fields`
--
ALTER TABLE `exp_channels_channel_fields`
  ADD PRIMARY KEY (`channel_id`,`field_id`);

--
-- Индексы таблицы `exp_channels_channel_field_groups`
--
ALTER TABLE `exp_channels_channel_field_groups`
  ADD PRIMARY KEY (`channel_id`,`group_id`);

--
-- Индексы таблицы `exp_channels_statuses`
--
ALTER TABLE `exp_channels_statuses`
  ADD PRIMARY KEY (`channel_id`,`status_id`);

--
-- Индексы таблицы `exp_channel_data`
--
ALTER TABLE `exp_channel_data`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_channel_data_field_2`
--
ALTER TABLE `exp_channel_data_field_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Индексы таблицы `exp_channel_data_field_3`
--
ALTER TABLE `exp_channel_data_field_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Индексы таблицы `exp_channel_data_field_4`
--
ALTER TABLE `exp_channel_data_field_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Индексы таблицы `exp_channel_data_field_5`
--
ALTER TABLE `exp_channel_data_field_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Индексы таблицы `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_channel_entry_hidden_fields`
--
ALTER TABLE `exp_channel_entry_hidden_fields`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Индексы таблицы `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `field_type` (`field_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_channel_field_groups_fields`
--
ALTER TABLE `exp_channel_field_groups_fields`
  ADD PRIMARY KEY (`field_id`,`group_id`);

--
-- Индексы таблицы `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  ADD PRIMARY KEY (`channel_form_settings_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Индексы таблицы `exp_channel_member_roles`
--
ALTER TABLE `exp_channel_member_roles`
  ADD PRIMARY KEY (`role_id`,`channel_id`);

--
-- Индексы таблицы `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`);

--
-- Индексы таблицы `exp_comments`
--
ALTER TABLE `exp_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `entry_id_channel_id_author_id_status_site_id` (`entry_id`,`channel_id`,`author_id`,`status`,`site_id`);

--
-- Индексы таблицы `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `entry_id_member_id` (`entry_id`,`member_id`);

--
-- Индексы таблицы `exp_config`
--
ALTER TABLE `exp_config`
  ADD PRIMARY KEY (`config_id`),
  ADD KEY `site_key` (`site_id`,`key`);

--
-- Индексы таблицы `exp_consents`
--
ALTER TABLE `exp_consents`
  ADD PRIMARY KEY (`consent_id`),
  ADD KEY `consent_request_version_id` (`consent_request_version_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Индексы таблицы `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  ADD PRIMARY KEY (`consent_audit_id`),
  ADD KEY `consent_request_id` (`consent_request_id`),
  ADD KEY `consent_request_version_id` (`consent_request_version_id`);

--
-- Индексы таблицы `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  ADD PRIMARY KEY (`consent_request_id`);

--
-- Индексы таблицы `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  ADD PRIMARY KEY (`consent_request_version_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

--
-- Индексы таблицы `exp_consent_request_version_cookies`
--
ALTER TABLE `exp_consent_request_version_cookies`
  ADD KEY `consent_request_version_cookies` (`consent_request_version_id`,`cookie_id`);

--
-- Индексы таблицы `exp_content_types`
--
ALTER TABLE `exp_content_types`
  ADD PRIMARY KEY (`content_type_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `exp_cookie_settings`
--
ALTER TABLE `exp_cookie_settings`
  ADD PRIMARY KEY (`cookie_id`);

--
-- Индексы таблицы `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_dashboard_layouts`
--
ALTER TABLE `exp_dashboard_layouts`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Индексы таблицы `exp_dashboard_layout_widgets`
--
ALTER TABLE `exp_dashboard_layout_widgets`
  ADD KEY `layouts_widgets` (`layout_id`,`widget_id`);

--
-- Индексы таблицы `exp_dashboard_widgets`
--
ALTER TABLE `exp_dashboard_widgets`
  ADD PRIMARY KEY (`widget_id`);

--
-- Индексы таблицы `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Индексы таблицы `exp_docks`
--
ALTER TABLE `exp_docks`
  ADD PRIMARY KEY (`dock_id`);

--
-- Индексы таблицы `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Индексы таблицы `exp_email_cache_mg`
--
ALTER TABLE `exp_email_cache_mg`
  ADD PRIMARY KEY (`cache_id`,`role_id`);

--
-- Индексы таблицы `exp_email_cache_ml`
--
ALTER TABLE `exp_email_cache_ml`
  ADD PRIMARY KEY (`cache_id`,`list_id`);

--
-- Индексы таблицы `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Индексы таблицы `exp_entry_manager_views`
--
ALTER TABLE `exp_entry_manager_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `channel_id_member_id` (`channel_id`,`member_id`);

--
-- Индексы таблицы `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Индексы таблицы `exp_extensions`
--
ALTER TABLE `exp_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Индексы таблицы `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  ADD PRIMARY KEY (`fieldtype_id`);

--
-- Индексы таблицы `exp_field_conditions`
--
ALTER TABLE `exp_field_conditions`
  ADD PRIMARY KEY (`condition_id`),
  ADD KEY `condition_set_id` (`condition_set_id`),
  ADD KEY `condition_field_id` (`condition_field_id`);

--
-- Индексы таблицы `exp_field_condition_sets`
--
ALTER TABLE `exp_field_condition_sets`
  ADD PRIMARY KEY (`condition_set_id`);

--
-- Индексы таблицы `exp_field_condition_sets_channel_fields`
--
ALTER TABLE `exp_field_condition_sets_channel_fields`
  ADD PRIMARY KEY (`condition_set_id`,`field_id`);

--
-- Индексы таблицы `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_files`
--
ALTER TABLE `exp_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `model_type` (`model_type`),
  ADD KEY `upload_location_id` (`upload_location_id`),
  ADD KEY `directory_id` (`directory_id`),
  ADD KEY `file_type` (`file_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_file_categories`
--
ALTER TABLE `exp_file_categories`
  ADD PRIMARY KEY (`file_id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `exp_file_data`
--
ALTER TABLE `exp_file_data`
  ADD PRIMARY KEY (`file_id`);

--
-- Индексы таблицы `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_location_id` (`upload_location_id`);

--
-- Индексы таблицы `exp_file_manager_views`
--
ALTER TABLE `exp_file_manager_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `viewtype_upload_id_member_id` (`viewtype`,`upload_id`,`member_id`);

--
-- Индексы таблицы `exp_file_usage`
--
ALTER TABLE `exp_file_usage`
  ADD KEY `file_id` (`file_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  ADD PRIMARY KEY (`wm_id`);

--
-- Индексы таблицы `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`);

--
-- Индексы таблицы `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  ADD PRIMARY KEY (`variable_id`),
  ADD KEY `variable_name` (`variable_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Индексы таблицы `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Индексы таблицы `exp_layout_publish_member_roles`
--
ALTER TABLE `exp_layout_publish_member_roles`
  ADD PRIMARY KEY (`layout_id`,`role_id`);

--
-- Индексы таблицы `exp_members`
--
ALTER TABLE `exp_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `password` (`password`);

--
-- Индексы таблицы `exp_members_roles`
--
ALTER TABLE `exp_members_roles`
  ADD PRIMARY KEY (`member_id`,`role_id`);

--
-- Индексы таблицы `exp_members_role_groups`
--
ALTER TABLE `exp_members_role_groups`
  ADD PRIMARY KEY (`member_id`,`group_id`);

--
-- Индексы таблицы `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  ADD PRIMARY KEY (`bulletin_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `hash` (`hash`);

--
-- Индексы таблицы `exp_member_data`
--
ALTER TABLE `exp_member_data`
  ADD PRIMARY KEY (`member_id`);

--
-- Индексы таблицы `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  ADD PRIMARY KEY (`m_field_id`);

--
-- Индексы таблицы `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Индексы таблицы `exp_member_search`
--
ALTER TABLE `exp_member_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Индексы таблицы `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  ADD PRIMARY KEY (`set_id`);

--
-- Индексы таблицы `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Индексы таблицы `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Индексы таблицы `exp_message_data`
--
ALTER TABLE `exp_message_data`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Индексы таблицы `exp_message_folders`
--
ALTER TABLE `exp_message_folders`
  ADD PRIMARY KEY (`member_id`);

--
-- Индексы таблицы `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  ADD PRIMARY KEY (`listed_id`);

--
-- Индексы таблицы `exp_migrations`
--
ALTER TABLE `exp_migrations`
  ADD PRIMARY KEY (`migration_id`);

--
-- Индексы таблицы `exp_modules`
--
ALTER TABLE `exp_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `exp_module_member_roles`
--
ALTER TABLE `exp_module_member_roles`
  ADD PRIMARY KEY (`role_id`,`module_id`);

--
-- Индексы таблицы `exp_online_users`
--
ALTER TABLE `exp_online_users`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `date` (`date`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  ADD PRIMARY KEY (`lockout_id`),
  ADD KEY `login_date` (`login_date`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `user_agent` (`user_agent`);

--
-- Индексы таблицы `exp_permissions`
--
ALTER TABLE `exp_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `role_id_site_id` (`role_id`,`site_id`);

--
-- Индексы таблицы `exp_plugins`
--
ALTER TABLE `exp_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Индексы таблицы `exp_prolets`
--
ALTER TABLE `exp_prolets`
  ADD PRIMARY KEY (`prolet_id`);

--
-- Индексы таблицы `exp_relationships`
--
ALTER TABLE `exp_relationships`
  ADD PRIMARY KEY (`relationship_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `fluid_field_data_id` (`fluid_field_data_id`),
  ADD KEY `grid_row_id` (`grid_row_id`);

--
-- Индексы таблицы `exp_remember_me`
--
ALTER TABLE `exp_remember_me`
  ADD PRIMARY KEY (`remember_me_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Индексы таблицы `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  ADD PRIMARY KEY (`reset_id`);

--
-- Индексы таблицы `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  ADD PRIMARY KEY (`tracker_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Индексы таблицы `exp_roles`
--
ALTER TABLE `exp_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `exp_roles_role_groups`
--
ALTER TABLE `exp_roles_role_groups`
  ADD PRIMARY KEY (`role_id`,`group_id`);

--
-- Индексы таблицы `exp_role_groups`
--
ALTER TABLE `exp_role_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Индексы таблицы `exp_role_settings`
--
ALTER TABLE `exp_role_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id_site_id` (`role_id`,`site_id`);

--
-- Индексы таблицы `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  ADD PRIMARY KEY (`toolset_id`);

--
-- Индексы таблицы `exp_search`
--
ALTER TABLE `exp_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_search_log`
--
ALTER TABLE `exp_search_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  ADD PRIMARY KEY (`hash_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Индексы таблицы `exp_sessions`
--
ALTER TABLE `exp_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Индексы таблицы `exp_sites`
--
ALTER TABLE `exp_sites`
  ADD PRIMARY KEY (`site_id`),
  ADD KEY `site_name` (`site_name`);

--
-- Индексы таблицы `exp_snippets`
--
ALTER TABLE `exp_snippets`
  ADD PRIMARY KEY (`snippet_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_stats`
--
ALTER TABLE `exp_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_statuses`
--
ALTER TABLE `exp_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Индексы таблицы `exp_statuses_roles`
--
ALTER TABLE `exp_statuses_roles`
  ADD PRIMARY KEY (`status_id`,`role_id`);

--
-- Индексы таблицы `exp_structure`
--
ALTER TABLE `exp_structure`
  ADD PRIMARY KEY (`entry_id`);

--
-- Индексы таблицы `exp_structure_channels`
--
ALTER TABLE `exp_structure_channels`
  ADD PRIMARY KEY (`site_id`,`channel_id`);

--
-- Индексы таблицы `exp_structure_listings`
--
ALTER TABLE `exp_structure_listings`
  ADD PRIMARY KEY (`entry_id`);

--
-- Индексы таблицы `exp_structure_members`
--
ALTER TABLE `exp_structure_members`
  ADD PRIMARY KEY (`site_id`,`member_id`);

--
-- Индексы таблицы `exp_structure_nav_history`
--
ALTER TABLE `exp_structure_nav_history`
  ADD PRIMARY KEY (`id`,`site_id`);

--
-- Индексы таблицы `exp_structure_settings`
--
ALTER TABLE `exp_structure_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exp_templates`
--
ALTER TABLE `exp_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_templates_roles`
--
ALTER TABLE `exp_templates_roles`
  ADD PRIMARY KEY (`template_id`,`role_id`);

--
-- Индексы таблицы `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_name_idx` (`group_name`),
  ADD KEY `group_order_idx` (`group_order`);

--
-- Индексы таблицы `exp_template_groups_roles`
--
ALTER TABLE `exp_template_groups_roles`
  ADD PRIMARY KEY (`role_id`,`template_group_id`);

--
-- Индексы таблицы `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Индексы таблицы `exp_throttle`
--
ALTER TABLE `exp_throttle`
  ADD PRIMARY KEY (`throttle_id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `last_activity` (`last_activity`);

--
-- Индексы таблицы `exp_update_log`
--
ALTER TABLE `exp_update_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Индексы таблицы `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `exp_upload_prefs_roles`
--
ALTER TABLE `exp_upload_prefs_roles`
  ADD PRIMARY KEY (`upload_id`,`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `exp_actions`
--
ALTER TABLE `exp_actions`
  MODIFY `action_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `exp_captcha`
--
ALTER TABLE `exp_captcha`
  MODIFY `captcha_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_categories`
--
ALTER TABLE `exp_categories`
  MODIFY `cat_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  MODIFY `field_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_channels`
--
ALTER TABLE `exp_channels`
  MODIFY `channel_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `exp_channel_data_field_2`
--
ALTER TABLE `exp_channel_data_field_2`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `exp_channel_data_field_3`
--
ALTER TABLE `exp_channel_data_field_3`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `exp_channel_data_field_4`
--
ALTER TABLE `exp_channel_data_field_4`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `exp_channel_data_field_5`
--
ALTER TABLE `exp_channel_data_field_5`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  MODIFY `entry_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  MODIFY `field_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  MODIFY `channel_form_settings_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  MODIFY `entry_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `exp_comments`
--
ALTER TABLE `exp_comments`
  MODIFY `comment_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  MODIFY `subscription_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_config`
--
ALTER TABLE `exp_config`
  MODIFY `config_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT для таблицы `exp_consents`
--
ALTER TABLE `exp_consents`
  MODIFY `consent_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  MODIFY `consent_audit_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  MODIFY `consent_request_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  MODIFY `consent_request_version_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `exp_content_types`
--
ALTER TABLE `exp_content_types`
  MODIFY `content_type_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `exp_cookie_settings`
--
ALTER TABLE `exp_cookie_settings`
  MODIFY `cookie_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `exp_dashboard_layouts`
--
ALTER TABLE `exp_dashboard_layouts`
  MODIFY `layout_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_dashboard_widgets`
--
ALTER TABLE `exp_dashboard_widgets`
  MODIFY `widget_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_docks`
--
ALTER TABLE `exp_docks`
  MODIFY `dock_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  MODIFY `cache_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  MODIFY `cache_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_entry_manager_views`
--
ALTER TABLE `exp_entry_manager_views`
  MODIFY `view_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_extensions`
--
ALTER TABLE `exp_extensions`
  MODIFY `extension_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  MODIFY `fieldtype_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `exp_field_conditions`
--
ALTER TABLE `exp_field_conditions`
  MODIFY `condition_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_field_condition_sets`
--
ALTER TABLE `exp_field_condition_sets`
  MODIFY `condition_set_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_files`
--
ALTER TABLE `exp_files`
  MODIFY `file_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_file_manager_views`
--
ALTER TABLE `exp_file_manager_views`
  MODIFY `view_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  MODIFY `wm_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  MODIFY `variable_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  MODIFY `col_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  MODIFY `layout_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_members`
--
ALTER TABLE `exp_members`
  MODIFY `member_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  MODIFY `bulletin_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  MODIFY `m_field_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  MODIFY `news_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  MODIFY `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  MODIFY `set_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  MODIFY `attachment_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  MODIFY `copy_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_message_data`
--
ALTER TABLE `exp_message_data`
  MODIFY `message_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  MODIFY `listed_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_migrations`
--
ALTER TABLE `exp_migrations`
  MODIFY `migration_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_modules`
--
ALTER TABLE `exp_modules`
  MODIFY `module_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `exp_online_users`
--
ALTER TABLE `exp_online_users`
  MODIFY `online_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  MODIFY `lockout_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `exp_permissions`
--
ALTER TABLE `exp_permissions`
  MODIFY `permission_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT для таблицы `exp_plugins`
--
ALTER TABLE `exp_plugins`
  MODIFY `plugin_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `exp_prolets`
--
ALTER TABLE `exp_prolets`
  MODIFY `prolet_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `exp_relationships`
--
ALTER TABLE `exp_relationships`
  MODIFY `relationship_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  MODIFY `reset_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  MODIFY `tracker_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_roles`
--
ALTER TABLE `exp_roles`
  MODIFY `role_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `exp_role_groups`
--
ALTER TABLE `exp_role_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_role_settings`
--
ALTER TABLE `exp_role_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  MODIFY `toolset_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `exp_search_log`
--
ALTER TABLE `exp_search_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  MODIFY `hash_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `exp_sites`
--
ALTER TABLE `exp_sites`
  MODIFY `site_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_snippets`
--
ALTER TABLE `exp_snippets`
  MODIFY `snippet_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  MODIFY `template_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `exp_stats`
--
ALTER TABLE `exp_stats`
  MODIFY `stat_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `exp_statuses`
--
ALTER TABLE `exp_statuses`
  MODIFY `status_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `exp_structure_nav_history`
--
ALTER TABLE `exp_structure_nav_history`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблицы `exp_structure_settings`
--
ALTER TABLE `exp_structure_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `exp_templates`
--
ALTER TABLE `exp_templates`
  MODIFY `template_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  MODIFY `route_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_throttle`
--
ALTER TABLE `exp_throttle`
  MODIFY `throttle_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exp_update_log`
--
ALTER TABLE `exp_update_log`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
