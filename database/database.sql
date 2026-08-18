-- --------------------------------------------------------
-- SIMPEG STIKes Panti Waluya Malang Database Dump
-- --------------------------------------------------------

--
-- Table structure for table `departments`
--
CREATE TABLE IF NOT EXISTS `departments` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(50) NOT NULL UNIQUE,
  `is_active` BOOLEAN DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL
);

--
-- Table structure for table `positions`
--
CREATE TABLE IF NOT EXISTS `positions` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(50) NOT NULL UNIQUE,
  `department_id` INTEGER DEFAULT NULL,
  `is_active` BOOLEAN DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
);

--
-- Table structure for table `users`
--
CREATE TABLE IF NOT EXISTS `users` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` VARCHAR(50) NOT NULL DEFAULT 'hrd',
  `is_active` BOOLEAN DEFAULT 1,
  `remember_token` VARCHAR(100) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL
);

--
-- Table structure for table `employees`
--
CREATE TABLE IF NOT EXISTS `employees` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `nik` VARCHAR(50) DEFAULT NULL UNIQUE,
  `full_name` VARCHAR(255) NOT NULL,
  `birth_place` VARCHAR(100) DEFAULT NULL,
  `birth_date` DATE DEFAULT NULL,
  `gender` VARCHAR(1) DEFAULT NULL,
  `address` TEXT DEFAULT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `photo` VARCHAR(255) DEFAULT NULL,
  `employment_status` VARCHAR(50) NOT NULL DEFAULT 'tetap',
  `department_id` INTEGER DEFAULT NULL,
  `position_id` INTEGER DEFAULT NULL,
  `supervisor_id` INTEGER DEFAULT NULL,
  `work_location` VARCHAR(255) DEFAULT NULL,
  `join_date' DATE DEFAULT NULL,
  `contract_end_date` DATE DEFAULT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'active',
  `marital_status` VARCHAR(50) DEFAULT NULL,
  `notes` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL,
  FOREIGN KEY (`supervisor_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL
);

--
-- Table structure for table `employee_families`
--
CREATE TABLE IF NOT EXISTS `employee_families` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `employee_id` INTEGER NOT NULL,
  `relation` VARCHAR(50) NOT NULL,
  `full_name` VARCHAR(255) NOT NULL,
  `birth_date` DATE DEFAULT NULL,
  `occupation` VARCHAR(100) DEFAULT NULL,
  `is_dependent` BOOLEAN DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
);

--
-- Table structure for table `employee_educations`
--
CREATE TABLE IF NOT EXISTS `employee_educations` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `employee_id` INTEGER NOT NULL,
  `level` VARCHAR(50) NOT NULL,
  `institution` VARCHAR(255) NOT NULL,
  `major` VARCHAR(255) DEFAULT NULL,
  `graduation_year` INTEGER DEFAULT NULL,
  `gpa` VARCHAR(10) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
);

--
-- Table structure for table `employee_trainings`
--
CREATE TABLE IF NOT EXISTS `employee_trainings` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `employee_id` INTEGER NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `organizer` VARCHAR(255) DEFAULT NULL,
  `start_date` DATE DEFAULT NULL,
  `end_date` DATE DEFAULT NULL,
  `expiry_date` DATE DEFAULT NULL,
  `certificate_number` VARCHAR(100) DEFAULT NULL,
  `attachment` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
);

--
-- Table structure for table `employee_documents`
--
CREATE TABLE IF NOT EXISTS `employee_documents` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `employee_id` INTEGER NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `file_path` VARCHAR(255) NOT NULL,
  `file_name` VARCHAR(255) NOT NULL,
  `file_size` VARCHAR(50) DEFAULT NULL,
  `file_type` VARCHAR(100) DEFAULT NULL,
  `issued_date` DATE DEFAULT NULL,
  `expiry_date` DATE DEFAULT NULL,
  `notes` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
);

--
-- Table structure for table `resignation_details`
--
CREATE TABLE IF NOT EXISTS `resignation_details` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `employee_id` INTEGER NOT NULL,
  `resignation_date` DATE NOT NULL,
  `reason` VARCHAR(50) NOT NULL,
  `reason_detail` TEXT DEFAULT NULL,
  `clearance_status` VARCHAR(50) DEFAULT 'pending',
  `clearance_notes` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
);

--
-- Dumping Seed Users
--
INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin IT (STIKes Panti Waluya)', 'admin@simpeg.local', '$2y$12$Nq/f6KkHl/z9j3cE03h3tO4e7R4S2v7S4e5R4S2v7S4e5R4S2v7S4', 'admin_it', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Tim HRD & Kepeformatan', 'hrd@simpeg.local', '$2y$12$Nq/f6KkHl/z9j3cE03h3tO4e7R4S2v7S4e5R4S2v7S4e5R4S2v7S4', 'hrd', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Akun Tamu / Guest', 'guest@simpeg.local', '$2y$12$Nq/f6KkHl/z9j3cE03h3tO4e7R4S2v7S4e5R4S2v7S4e5R4S2v7S4', 'guest', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
