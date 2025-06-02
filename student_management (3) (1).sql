-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2025 at 01:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `student_id` int(11) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `admin_id`, `action_type`, `description`, `created_at`, `student_id`, `action`) VALUES
(1, NULL, NULL, 'Added fee for March', '2025-05-20 10:43:54', 177, 'Fee Added'),
(2, 1, NULL, 'Fee added for September (Status: paid)', '2025-05-26 09:58:09', 211, 'Fee Added'),
(3, 1, NULL, 'Updated online result with 700 marks (A+)', '2025-05-26 10:42:13', 168, 'Result Updated'),
(4, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-26 10:53:00', 168, 'Result Updated'),
(5, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 10:53:00', 169, 'Result Updated'),
(6, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 10:53:00', 173, 'Result Updated'),
(7, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 10:53:00', 170, 'Result Updated'),
(8, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 10:53:00', 175, 'Result Updated'),
(9, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 10:53:00', 167, 'Result Updated'),
(10, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 10:53:00', 174, 'Result Updated'),
(11, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 10:53:00', 172, 'Result Updated'),
(12, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 10:53:00', 171, 'Result Updated'),
(13, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 10:53:00', 166, 'Result Updated'),
(14, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-26 22:34:18', 168, 'Result Updated'),
(15, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:34:18', 169, 'Result Updated'),
(16, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:34:18', 173, 'Result Updated'),
(17, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:34:18', 170, 'Result Updated'),
(18, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:34:18', 175, 'Result Updated'),
(19, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:34:18', 167, 'Result Updated'),
(20, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:34:18', 174, 'Result Updated'),
(21, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:34:18', 172, 'Result Updated'),
(22, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:34:18', 171, 'Result Updated'),
(23, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:34:18', 166, 'Result Updated'),
(24, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-26 22:41:10', 168, 'Result Updated'),
(25, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:41:10', 169, 'Result Updated'),
(26, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:41:10', 173, 'Result Updated'),
(27, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:41:10', 170, 'Result Updated'),
(28, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:41:10', 175, 'Result Updated'),
(29, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:41:10', 167, 'Result Updated'),
(30, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:41:10', 174, 'Result Updated'),
(31, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:41:10', 172, 'Result Updated'),
(32, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:41:10', 171, 'Result Updated'),
(33, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:41:10', 166, 'Result Updated'),
(34, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-26 22:42:10', 168, 'Result Updated'),
(35, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:42:10', 169, 'Result Updated'),
(36, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:42:10', 173, 'Result Updated'),
(37, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:42:10', 170, 'Result Updated'),
(38, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:42:10', 175, 'Result Updated'),
(39, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:42:10', 167, 'Result Updated'),
(40, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:42:10', 174, 'Result Updated'),
(41, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:42:10', 172, 'Result Updated'),
(42, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:42:10', 171, 'Result Updated'),
(43, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:42:10', 166, 'Result Updated'),
(44, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-26 22:42:15', 168, 'Result Updated'),
(45, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:42:15', 169, 'Result Updated'),
(46, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:42:15', 173, 'Result Updated'),
(47, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:42:15', 170, 'Result Updated'),
(48, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:42:15', 175, 'Result Updated'),
(49, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:42:15', 167, 'Result Updated'),
(50, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:42:15', 174, 'Result Updated'),
(51, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:42:15', 172, 'Result Updated'),
(52, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:42:15', 171, 'Result Updated'),
(53, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:42:15', 166, 'Result Updated'),
(54, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:45:17', 168, 'Result Updated'),
(55, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:45:52', 168, 'Result Updated'),
(56, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:45:52', 169, 'Result Updated'),
(57, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:45:52', 173, 'Result Updated'),
(58, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:45:52', 170, 'Result Updated'),
(59, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:45:52', 175, 'Result Updated'),
(60, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:45:52', 167, 'Result Updated'),
(61, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:45:52', 174, 'Result Updated'),
(62, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:45:52', 172, 'Result Updated'),
(63, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:45:52', 171, 'Result Updated'),
(64, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:45:52', 166, 'Result Updated'),
(65, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:46:28', 168, 'Result Updated'),
(66, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:46:28', 169, 'Result Updated'),
(67, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:46:28', 173, 'Result Updated'),
(68, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:46:28', 170, 'Result Updated'),
(69, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:46:28', 175, 'Result Updated'),
(70, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:46:28', 167, 'Result Updated'),
(71, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:46:28', 174, 'Result Updated'),
(72, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:46:28', 172, 'Result Updated'),
(73, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:46:28', 171, 'Result Updated'),
(74, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:46:28', 166, 'Result Updated'),
(75, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:46:30', 168, 'Result Updated'),
(76, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:46:30', 169, 'Result Updated'),
(77, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:46:30', 173, 'Result Updated'),
(78, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:46:30', 170, 'Result Updated'),
(79, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:46:30', 175, 'Result Updated'),
(80, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:46:30', 167, 'Result Updated'),
(81, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:46:30', 174, 'Result Updated'),
(82, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:46:30', 172, 'Result Updated'),
(83, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:46:30', 171, 'Result Updated'),
(84, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:46:30', 166, 'Result Updated'),
(85, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:26', 168, 'Result Updated'),
(86, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:26', 169, 'Result Updated'),
(87, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:26', 173, 'Result Updated'),
(88, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:26', 170, 'Result Updated'),
(89, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:26', 175, 'Result Updated'),
(90, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:26', 167, 'Result Updated'),
(91, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:26', 174, 'Result Updated'),
(92, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:26', 172, 'Result Updated'),
(93, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:26', 171, 'Result Updated'),
(94, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:26', 166, 'Result Updated'),
(95, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:29', 168, 'Result Updated'),
(96, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:29', 169, 'Result Updated'),
(97, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:29', 173, 'Result Updated'),
(98, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:29', 170, 'Result Updated'),
(99, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:29', 175, 'Result Updated'),
(100, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:29', 167, 'Result Updated'),
(101, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:29', 174, 'Result Updated'),
(102, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:29', 172, 'Result Updated'),
(103, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:29', 171, 'Result Updated'),
(104, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:29', 166, 'Result Updated'),
(105, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:31', 168, 'Result Updated'),
(106, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:31', 169, 'Result Updated'),
(107, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:31', 173, 'Result Updated'),
(108, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:31', 170, 'Result Updated'),
(109, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:31', 175, 'Result Updated'),
(110, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:31', 167, 'Result Updated'),
(111, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:31', 174, 'Result Updated'),
(112, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:31', 172, 'Result Updated'),
(113, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:31', 171, 'Result Updated'),
(114, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:31', 166, 'Result Updated'),
(115, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:32', 168, 'Result Updated'),
(116, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:32', 169, 'Result Updated'),
(117, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:32', 173, 'Result Updated'),
(118, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:32', 170, 'Result Updated'),
(119, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:32', 175, 'Result Updated'),
(120, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:32', 167, 'Result Updated'),
(121, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:32', 174, 'Result Updated'),
(122, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:32', 172, 'Result Updated'),
(123, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:32', 171, 'Result Updated'),
(124, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:32', 166, 'Result Updated'),
(125, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:32', 168, 'Result Updated'),
(126, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:32', 169, 'Result Updated'),
(127, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:32', 173, 'Result Updated'),
(128, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:32', 170, 'Result Updated'),
(129, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:32', 175, 'Result Updated'),
(130, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:32', 167, 'Result Updated'),
(131, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:32', 174, 'Result Updated'),
(132, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:32', 172, 'Result Updated'),
(133, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:32', 171, 'Result Updated'),
(134, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:32', 166, 'Result Updated'),
(135, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:32', 168, 'Result Updated'),
(136, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:32', 169, 'Result Updated'),
(137, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:32', 173, 'Result Updated'),
(138, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:32', 170, 'Result Updated'),
(139, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:32', 175, 'Result Updated'),
(140, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:32', 167, 'Result Updated'),
(141, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:32', 174, 'Result Updated'),
(142, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:32', 172, 'Result Updated'),
(143, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:32', 171, 'Result Updated'),
(144, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:32', 166, 'Result Updated'),
(145, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:33', 168, 'Result Updated'),
(146, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:33', 169, 'Result Updated'),
(147, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:33', 173, 'Result Updated'),
(148, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:33', 170, 'Result Updated'),
(149, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:33', 175, 'Result Updated'),
(150, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:33', 167, 'Result Updated'),
(151, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:33', 174, 'Result Updated'),
(152, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:33', 172, 'Result Updated'),
(153, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:33', 171, 'Result Updated'),
(154, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:33', 166, 'Result Updated'),
(155, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:55:33', 168, 'Result Updated'),
(156, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:55:33', 169, 'Result Updated'),
(157, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:33', 173, 'Result Updated'),
(158, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:55:33', 170, 'Result Updated'),
(159, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:55:33', 175, 'Result Updated'),
(160, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:55:33', 167, 'Result Updated'),
(161, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:55:33', 174, 'Result Updated'),
(162, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:55:33', 172, 'Result Updated'),
(163, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:55:33', 171, 'Result Updated'),
(164, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:55:34', 166, 'Result Updated'),
(165, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:57:20', 168, 'Result Updated'),
(166, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:57:20', 169, 'Result Updated'),
(167, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:57:20', 173, 'Result Updated'),
(168, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:57:20', 170, 'Result Updated'),
(169, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:57:20', 175, 'Result Updated'),
(170, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:57:20', 167, 'Result Updated'),
(171, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:57:20', 174, 'Result Updated'),
(172, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:57:20', 172, 'Result Updated'),
(173, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:57:20', 171, 'Result Updated'),
(174, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:57:20', 166, 'Result Updated'),
(175, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 22:57:26', 168, 'Result Updated'),
(176, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 22:57:26', 169, 'Result Updated'),
(177, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:57:26', 173, 'Result Updated'),
(178, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 22:57:26', 170, 'Result Updated'),
(179, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 22:57:26', 175, 'Result Updated'),
(180, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:57:26', 167, 'Result Updated'),
(181, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 22:57:26', 174, 'Result Updated'),
(182, 1, NULL, 'Updated online result for January with 100 marks (F)', '2025-05-26 22:57:26', 172, 'Result Updated'),
(183, 1, NULL, 'Updated online result for January with 50 marks (F)', '2025-05-26 22:57:26', 171, 'Result Updated'),
(184, 1, NULL, 'Updated online result for January with 29 marks (F)', '2025-05-26 22:57:26', 166, 'Result Updated'),
(185, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 22:59:57', 166, 'Result Updated'),
(186, 1, NULL, 'Deleted result for January', '2025-05-26 23:03:57', 166, 'Result Deleted'),
(187, 1, NULL, 'Deleted result for January', '2025-05-26 23:09:30', 171, 'Result Deleted'),
(188, 1, NULL, 'Deleted result for January', '2025-05-26 23:12:16', 172, 'Result Deleted'),
(189, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-26 23:47:45', 168, 'Result Updated'),
(190, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-26 23:47:45', 169, 'Result Updated'),
(191, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 23:47:45', 173, 'Result Updated'),
(192, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 23:47:45', 170, 'Result Updated'),
(193, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 23:47:45', 175, 'Result Updated'),
(194, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-26 23:47:45', 167, 'Result Updated'),
(195, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-26 23:47:45', 174, 'Result Updated'),
(196, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-26 23:47:45', 172, 'Result Updated'),
(197, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-26 23:47:45', 171, 'Result Updated'),
(198, 1, NULL, 'Updated online result for January with 700 marks (A+)', '2025-05-26 23:47:45', 166, 'Result Updated'),
(199, 1, NULL, 'Deleted result for January', '2025-05-26 23:47:55', 166, 'Result Deleted'),
(200, 1, NULL, 'Deleted result for January', '2025-05-26 23:54:11', 171, 'Result Deleted'),
(201, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-27 00:01:36', 168, 'Result Updated'),
(202, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:01:36', 169, 'Result Updated'),
(203, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:01:36', 173, 'Result Updated'),
(204, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:01:36', 170, 'Result Updated'),
(205, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:01:36', 175, 'Result Updated'),
(206, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:01:36', 167, 'Result Updated'),
(207, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:01:36', 174, 'Result Updated'),
(208, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:01:36', 172, 'Result Updated'),
(209, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:01:36', 171, 'Result Updated'),
(210, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:01:36', 166, 'Result Updated'),
(211, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-27 00:01:41', 168, 'Result Updated'),
(212, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-27 00:02:37', 168, 'Result Updated'),
(213, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:02:37', 169, 'Result Updated'),
(214, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:02:37', 173, 'Result Updated'),
(215, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:02:37', 170, 'Result Updated'),
(216, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:02:37', 175, 'Result Updated'),
(217, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:02:37', 167, 'Result Updated'),
(218, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:02:37', 174, 'Result Updated'),
(219, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:02:37', 172, 'Result Updated'),
(220, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:02:37', 171, 'Result Updated'),
(221, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:02:37', 166, 'Result Updated'),
(222, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-27 00:02:52', 168, 'Result Updated'),
(223, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:02:52', 169, 'Result Updated'),
(224, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:02:52', 173, 'Result Updated'),
(225, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:02:52', 170, 'Result Updated'),
(226, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:02:52', 175, 'Result Updated'),
(227, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:02:52', 167, 'Result Updated'),
(228, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:02:52', 174, 'Result Updated'),
(229, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:02:52', 172, 'Result Updated'),
(230, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:02:52', 171, 'Result Updated'),
(231, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:02:52', 166, 'Result Updated'),
(232, 1, NULL, 'Updated physical result for January with 200 marks (F)', '2025-05-27 00:07:22', 168, 'Result Updated'),
(233, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:07:22', 169, 'Result Updated'),
(234, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:07:22', 173, 'Result Updated'),
(235, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:07:22', 170, 'Result Updated'),
(236, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:07:22', 175, 'Result Updated'),
(237, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:07:22', 167, 'Result Updated'),
(238, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:07:22', 174, 'Result Updated'),
(239, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:07:22', 172, 'Result Updated'),
(240, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:07:22', 171, 'Result Updated'),
(241, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:07:22', 166, 'Result Updated'),
(242, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:07:46', 168, 'Result Updated'),
(243, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:07:58', 168, 'Result Updated'),
(244, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:07:58', 169, 'Result Updated'),
(245, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:07:58', 173, 'Result Updated'),
(246, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:07:58', 170, 'Result Updated'),
(247, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:07:58', 175, 'Result Updated'),
(248, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:07:58', 167, 'Result Updated'),
(249, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:07:58', 174, 'Result Updated'),
(250, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:07:58', 172, 'Result Updated'),
(251, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:07:58', 171, 'Result Updated'),
(252, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:07:58', 166, 'Result Updated'),
(253, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:03', 168, 'Result Updated'),
(254, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:03', 169, 'Result Updated'),
(255, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:03', 173, 'Result Updated'),
(256, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:03', 170, 'Result Updated'),
(257, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:17:03', 175, 'Result Updated'),
(258, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:03', 167, 'Result Updated'),
(259, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:17:03', 174, 'Result Updated'),
(260, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:03', 172, 'Result Updated'),
(261, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:03', 171, 'Result Updated'),
(262, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:03', 166, 'Result Updated'),
(263, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:06', 168, 'Result Updated'),
(264, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:06', 169, 'Result Updated'),
(265, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:06', 173, 'Result Updated'),
(266, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:06', 170, 'Result Updated'),
(267, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:17:06', 175, 'Result Updated'),
(268, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:06', 167, 'Result Updated'),
(269, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:17:06', 174, 'Result Updated'),
(270, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:06', 172, 'Result Updated'),
(271, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:06', 171, 'Result Updated'),
(272, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:06', 166, 'Result Updated'),
(273, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:07', 168, 'Result Updated'),
(274, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:07', 169, 'Result Updated'),
(275, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:07', 173, 'Result Updated'),
(276, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:07', 170, 'Result Updated'),
(277, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:17:07', 175, 'Result Updated'),
(278, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:07', 167, 'Result Updated'),
(279, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:17:07', 174, 'Result Updated'),
(280, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:07', 172, 'Result Updated'),
(281, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:07', 171, 'Result Updated'),
(282, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:07', 166, 'Result Updated'),
(283, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:07', 168, 'Result Updated'),
(284, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:07', 169, 'Result Updated'),
(285, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:07', 173, 'Result Updated'),
(286, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:07', 170, 'Result Updated'),
(287, 1, NULL, 'Updated online result for January with 600 marks (A)', '2025-05-27 00:17:07', 175, 'Result Updated'),
(288, 1, NULL, 'Updated online result for January with 400 marks (D)', '2025-05-27 00:17:07', 167, 'Result Updated'),
(289, 1, NULL, 'Updated online result for January with 455 marks (C)', '2025-05-27 00:17:07', 174, 'Result Updated'),
(290, 1, NULL, 'Updated online result for January with 500 marks (B)', '2025-05-27 00:17:07', 172, 'Result Updated'),
(291, 1, NULL, 'Updated online result for January with 200 marks (F)', '2025-05-27 00:17:07', 171, 'Result Updated'),
(292, 1, NULL, 'Updated online result for January with 300 marks (F)', '2025-05-27 00:17:07', 166, 'Result Updated'),
(293, 1, NULL, 'Updated online result for January with 0 marks (F)', '2025-05-27 00:17:30', 168, 'Result Updated');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(50) DEFAULT 'full'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`, `role`) VALUES
(1, 'admin1', '$2y$10$TGcyavSMaTRWM44cDF8.Ru2mtc2.ocA0lazbgdEU9Ti/bSU8vR.k6', '2025-04-09 18:22:27', 'full'),
(2, 'admin2', '$2y$10$TGcyavSMaTRWM44cDF8.Ru2mtc2.ocA0lazbgdEU9Ti/bSU8vR.k6', '2025-05-26 06:59:31', 'full'),
(3, 'admin3', '$2y$10$TGcyavSMaTRWM44cDF8.Ru2mtc2.ocA0lazbgdEU9Ti/bSU8vR.k6', '2025-05-26 23:22:10', 'attendance');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `attendance_date`, `status`, `created_at`) VALUES
(1, 168, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(2, 169, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(3, 173, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(4, 170, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(5, 175, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(6, 167, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(7, 174, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(8, 172, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(9, 171, '2025-05-27', 'Present', '2025-05-26 22:35:12'),
(10, 166, '2025-05-27', 'Present', '2025-05-26 22:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `month` varchar(20) DEFAULT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `status` enum('paid','unpaid') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `student_id`, `month`, `total_fee`, `amount_paid`, `status`, `created_at`) VALUES
(17, 168, 'February', 5000.00, 5000.00, 'paid', '2025-05-20 09:57:53'),
(18, 176, 'January', 5000.00, 0.00, 'unpaid', '2025-05-20 10:36:47'),
(20, 211, 'September', 5000.00, 5000.00, 'paid', '2025-05-26 09:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `max_marks` decimal(5,2) NOT NULL,
  `exam_type` varchar(50) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `month` varchar(20) DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `student_id`, `subject`, `marks_obtained`, `percentage`, `max_marks`, `exam_type`, `grade`, `remarks`, `created_at`, `month`) VALUES
(34, 181, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(35, 178, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(36, 185, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(37, 177, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(38, 180, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(39, 194, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(40, 191, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(41, 188, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(42, 192, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(43, 186, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(44, 193, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(45, 195, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(46, 187, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(47, 190, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(48, 189, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(49, 198, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(50, 204, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(51, 202, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(52, 199, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(53, 203, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(54, 197, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(55, 196, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(56, 200, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(57, 205, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(58, 201, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(59, 207, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(60, 215, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(61, 214, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(62, 210, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(63, 211, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(64, 209, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(65, 208, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(66, 213, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(67, 206, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(68, 212, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(69, 222, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(70, 221, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(71, 224, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(72, 218, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(73, 225, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(74, 216, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(75, 217, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(76, 223, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(77, 220, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(78, 219, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(79, 226, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(80, 233, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(81, 234, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(82, 227, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(83, 229, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(84, 230, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(85, 228, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(86, 235, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(87, 232, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(88, 231, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(89, 239, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(90, 240, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(91, 243, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(92, 237, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(93, 245, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(94, 236, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(95, 242, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(96, 238, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(97, 241, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(98, 244, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(99, 252, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(100, 246, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(101, 249, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(102, 253, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(103, 255, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(104, 251, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(105, 247, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(106, 250, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(107, 248, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(108, 254, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-19 07:43:47', 'General'),
(113, 175, '', 600.00, 85.71, 700.00, 'online', 'A', 'Excellent', '2025-05-26 08:53:00', 'January'),
(114, 167, '', 400.00, 57.14, 700.00, 'online', 'D', 'Average', '2025-05-26 08:53:00', 'January'),
(115, 174, '', 455.00, 65.00, 700.00, 'online', 'C', 'Good', '2025-05-26 08:53:00', 'January'),
(119, 168, '', 0.00, 0.00, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-26 20:11:03', 'January'),
(120, 169, '', 300.00, 42.86, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-26 20:34:18', 'January'),
(121, 173, '', 400.00, 57.14, 700.00, 'online', 'D', 'Average', '2025-05-26 20:34:18', 'January'),
(122, 170, '', 500.00, 71.43, 700.00, 'online', 'B', 'Very Good', '2025-05-26 20:34:18', 'January'),
(124, 172, '', 500.00, 71.43, 700.00, 'online', 'B', 'Very Good', '2025-05-26 21:47:45', 'January'),
(127, 171, '', 200.00, 28.57, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-26 22:01:36', 'January'),
(128, 166, '', 300.00, 42.86, 700.00, 'online', 'F', 'Needs Improvement', '2025-05-26 22:01:36', 'January');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `max_marks` decimal(5,2) NOT NULL,
  `exam_type` varchar(50) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_log`
--

CREATE TABLE `result_log` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `marks_obtained` decimal(6,2) DEFAULT NULL,
  `max_marks` int(11) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `exam_type` varchar(20) DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_log`
--

INSERT INTO `result_log` (`id`, `student_id`, `marks_obtained`, `max_marks`, `grade`, `remarks`, `exam_type`, `percentage`, `changed_at`, `admin_id`, `month`) VALUES
(1, 168, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-19 09:37:27', NULL, 'General'),
(2, 169, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-19 09:37:27', NULL, 'General'),
(3, 173, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-19 09:37:27', NULL, 'General'),
(4, 170, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-19 09:37:27', NULL, 'General'),
(5, 175, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-19 09:37:27', NULL, 'General'),
(6, 167, 650.00, 700, 'A+', 'Outstanding', 'online', 92.86, '2025-05-19 09:37:27', NULL, 'General'),
(7, 174, 610.00, 700, 'A', 'Excellent', 'online', 87.14, '2025-05-19 09:37:27', NULL, 'General'),
(8, 172, 550.00, 700, 'B', 'Very Good', 'online', 78.57, '2025-05-19 09:37:27', NULL, 'General'),
(9, 171, 540.00, 700, 'B', 'Very Good', 'online', 77.14, '2025-05-19 09:37:27', NULL, 'General'),
(10, 166, 340.00, 700, 'F', 'Needs Improvement', 'online', 48.57, '2025-05-19 09:37:27', NULL, 'General'),
(11, 168, 670.00, 700, 'A+', 'Outstanding', 'online', 95.71, '2025-05-19 09:43:47', NULL, 'General'),
(12, 169, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-19 09:43:47', NULL, 'General'),
(13, 173, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-19 09:43:47', NULL, 'General'),
(14, 170, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-19 09:43:47', NULL, 'General'),
(15, 175, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-19 09:43:47', NULL, 'General'),
(16, 167, 650.00, 700, 'A+', 'Outstanding', 'online', 92.86, '2025-05-19 09:43:47', NULL, 'General'),
(17, 174, 610.00, 700, 'A', 'Excellent', 'online', 87.14, '2025-05-19 09:43:47', NULL, 'General'),
(18, 172, 550.00, 700, 'B', 'Very Good', 'online', 78.57, '2025-05-19 09:43:47', NULL, 'General'),
(19, 171, 540.00, 700, 'B', 'Very Good', 'online', 77.14, '2025-05-19 09:43:47', NULL, 'General'),
(20, 166, 340.00, 700, 'F', 'Needs Improvement', 'online', 48.57, '2025-05-19 09:43:47', NULL, 'General'),
(21, 168, 669.00, 700, 'A+', 'Outstanding', 'online', 95.57, '2025-05-19 09:48:32', NULL, 'General'),
(22, 169, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-19 09:48:32', NULL, 'General'),
(23, 173, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-19 09:48:32', NULL, 'General'),
(24, 170, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-19 09:48:32', NULL, 'General'),
(25, 175, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-19 09:48:32', NULL, 'General'),
(26, 167, 650.00, 700, 'A+', 'Outstanding', 'online', 92.86, '2025-05-19 09:48:32', NULL, 'General'),
(27, 174, 610.00, 700, 'A', 'Excellent', 'online', 87.14, '2025-05-19 09:48:32', NULL, 'General'),
(28, 172, 550.00, 700, 'B', 'Very Good', 'online', 78.57, '2025-05-19 09:48:32', NULL, 'General'),
(29, 171, 540.00, 700, 'B', 'Very Good', 'online', 77.14, '2025-05-19 09:48:32', NULL, 'General'),
(30, 166, 340.00, 700, 'F', 'Needs Improvement', 'online', 48.57, '2025-05-19 09:48:32', NULL, 'General'),
(31, 179, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(32, 184, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(33, 176, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(34, 182, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(35, 183, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(36, 181, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(37, 178, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(38, 185, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(39, 177, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(40, 180, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-20 10:46:04', NULL, 'General'),
(41, 168, 669.00, 700, 'A+', 'Outstanding', 'physical', 95.57, '2025-05-26 09:20:39', NULL, 'General'),
(42, 169, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 09:20:39', NULL, 'General'),
(43, 173, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 09:20:39', NULL, 'General'),
(44, 170, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 09:20:39', NULL, 'General'),
(45, 175, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-26 09:20:39', NULL, 'General'),
(46, 167, 650.00, 700, 'A+', 'Outstanding', 'online', 92.86, '2025-05-26 09:20:39', NULL, 'General'),
(47, 174, 610.00, 700, 'A', 'Excellent', 'online', 87.14, '2025-05-26 09:20:39', NULL, 'General'),
(48, 172, 550.00, 700, 'B', 'Very Good', 'online', 78.57, '2025-05-26 09:20:39', NULL, 'General'),
(49, 171, 540.00, 700, 'B', 'Very Good', 'online', 77.14, '2025-05-26 09:20:39', NULL, 'General'),
(50, 166, 340.00, 700, 'F', 'Needs Improvement', 'online', 48.57, '2025-05-26 09:20:39', NULL, 'General'),
(51, 168, 680.00, 700, 'A+', 'Outstanding', 'physical', 97.14, '2025-05-26 09:26:41', 2, 'General'),
(52, 169, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 09:26:41', 2, 'General'),
(53, 173, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 09:26:41', 2, 'General'),
(54, 170, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 09:26:41', 2, 'General'),
(55, 175, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-26 09:26:41', 2, 'General'),
(56, 167, 650.00, 700, 'A+', 'Outstanding', 'online', 92.86, '2025-05-26 09:26:41', 2, 'General'),
(57, 174, 610.00, 700, 'A', 'Excellent', 'online', 87.14, '2025-05-26 09:26:41', 2, 'General'),
(58, 172, 550.00, 700, 'B', 'Very Good', 'online', 78.57, '2025-05-26 09:26:41', 2, 'General'),
(59, 171, 540.00, 700, 'B', 'Very Good', 'online', 77.14, '2025-05-26 09:26:41', 2, 'General'),
(60, 166, 340.00, 700, 'F', 'Needs Improvement', 'online', 48.57, '2025-05-26 09:26:41', 2, 'General'),
(61, 263, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(62, 262, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(63, 265, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(64, 257, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(65, 260, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(66, 259, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(67, 264, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(68, 256, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(69, 258, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(70, 261, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(71, 179, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(72, 184, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(73, 176, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 09:26:41', 2, 'General'),
(74, 182, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(75, 183, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(76, 181, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(77, 178, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(78, 185, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(79, 177, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(80, 180, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(81, 194, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(82, 191, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(83, 188, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(84, 192, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(85, 186, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(86, 193, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(87, 195, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(88, 187, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(89, 190, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(90, 189, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(91, 198, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(92, 204, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(93, 202, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(94, 199, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(95, 203, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(96, 197, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(97, 196, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(98, 200, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(99, 205, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(100, 201, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(101, 207, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(102, 215, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(103, 214, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(104, 210, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(105, 211, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(106, 209, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(107, 208, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(108, 213, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(109, 206, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(110, 212, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(111, 222, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(112, 221, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(113, 224, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(114, 218, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(115, 225, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(116, 216, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(117, 217, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(118, 223, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(119, 220, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(120, 219, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(121, 226, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(122, 233, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(123, 234, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(124, 227, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(125, 229, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(126, 230, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(127, 228, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(128, 235, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(129, 232, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(130, 231, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(131, 239, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(132, 240, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(133, 243, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(134, 237, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(135, 245, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(136, 236, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(137, 242, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(138, 238, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(139, 241, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(140, 244, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(141, 252, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(142, 246, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(143, 249, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(144, 253, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(145, 255, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(146, 251, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(147, 247, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(148, 250, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(149, 248, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(150, 254, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:26:41', 2, 'General'),
(151, 168, 660.00, 700, 'A+', 'Outstanding', 'online', 94.29, '2025-05-26 09:36:25', 1, 'General'),
(152, 169, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 09:36:25', 1, 'General'),
(153, 173, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 09:36:25', 1, 'General'),
(154, 170, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 09:36:25', 1, 'General'),
(155, 175, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-26 09:36:25', 1, 'General'),
(156, 167, 650.00, 700, 'A+', 'Outstanding', 'online', 92.86, '2025-05-26 09:36:25', 1, 'General'),
(157, 174, 610.00, 700, 'A', 'Excellent', 'online', 87.14, '2025-05-26 09:36:25', 1, 'General'),
(158, 172, 550.00, 700, 'B', 'Very Good', 'online', 78.57, '2025-05-26 09:36:25', 1, 'General'),
(159, 171, 540.00, 700, 'B', 'Very Good', 'online', 77.14, '2025-05-26 09:36:25', 1, 'General'),
(160, 166, 340.00, 700, 'F', 'Needs Improvement', 'online', 48.57, '2025-05-26 09:36:25', 1, 'General'),
(161, 168, 660.00, 700, 'A+', 'Outstanding', 'online', 94.29, '2025-05-26 09:36:42', 1, 'General'),
(162, 169, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 09:36:42', 1, 'General'),
(163, 173, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 09:36:42', 1, 'General'),
(164, 170, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 09:36:42', 1, 'General'),
(165, 175, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-26 09:36:42', 1, 'General'),
(166, 167, 650.00, 700, 'A+', 'Outstanding', 'online', 92.86, '2025-05-26 09:36:42', 1, 'General'),
(167, 174, 610.00, 700, 'A', 'Excellent', 'online', 87.14, '2025-05-26 09:36:42', 1, 'General'),
(168, 172, 550.00, 700, 'B', 'Very Good', 'online', 78.57, '2025-05-26 09:36:42', 1, 'General'),
(169, 171, 540.00, 700, 'B', 'Very Good', 'online', 77.14, '2025-05-26 09:36:42', 1, 'General'),
(170, 166, 340.00, 700, 'F', 'Needs Improvement', 'online', 48.57, '2025-05-26 09:36:42', 1, 'General'),
(171, 263, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(172, 262, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(173, 265, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(174, 257, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(175, 260, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(176, 259, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(177, 264, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(178, 256, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(179, 258, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(180, 261, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(181, 179, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(182, 184, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(183, 176, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 09:36:42', 1, 'General'),
(184, 182, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(185, 183, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(186, 181, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(187, 178, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(188, 185, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(189, 177, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(190, 180, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(191, 194, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(192, 191, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(193, 188, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(194, 192, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(195, 186, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(196, 193, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(197, 195, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(198, 187, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(199, 190, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(200, 189, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(201, 198, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(202, 204, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(203, 202, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(204, 199, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(205, 203, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(206, 197, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(207, 196, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(208, 200, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(209, 205, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(210, 201, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(211, 207, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(212, 215, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(213, 214, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(214, 210, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(215, 211, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(216, 209, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(217, 208, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(218, 213, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(219, 206, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(220, 212, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(221, 222, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(222, 221, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(223, 224, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(224, 218, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(225, 225, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(226, 216, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(227, 217, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(228, 223, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(229, 220, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(230, 219, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(231, 226, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(232, 233, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(233, 234, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(234, 227, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(235, 229, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(236, 230, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(237, 228, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(238, 235, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(239, 232, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(240, 231, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(241, 239, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(242, 240, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(243, 243, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(244, 237, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(245, 245, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(246, 236, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(247, 242, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(248, 238, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(249, 241, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(250, 244, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(251, 252, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(252, 246, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(253, 249, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(254, 253, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(255, 255, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(256, 251, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(257, 247, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(258, 250, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(259, 248, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(260, 254, 0.00, 700, 'F', 'Needs Improvement', 'online', 0.00, '2025-05-26 09:36:42', 1, 'General'),
(261, 168, 660.00, 700, 'A+', 'Outstanding', 'online', 94.29, '2025-05-26 10:42:13', 1, 'General'),
(262, 168, 200.00, 0, 'F', 'Needs Improvement', 'online', NULL, '2025-05-26 22:34:18', 1, 'January'),
(263, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:34:18', 1, 'January'),
(264, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:34:18', 1, 'January'),
(265, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:34:18', 1, 'January'),
(266, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:34:18', 1, 'January'),
(267, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:34:18', 1, 'January'),
(268, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:34:18', 1, 'January'),
(269, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-26 22:41:10', 1, 'January'),
(270, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:41:10', 1, 'January'),
(271, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:41:10', 1, 'January'),
(272, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:41:10', 1, 'January'),
(273, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:41:10', 1, 'January'),
(274, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:41:10', 1, 'January'),
(275, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:41:10', 1, 'January'),
(276, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:41:10', 1, 'January'),
(277, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:41:10', 1, 'January'),
(278, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:41:10', 1, 'January'),
(279, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-26 22:42:10', 1, 'January'),
(280, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:42:10', 1, 'January'),
(281, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:42:10', 1, 'January'),
(282, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:42:10', 1, 'January'),
(283, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:42:10', 1, 'January'),
(284, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:42:10', 1, 'January'),
(285, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:42:10', 1, 'January'),
(286, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:42:10', 1, 'January'),
(287, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:42:10', 1, 'January'),
(288, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:42:10', 1, 'January'),
(289, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-26 22:42:15', 1, 'January'),
(290, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:42:15', 1, 'January'),
(291, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:42:15', 1, 'January'),
(292, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:42:15', 1, 'January'),
(293, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:42:15', 1, 'January'),
(294, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:42:15', 1, 'January'),
(295, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:42:15', 1, 'January'),
(296, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:42:15', 1, 'January'),
(297, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:42:15', 1, 'January'),
(298, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:42:15', 1, 'January'),
(299, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-26 22:45:17', 1, 'January'),
(300, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:45:52', 1, 'January'),
(301, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:45:52', 1, 'January'),
(302, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:45:52', 1, 'January'),
(303, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:45:52', 1, 'January'),
(304, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:45:52', 1, 'January'),
(305, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:45:52', 1, 'January'),
(306, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:45:52', 1, 'January'),
(307, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:45:52', 1, 'January'),
(308, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:45:52', 1, 'January'),
(309, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:45:52', 1, 'January'),
(310, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:46:28', 1, 'January'),
(311, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:46:28', 1, 'January'),
(312, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:46:28', 1, 'January'),
(313, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:46:28', 1, 'January'),
(314, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:46:28', 1, 'January'),
(315, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:46:28', 1, 'January'),
(316, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:46:28', 1, 'January'),
(317, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:46:28', 1, 'January'),
(318, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:46:28', 1, 'January'),
(319, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:46:28', 1, 'January'),
(320, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:46:30', 1, 'January'),
(321, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:46:30', 1, 'January'),
(322, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:46:30', 1, 'January'),
(323, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:46:30', 1, 'January'),
(324, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:46:30', 1, 'January'),
(325, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:46:30', 1, 'January'),
(326, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:46:30', 1, 'January'),
(327, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:46:30', 1, 'January'),
(328, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:46:30', 1, 'January'),
(329, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:46:30', 1, 'January'),
(330, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:26', 1, 'January'),
(331, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:26', 1, 'January'),
(332, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:26', 1, 'January'),
(333, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:26', 1, 'January'),
(334, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:26', 1, 'January'),
(335, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:26', 1, 'January'),
(336, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:26', 1, 'January'),
(337, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:26', 1, 'January'),
(338, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:26', 1, 'January'),
(339, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:26', 1, 'January'),
(340, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:29', 1, 'January'),
(341, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:29', 1, 'January'),
(342, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:29', 1, 'January'),
(343, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:29', 1, 'January'),
(344, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:29', 1, 'January'),
(345, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:29', 1, 'January'),
(346, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:29', 1, 'January'),
(347, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:29', 1, 'January'),
(348, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:29', 1, 'January'),
(349, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:29', 1, 'January'),
(350, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:31', 1, 'January'),
(351, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:31', 1, 'January'),
(352, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:31', 1, 'January'),
(353, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:31', 1, 'January'),
(354, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:31', 1, 'January'),
(355, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:31', 1, 'January'),
(356, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:31', 1, 'January'),
(357, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:31', 1, 'January'),
(358, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:31', 1, 'January'),
(359, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:31', 1, 'January'),
(360, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:32', 1, 'January'),
(361, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:32', 1, 'January'),
(362, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:32', 1, 'January'),
(363, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:32', 1, 'January'),
(364, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:32', 1, 'January'),
(365, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:32', 1, 'January'),
(366, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:32', 1, 'January'),
(367, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:32', 1, 'January'),
(368, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:32', 1, 'January'),
(369, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:32', 1, 'January'),
(370, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:32', 1, 'January'),
(371, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:32', 1, 'January'),
(372, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:32', 1, 'January'),
(373, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:32', 1, 'January'),
(374, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:32', 1, 'January'),
(375, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:32', 1, 'January'),
(376, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:32', 1, 'January'),
(377, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:32', 1, 'January'),
(378, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:32', 1, 'January'),
(379, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:32', 1, 'January'),
(380, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:32', 1, 'January'),
(381, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:32', 1, 'January'),
(382, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:32', 1, 'January'),
(383, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:32', 1, 'January'),
(384, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:32', 1, 'January'),
(385, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:32', 1, 'January'),
(386, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:32', 1, 'January'),
(387, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:32', 1, 'January'),
(388, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:32', 1, 'January'),
(389, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:32', 1, 'January'),
(390, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:33', 1, 'January'),
(391, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:33', 1, 'January'),
(392, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:33', 1, 'January'),
(393, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:33', 1, 'January'),
(394, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:33', 1, 'January'),
(395, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:33', 1, 'January'),
(396, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:33', 1, 'January'),
(397, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:33', 1, 'January'),
(398, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:33', 1, 'January'),
(399, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:33', 1, 'January'),
(400, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:55:33', 1, 'January'),
(401, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:55:33', 1, 'January'),
(402, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:33', 1, 'January'),
(403, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:55:33', 1, 'January'),
(404, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:55:33', 1, 'January'),
(405, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:55:33', 1, 'January'),
(406, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:55:33', 1, 'January'),
(407, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:55:33', 1, 'January'),
(408, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:55:33', 1, 'January'),
(409, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:55:33', 1, 'January'),
(410, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:57:20', 1, 'January'),
(411, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:57:20', 1, 'January'),
(412, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:57:20', 1, 'January'),
(413, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:57:20', 1, 'January'),
(414, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:57:20', 1, 'January'),
(415, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:57:20', 1, 'January'),
(416, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:57:20', 1, 'January'),
(417, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:57:20', 1, 'January'),
(418, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:57:20', 1, 'January'),
(419, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:57:20', 1, 'January'),
(420, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 22:57:26', 1, 'January'),
(421, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 22:57:26', 1, 'January'),
(422, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:57:26', 1, 'January'),
(423, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 22:57:26', 1, 'January'),
(424, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 22:57:26', 1, 'January'),
(425, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 22:57:26', 1, 'January'),
(426, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 22:57:26', 1, 'January'),
(427, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 22:57:26', 1, 'January'),
(428, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 22:57:26', 1, 'January'),
(429, 166, 29.00, 700, 'F', 'Needs Improvement', 'online', 4.14, '2025-05-26 22:57:26', 1, 'January'),
(430, 166, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 23:03:57', 1, 'January'),
(431, 171, 50.00, 700, 'F', 'Needs Improvement', 'online', 7.14, '2025-05-26 23:09:30', 1, 'January'),
(432, 172, 100.00, 700, 'F', 'Needs Improvement', 'online', 14.29, '2025-05-26 23:12:16', 1, 'January'),
(433, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-26 23:47:45', 1, 'January'),
(434, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-26 23:47:45', 1, 'January'),
(435, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 23:47:45', 1, 'January'),
(436, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-26 23:47:45', 1, 'January'),
(437, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 23:47:45', 1, 'January'),
(438, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-26 23:47:45', 1, 'January'),
(439, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-26 23:47:45', 1, 'January'),
(440, 166, 700.00, 700, 'A+', 'Outstanding', 'online', 100.00, '2025-05-26 23:47:55', 1, 'January'),
(441, 171, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-26 23:54:11', 1, 'January'),
(442, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-27 00:01:36', 1, 'January'),
(443, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:01:36', 1, 'January'),
(444, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:01:36', 1, 'January'),
(445, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:01:36', 1, 'January'),
(446, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:01:36', 1, 'January'),
(447, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:01:36', 1, 'January'),
(448, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:01:36', 1, 'January'),
(449, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:01:36', 1, 'January'),
(450, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-27 00:01:41', 1, 'January'),
(451, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-27 00:02:37', 1, 'January'),
(452, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:02:37', 1, 'January'),
(453, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:02:37', 1, 'January'),
(454, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:02:37', 1, 'January'),
(455, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:02:37', 1, 'January'),
(456, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:02:37', 1, 'January'),
(457, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:02:37', 1, 'January'),
(458, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:02:37', 1, 'January'),
(459, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:02:37', 1, 'January'),
(460, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:02:37', 1, 'January'),
(461, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-27 00:02:52', 1, 'January'),
(462, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:02:52', 1, 'January'),
(463, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:02:52', 1, 'January'),
(464, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:02:52', 1, 'January'),
(465, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:02:52', 1, 'January'),
(466, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:02:52', 1, 'January'),
(467, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:02:52', 1, 'January'),
(468, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:02:52', 1, 'January'),
(469, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:02:52', 1, 'January'),
(470, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:02:52', 1, 'January'),
(471, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-27 00:07:22', 1, 'January'),
(472, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:07:22', 1, 'January'),
(473, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:07:22', 1, 'January'),
(474, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:07:22', 1, 'January'),
(475, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:07:22', 1, 'January'),
(476, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:07:22', 1, 'January'),
(477, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:07:22', 1, 'January'),
(478, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:07:22', 1, 'January'),
(479, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:07:22', 1, 'January'),
(480, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:07:22', 1, 'January'),
(481, 168, 200.00, 700, 'F', 'Needs Improvement', 'physical', 28.57, '2025-05-27 00:07:46', 1, 'January'),
(482, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:07:58', 1, 'January'),
(483, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:07:58', 1, 'January'),
(484, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:07:58', 1, 'January'),
(485, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:07:58', 1, 'January'),
(486, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:07:58', 1, 'January'),
(487, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:07:58', 1, 'January'),
(488, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:07:58', 1, 'January'),
(489, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:07:58', 1, 'January'),
(490, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:07:58', 1, 'January'),
(491, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:07:58', 1, 'January'),
(492, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:03', 1, 'January'),
(493, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:03', 1, 'January'),
(494, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:03', 1, 'January'),
(495, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:03', 1, 'January'),
(496, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:17:03', 1, 'January'),
(497, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:03', 1, 'January'),
(498, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:17:03', 1, 'January'),
(499, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:03', 1, 'January'),
(500, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:03', 1, 'January'),
(501, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:03', 1, 'January'),
(502, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:06', 1, 'January'),
(503, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:06', 1, 'January'),
(504, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:06', 1, 'January'),
(505, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:06', 1, 'January');
INSERT INTO `result_log` (`id`, `student_id`, `marks_obtained`, `max_marks`, `grade`, `remarks`, `exam_type`, `percentage`, `changed_at`, `admin_id`, `month`) VALUES
(506, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:17:06', 1, 'January'),
(507, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:06', 1, 'January'),
(508, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:17:06', 1, 'January'),
(509, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:06', 1, 'January'),
(510, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:06', 1, 'January'),
(511, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:06', 1, 'January'),
(512, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:07', 1, 'January'),
(513, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:07', 1, 'January'),
(514, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:07', 1, 'January'),
(515, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:07', 1, 'January'),
(516, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:17:07', 1, 'January'),
(517, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:07', 1, 'January'),
(518, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:17:07', 1, 'January'),
(519, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:07', 1, 'January'),
(520, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:07', 1, 'January'),
(521, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:07', 1, 'January'),
(522, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:07', 1, 'January'),
(523, 169, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:07', 1, 'January'),
(524, 173, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:07', 1, 'January'),
(525, 170, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:07', 1, 'January'),
(526, 175, 600.00, 700, 'A', 'Excellent', 'online', 85.71, '2025-05-27 00:17:07', 1, 'January'),
(527, 167, 400.00, 700, 'D', 'Average', 'online', 57.14, '2025-05-27 00:17:07', 1, 'January'),
(528, 174, 455.00, 700, 'C', 'Good', 'online', 65.00, '2025-05-27 00:17:07', 1, 'January'),
(529, 172, 500.00, 700, 'B', 'Very Good', 'online', 71.43, '2025-05-27 00:17:07', 1, 'January'),
(530, 171, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:07', 1, 'January'),
(531, 166, 300.00, 700, 'F', 'Needs Improvement', 'online', 42.86, '2025-05-27 00:17:07', 1, 'January'),
(532, 168, 200.00, 700, 'F', 'Needs Improvement', 'online', 28.57, '2025-05-27 00:17:30', 1, 'January');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `roll_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_contact` varchar(20) DEFAULT NULL,
  `emergency_contact` varchar(20) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `full_name`, `profile_photo`, `age`, `dob`, `gender`, `grade`, `section`, `roll_number`, `address`, `guardian_name`, `guardian_contact`, `emergency_contact`, `enrollment_date`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(166, 'Reyansh Kapoor', NULL, 14, '2011-04-16', 'Male', '1', 'B', '100', 'Butwal', 'Vivaan Kapoor', '9815008550', '9423383762', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(167, 'Anaya Verma', NULL, 16, '2008-09-27', 'Female', '1', 'B', '101', 'Pokhara', 'Aarav Thakur', '9857856684', '9471203037', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(168, 'Aarav Gupta', NULL, 11, '2013-11-01', 'Female', '1', 'B', '102', 'Biratnagar', 'Aditya Kapoor', '9815339302', '9468741571', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(169, 'Aarav Joshi', NULL, 15, '2009-06-20', 'Male', '1', 'D', '103', 'Biratnagar', 'Vivaan Gupta', '9820005087', '9443177616', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(170, 'Aditya Joshi', NULL, 7, '2017-10-18', 'Male', '1', 'B', '104', 'Hetauda', 'Ishaan Kapoor', '9827862217', '9463487806', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(171, 'Reyansh Joshi', NULL, 12, '2012-08-28', 'Male', '1', 'A', '105', 'Pokhara', 'Myra Sharma', '9819016152', '9479437317', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(172, 'Myra Joshi', NULL, 8, '2017-02-17', 'Male', '1', 'A', '106', 'Bhaktapur', 'Reyansh Bose', '9831284850', '9476889978', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(173, 'Aarav Thakur', NULL, 12, '2013-02-20', 'Male', '1', 'A', '107', 'Hetauda', 'Reyansh Gupta', '9865613313', '9479460830', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(174, 'Ishaan Reddy', NULL, 14, '2010-10-29', 'Female', '1', 'A', '108', 'Lalitpur', 'Anaya Bose', '9885244288', '9441067031', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(175, 'Anaya Kapoor', NULL, 12, '2012-06-08', 'Female', '1', 'A', '109', 'Bhaktapur', 'Ishaan Mishra', '9849378363', '9484622467', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(176, 'Anaya Bose', '11.jpg', 11, '2013-06-15', 'Male', '2', 'B', '110', 'Butwal', 'Myra Bose', '9870930977', '9423395525', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-20 08:33:45'),
(177, 'Siya Verma', NULL, 6, '2019-04-02', 'Male', '2', 'C', '111', 'Dharan', 'Diya Sharma', '9846190364', '9480224381', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(178, 'Kabir Verma', NULL, 16, '2009-04-23', 'Female', '2', 'D', '112', 'Lalitpur', 'Diya Verma', '9898655849', '9457915011', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(179, 'Aditya Sharma', NULL, 9, '2016-04-25', 'Female', '2', 'B', '113', 'Kathmandu', 'Vivaan Reddy', '9870259867', '9480372975', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(180, 'Vivaan Joshi', NULL, 16, '2008-08-17', 'Male', '2', 'B', '114', 'Bhaktapur', 'Aditya Verma', '9870439065', '9490680976', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(181, 'Ishaan Verma', NULL, 15, '2010-01-10', 'Female', '2', 'B', '115', 'Kathmandu', 'Siya Sharma', '9862430020', '9431412649', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(182, 'Anaya Kapoor', NULL, 13, '2011-07-13', 'Female', '2', 'C', '116', 'Kathmandu', 'Reyansh Reddy', '9885473451', '9456287750', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(183, 'Diya Verma', NULL, 12, '2012-08-14', 'Female', '2', 'D', '117', 'Butwal', 'Siya Reddy', '9859484190', '9440149553', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(184, 'Aditya Sharma', NULL, 9, '2015-12-16', 'Female', '2', 'A', '118', 'Pokhara', 'Anaya Bose', '9876684649', '9452191446', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(185, 'Siya Kapoor', NULL, 9, '2016-04-29', 'Male', '2', 'B', '119', 'Pokhara', 'Aarav Joshi', '9849939329', '9461449046', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(186, 'Aditya Thakur', NULL, 9, '2015-10-16', 'Male', '3', 'D', '120', 'Hetauda', 'Anaya Gupta', '9880414554', '9414591788', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(187, 'Diya Bose', NULL, 12, '2012-07-06', 'Male', '3', 'D', '121', 'Biratnagar', 'Diya Mishra', '9818439271', '9482389770', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(188, 'Aditya Mishra', NULL, 7, '2018-02-28', 'Male', '3', 'B', '122', 'Biratnagar', 'Aarav Verma', '9878350199', '9462703816', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(189, 'Kabir Joshi', NULL, 7, '2018-02-10', 'Male', '3', 'A', '123', 'Bhaktapur', 'Kabir Kapoor', '9863128818', '9429794268', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(190, 'Diya Verma', NULL, 11, '2013-08-14', 'Male', '3', 'B', '124', 'Hetauda', 'Aditya Mishra', '9862829705', '9482706226', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(191, 'Aarav Patel', NULL, 15, '2009-06-20', 'Male', '3', 'B', '125', 'Lalitpur', 'Aarav Bose', '9838173711', '9460333889', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(192, 'Aditya Sharma', NULL, 12, '2012-09-17', 'Male', '3', 'D', '126', 'Kathmandu', 'Reyansh Mishra', '9836810131', '9434803306', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(193, 'Anaya Patel', NULL, 9, '2015-11-14', 'Female', '3', 'B', '127', 'Lalitpur', 'Reyansh Reddy', '9860353785', '9448908704', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(194, 'Aarav Gupta', NULL, 8, '2017-04-13', 'Female', '3', 'D', '128', 'Biratnagar', 'Anaya Reddy', '9862364147', '9439312290', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(195, 'Anaya Verma', NULL, 11, '2014-03-16', 'Male', '3', 'D', '129', 'Kathmandu', 'Aditya Gupta', '9820490489', '9422814996', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(196, 'Kabir Bose', NULL, 6, '2019-03-22', 'Female', '4', 'A', '130', 'Bhaktapur', 'Diya Kapoor', '9894523909', '9469060546', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(197, 'Ishaan Verma', NULL, 12, '2012-12-14', 'Male', '4', 'D', '131', 'Pokhara', 'Aditya Gupta', '9821399684', '9432594112', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(198, 'Aarav Patel', NULL, 8, '2016-08-23', 'Female', '4', 'D', '132', 'Pokhara', 'Anaya Patel', '9898182840', '9456678644', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(199, 'Anaya Thakur', NULL, 9, '2015-10-14', 'Male', '4', 'A', '133', 'Dharan', 'Ishaan Kapoor', '9865957773', '9492172041', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(200, 'Kabir Kapoor', NULL, 8, '2017-03-06', 'Male', '4', 'C', '134', 'Dharan', 'Aditya Gupta', '9844505086', '9412672258', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(201, 'Reyansh Mishra', NULL, 9, '2016-01-10', 'Female', '4', 'A', '135', 'Dharan', 'Ishaan Kapoor', '9869692075', '9419857595', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(202, 'Anaya Patel', NULL, 8, '2017-04-09', 'Female', '4', 'D', '136', 'Hetauda', 'Anaya Patel', '9859059665', '9413402023', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(203, 'Diya Reddy', NULL, 10, '2014-12-17', 'Female', '4', 'C', '137', 'Lalitpur', 'Ishaan Thakur', '9859242227', '9473410210', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(204, 'Aditya Thakur', NULL, 9, '2015-07-27', 'Female', '4', 'C', '138', 'Biratnagar', 'Myra Gupta', '9835400868', '9489595103', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(205, 'Myra Mishra', NULL, 9, '2015-09-16', 'Female', '4', 'A', '139', 'Hetauda', 'Myra Verma', '9883561628', '9465230788', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(206, 'Siya Mishra', NULL, 9, '2015-05-26', 'Female', '5', 'A', '140', 'Lalitpur', 'Myra Sharma', '9812087043', '9494855660', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(207, 'Aarav Thakur', NULL, 12, '2012-08-16', 'Male', '5', 'C', '141', 'Kathmandu', 'Aditya Bose', '9820208694', '9411408517', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(208, 'Ishaan Bose', NULL, 11, '2013-07-18', 'Female', '5', 'D', '142', 'Lalitpur', 'Aarav Gupta', '9858854901', '9457413291', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(209, 'Diya Kapoor', NULL, 13, '2011-06-08', 'Male', '5', 'D', '143', 'Dharan', 'Anaya Gupta', '9861114817', '9457583463', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(210, 'Aditya Mishra', NULL, 13, '2011-09-15', 'Female', '5', 'B', '144', 'Biratnagar', 'Anaya Thakur', '9814819837', '9455810611', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(211, 'Diya Joshi', NULL, 14, '2010-06-06', 'Female', '5', 'B', '145', 'Dharan', 'Reyansh Kapoor', '9819766314', '9430611020', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(212, 'Vivaan Reddy', NULL, 8, '2016-07-27', 'Female', '5', 'A', '146', 'Biratnagar', 'Aditya Joshi', '9817140099', '9493281043', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(213, 'Reyansh Verma', NULL, 16, '2009-05-04', 'Female', '5', 'A', '147', 'Dharan', 'Ishaan Reddy', '9843894106', '9426139378', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(214, 'Aditya Kapoor', NULL, 16, '2008-09-22', 'Male', '5', 'B', '148', 'Lalitpur', 'Diya Thakur', '9878802608', '9469800268', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(215, 'Aarav Thakur', NULL, 7, '2018-03-16', 'Male', '5', 'A', '149', 'Lalitpur', 'Myra Bose', '9847294306', '9449623017', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(216, 'Diya Sharma', NULL, 15, '2009-11-12', 'Male', '6', 'A', '150', 'Pokhara', 'Aarav Joshi', '9838955853', '9482165827', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(217, 'Ishaan Joshi', NULL, 9, '2016-02-16', 'Female', '6', 'A', '151', 'Bhaktapur', 'Aarav Kapoor', '9814251703', '9489967137', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(218, 'Anaya Kapoor', NULL, 6, '2018-11-05', 'Male', '6', 'B', '152', 'Butwal', 'Siya Bose', '9819124017', '9427998461', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(219, 'Vivaan Joshi', NULL, 11, '2014-03-13', 'Female', '6', 'D', '153', 'Hetauda', 'Ishaan Kapoor', '9835933954', '9428290832', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(220, 'Siya Gupta', NULL, 11, '2014-04-26', 'Female', '6', 'B', '154', 'Dharan', 'Vivaan Sharma', '9860057878', '9482058676', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(221, 'Aarav Kapoor', NULL, 15, '2010-02-02', 'Female', '6', 'B', '155', 'Bhaktapur', 'Diya Patel', '9868670770', '9430696133', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(222, 'Aarav Gupta', NULL, 6, '2019-03-17', 'Male', '6', 'A', '156', 'Biratnagar', 'Diya Bose', '9894457594', '9458415634', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(223, 'Ishaan Sharma', NULL, 12, '2013-02-07', 'Female', '6', 'D', '157', 'Kathmandu', 'Kabir Sharma', '9896411658', '9420957103', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(224, 'Aditya Sharma', NULL, 7, '2018-01-13', 'Female', '6', 'D', '158', 'Butwal', 'Vivaan Gupta', '9844212664', '9470673757', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(225, 'Diya Mishra', NULL, 13, '2011-09-27', 'Male', '6', 'A', '159', 'Bhaktapur', 'Siya Reddy', '9881139034', '9426108339', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(226, 'Aditya Kapoor', NULL, 8, '2017-03-05', 'Male', '7', 'A', '160', 'Pokhara', 'Ishaan Sharma', '9874876917', '9494717292', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(227, 'Ishaan Bose', NULL, 14, '2010-09-04', 'Female', '7', 'C', '161', 'Bhaktapur', 'Myra Sharma', '9870597465', '9456763944', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(228, 'Myra Gupta', NULL, 14, '2011-01-11', 'Female', '7', 'D', '162', 'Dharan', 'Vivaan Verma', '9847265252', '9455187072', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(229, 'Kabir Joshi', NULL, 8, '2017-02-15', 'Male', '7', 'B', '163', 'Dharan', 'Siya Mishra', '9818658365', '9418675762', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(230, 'Kabir Kapoor', NULL, 14, '2010-10-08', 'Female', '7', 'D', '164', 'Kathmandu', 'Diya Joshi', '9886833598', '9419106923', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(231, 'Reyansh Thakur', NULL, 11, '2013-05-30', 'Male', '7', 'C', '165', 'Pokhara', 'Vivaan Gupta', '9812228231', '9491106153', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(232, 'Myra Reddy', NULL, 11, '2014-03-19', 'Male', '7', 'A', '166', 'Pokhara', 'Kabir Thakur', '9835162605', '9424935155', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(233, 'Aditya Kapoor', NULL, 11, '2013-12-11', 'Female', '7', 'A', '167', 'Lalitpur', 'Diya Gupta', '9834988658', '9450285931', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(234, 'Diya Thakur', NULL, 11, '2013-07-23', 'Female', '7', 'C', '168', 'Bhaktapur', 'Vivaan Patel', '9877539615', '9499432301', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(235, 'Myra Mishra', NULL, 8, '2016-08-24', 'Female', '7', 'D', '169', 'Dharan', 'Kabir Verma', '9885180637', '9421904700', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(236, 'Kabir Patel', NULL, 12, '2012-09-13', 'Male', '8', 'B', '170', 'Pokhara', 'Aarav Kapoor', '9812930049', '9478706952', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(237, 'Diya Kapoor', NULL, 9, '2015-08-24', 'Female', '8', 'A', '171', 'Dharan', 'Diya Joshi', '9882181772', '9441246808', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(238, 'Siya Joshi', NULL, 16, '2008-10-15', 'Female', '8', 'B', '172', 'Hetauda', 'Aarav Verma', '9838350838', '9449479994', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(239, 'Aarav Bose', NULL, 10, '2014-10-17', 'Female', '8', 'D', '173', 'Pokhara', 'Vivaan Kapoor', '9898429427', '9498874348', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(240, 'Aarav Kapoor', NULL, 11, '2013-06-07', 'Male', '8', 'B', '174', 'Bhaktapur', 'Diya Bose', '9876374717', '9444049894', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(241, 'Siya Verma', NULL, 11, '2013-10-31', 'Female', '8', 'B', '175', 'Dharan', 'Siya Thakur', '9824939794', '9430824057', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(242, 'Myra Thakur', NULL, 8, '2017-03-31', 'Female', '8', 'D', '176', 'Dharan', 'Anaya Kapoor', '9882639107', '9426259957', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(243, 'Aditya Patel', NULL, 14, '2011-04-04', 'Female', '8', 'C', '177', 'Bhaktapur', 'Myra Bose', '9825444407', '9442099860', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(244, 'Vivaan Joshi', NULL, 16, '2009-02-12', 'Male', '8', 'C', '178', 'Lalitpur', 'Aarav Patel', '9850823287', '9453786259', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(245, 'Diya Verma', NULL, 10, '2015-04-01', 'Female', '8', 'D', '179', 'Butwal', 'Aditya Thakur', '9828451409', '9480201047', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(246, 'Aarav Gupta', NULL, 9, '2015-07-04', 'Male', '9', 'D', '180', 'Lalitpur', 'Vivaan Bose', '9884413025', '9484764582', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(247, 'Kabir Mishra', NULL, 16, '2008-06-25', 'Female', '9', 'D', '181', 'Hetauda', 'Vivaan Joshi', '9819524773', '9414501987', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(248, 'Reyansh Thakur', NULL, 16, '2009-05-10', 'Female', '9', 'B', '182', 'Biratnagar', 'Ishaan Reddy', '9830952900', '9440982872', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(249, 'Aditya Gupta', NULL, 12, '2013-01-21', 'Male', '9', 'C', '183', 'Kathmandu', 'Ishaan Kapoor', '9885851006', '9476686728', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(250, 'Kabir Sharma', NULL, 13, '2011-10-22', 'Male', '9', 'D', '184', 'Lalitpur', 'Anaya Joshi', '9899882333', '9461650612', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(251, 'Kabir Joshi', NULL, 12, '2012-06-26', 'Female', '9', 'D', '185', 'Butwal', 'Myra Gupta', '9818410758', '9466783819', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(252, 'Aarav Bose', NULL, 8, '2016-09-19', 'Male', '9', 'B', '186', 'Butwal', 'Diya Mishra', '9840303123', '9470160457', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(253, 'Aditya Gupta', NULL, 12, '2012-10-24', 'Male', '9', 'D', '187', 'Butwal', 'Reyansh Gupta', '9851089763', '9496519018', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(254, 'Siya Mishra', NULL, 10, '2014-07-06', 'Male', '9', 'C', '188', 'Lalitpur', 'Anaya Thakur', '9837406351', '9467303381', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(255, 'Diya Bose', NULL, 16, '2008-10-15', 'Female', '9', 'A', '189', 'Biratnagar', 'Kabir Thakur', '9829858500', '9486998955', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(256, 'Myra Verma', NULL, 8, '2017-01-20', 'Male', '10', 'B', '190', 'Kathmandu', 'Siya Mishra', '9813128146', '9415068415', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 07:53:29'),
(257, 'Diya Patel', NULL, 9, '2016-02-21', 'Male', '10', 'C', '191', 'Dharan', 'Anaya Kapoor', '9867941398', '9417611353', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(258, 'Reyansh Reddy', NULL, 13, '2012-03-31', 'Female', '10', 'A', '192', 'Bhaktapur', 'Ishaan Sharma', '9840575291', '9413995216', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(259, 'Kabir Kapoor', NULL, 6, '2019-05-04', 'Female', '10', 'D', '193', 'Biratnagar', 'Ishaan Reddy', '9889347166', '9414037474', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(260, 'Ishaan Mishra', NULL, 16, '2009-01-18', 'Female', '10', 'B', '194', 'Pokhara', 'Diya Bose', '9882428733', '9417798343', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(261, 'Vivaan Joshi', NULL, 16, '2009-02-06', 'Female', '10', 'D', '195', 'Hetauda', 'Diya Bose', '9831625780', '9464328295', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(262, 'Aditya Reddy', NULL, 9, '2015-10-06', 'Male', '10', 'D', '196', 'Butwal', 'Ishaan Thakur', '9852919991', '9496853730', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(263, 'Aarav Gupta', NULL, 14, '2010-08-11', 'Male', '10', 'B', '197', 'Butwal', 'Ishaan Thakur', '9829131484', '9444695358', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(264, 'Kabir Thakur', NULL, 9, '2015-07-04', 'Male', '10', 'A', '198', 'Butwal', 'Kabir Thakur', '9823575260', '9480612163', '2024-06-01', 'Active', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18'),
(265, 'Anaya Thakur', NULL, 13, '2011-08-26', 'Female', '10', 'C', '199', 'Bhaktapur', 'Aditya Thakur', '9835688208', '9469639678', '2024-06-01', 'Inactive', 0, '2025-05-19 05:11:18', '2025-05-19 05:11:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `result_log`
--
ALTER TABLE `result_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll_number` (`roll_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_log`
--
ALTER TABLE `result_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `result_log`
--
ALTER TABLE `result_log`
  ADD CONSTRAINT `result_log_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
