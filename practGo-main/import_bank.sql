
CREATE DATABASE IF NOT EXISTS bank;

USE bank;

CREATE TABLE individuals (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             first_name VARCHAR(50) NOT NULL,
                             last_name VARCHAR(50) NOT NULL,
                             patronymic VARCHAR(50),
                             passport VARCHAR(20) NOT NULL,
                             tin VARCHAR(12) NOT NULL,
                             snils VARCHAR(11) NOT NULL,
                             driver_license VARCHAR(20),
                             additional_documents TEXT,
                             notes TEXT
);

CREATE TABLE loan_funds (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            individual_id INT NOT NULL,
                            amount DECIMAL(15, 2) NOT NULL,
                            interest_rate DECIMAL(5, 2) NOT NULL,
                            duration INT NOT NULL,
                            conditions TEXT,
                            notes TEXT,
                            FOREIGN KEY (individual_id) REFERENCES individuals(id)
);

CREATE TABLE organization_loans (
                                    id INT AUTO_INCREMENT PRIMARY KEY,
                                    organization_id INT NOT NULL,
                                    individual_id INT NOT NULL,
                                    amount DECIMAL(15, 2) NOT NULL,
                                    duration INT NOT NULL,
                                    interest_rate DECIMAL(5, 2) NOT NULL,
                                    conditions TEXT,
                                    notes TEXT,
                                    FOREIGN KEY (individual_id) REFERENCES individuals(id)
);



CREATE TABLE borrowers (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           tin VARCHAR(12) NOT NULL,
                           is_individual BOOLEAN NOT NULL,
                           address TEXT NOT NULL,
                           amount DECIMAL(15, 2) NOT NULL,
                           conditions TEXT,
                           legal_notes TEXT,
                           contracts_list TEXT
);

ALTER TABLE individuals ADD borrower_id INT;


ALTER TABLE individuals
    ADD CONSTRAINT fk_borrower_id
        FOREIGN KEY (borrower_id) REFERENCES borrowers(id);

INSERT INTO individuals (first_name, last_name, patronymic, passport, tin, snils, driver_license, additional_documents, notes) VALUES
('Иван', 'Иванов', 'Иванович', '1234 567890', '123456789012', '12345678901', '1234 567890', 'Документ об образовании', 'Заметка 1'),
('Петр', 'Петров', 'Петрович', '2345 678901', '234567890123', '23456789012', '2345 678901', 'Свидетельство о браке', 'Заметка 2'),
('Сергей', 'Сергеев', 'Сергеевич', '3456 789012', '345678901234', '34567890123', NULL, 'Военный билет', 'Заметка 3'),
('Алексей', 'Алексеев', 'Алексеевич', '4567 890123', '456789012345', '45678901234', '4567 890123', 'Свидетельство о рождении', 'Заметка 4'),
('Михаил', 'Михайлов', 'Михайлович', '5678 901234', '567890123456', '56789012345', NULL, 'Паспорт гражданина другого государства', 'Заметка 5'),
('Андрей', 'Андреев', 'Андреевич', '6789 012345', '678901234567', '67890123456', '6789 012345', 'Медицинская справка', 'Заметка 6'),
('Дмитрий', 'Дмитриев', 'Дмитриевич', '7890 123456', '789012345678', '78901234567', NULL, 'Водительская карточка', 'Заметка 7'),
('Николай', 'Николаев', 'Николаевич', '8901 234567', '890123456789', '89012345678', '8901 234567', 'Документ о прописке', 'Заметка 8'),
('Александр', 'Александров', 'Александрович', '9012 345678', '901234567890', '90123456789', NULL, 'Справка о несудимости', 'Заметка 9'),
('Виктор', 'Викторов', 'Викторович', '0123 456789', '012345678901', '01234567890', '0123 456789', 'Карта мед. обслуживания', 'Заметка 10');
