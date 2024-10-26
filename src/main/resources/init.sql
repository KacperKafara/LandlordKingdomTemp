GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.users TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.personal_data TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.google_auth TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.administrators TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.tenants TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.owners TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.access_levels TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.old_passwords TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, DELETE ON ssbd02.tokens TO 'ssbd02mok'@'%';
GRANT SELECT ON ssbd02.timezones TO 'ssbd02mok'@'%';
GRANT SELECT ON ssbd02.themes TO 'ssbd02mok'@'%';
GRANT SELECT, INSERT, UPDATE ON ssbd02.user_filters TO 'ssbd02mok'@'%';
GRANT SELECT, DELETE ON ssbd02.role_requests TO 'ssbd02mok'@'%';

GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.locals TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.addresses TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.applications TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.fixed_fees TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.payments TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.rents TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.role_requests TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE, UPDATE ON ssbd02.variable_fees TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.users TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.personal_data TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.google_auth TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.timezones TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.themes TO 'ssbd02mol'@'%';

GRANT SELECT, INSERT, UPDATE ON ssbd02.users TO 'ssbd02auth'@'%';
GRANT SELECT ON ssbd02.personal_data TO 'ssbd02auth'@'%';
GRANT SELECT, INSERT, UPDATE ON ssbd02.google_auth TO 'ssbd02auth'@'%';
GRANT SELECT ON ssbd02.timezones TO 'ssbd02auth'@'%';
GRANT SELECT ON ssbd02.themes TO 'ssbd02auth'@'%';
GRANT SELECT ON ssbd02.administrators TO 'ssbd02auth'@'%';
GRANT SELECT ON ssbd02.tenants TO 'ssbd02auth'@'%';
GRANT SELECT ON ssbd02.owners TO 'ssbd02auth'@'%';
GRANT SELECT ON ssbd02.access_levels TO 'ssbd02auth'@'%';
GRANT SELECT, INSERT, DELETE ON ssbd02.tokens TO 'ssbd02auth'@'%';

GRANT SELECT ON ssbd02.tenants TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.personal_data TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.users TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.themes TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.timezones TO 'ssbd02mol'@'%';
GRANT SELECT ON ssbd02.google_auth TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT ON ssbd02.owners TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, UPDATE ON ssbd02.access_levels TO 'ssbd02mol'@'%';
GRANT SELECT, INSERT, DELETE ON ssbd02.images TO 'ssbd02mol'@'%';

FLUSH PRIVILEGES;

INSERT INTO users (id, login, password, blocked, verified, login_attempts, version, language, created_at,
                          modified_at, created_by, modified_by, active)
VALUES ('d42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'admin', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.',
        false, true, 0, 1, 'EN', NOW(), NOW(), null, null, true);
INSERT INTO personal_data (user_id, email, temp_email, first_name, last_name)
VALUES ('d42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'kacperkafara18@gmail.com', null, 'Admin', 'Admin');
INSERT INTO access_levels (id, user_id, level, active, version, created_at, modified_at, created_by, modified_by)
VALUES ('22f34716-3b77-4e63-809d-35f9a4758011', 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ADMINISTRATOR', true, 0, NOW(),
        NOW(), null, null);
INSERT INTO administrators (id)
VALUES ('22f34716-3b77-4e63-809d-35f9a4758011');

INSERT INTO users (id, login, password, blocked, verified, login_attempts, version, language, created_at,
                          modified_at, created_by, modified_by, active)
VALUES ('05854132-8b7c-440e-9ef2-8fe46a7962dc', 'tenant',
        '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null,
        null, true);
INSERT INTO personal_data (user_id, email, temp_email, first_name, last_name)
VALUES ('05854132-8b7c-440e-9ef2-8fe46a7962dc', 'tenant@mail.com', null, 'Tenant', 'Tenant');
INSERT INTO access_levels (id, user_id, level, active, version, created_at, modified_at, created_by, modified_by)
VALUES ('4b329d71-2a92-4e90-8f0b-f673e4f79529', '05854132-8b7c-440e-9ef2-8fe46a7962dc', 'TENANT', true, 0, NOW(), NOW(),
        null, null);
INSERT INTO tenants (id)
VALUES ('4b329d71-2a92-4e90-8f0b-f673e4f79529');

INSERT INTO users (id, login, password, blocked, verified, login_attempts, version, language, created_at,
                          modified_at, created_by, modified_by, active)
VALUES ('2d56f6d5-2dfd-4003-89d9-9e9ac6c145c9', 'test', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.',
        false, true, 0, 1, 'EN', NOW(), NOW(), null, null, true);
INSERT INTO personal_data (user_id, email, temp_email, first_name, last_name)
VALUES ('2d56f6d5-2dfd-4003-89d9-9e9ac6c145c9', '242374@edu.p.lodz.pl', null, 'test', 'test');
INSERT INTO access_levels (id, user_id, level, active, version, created_at, modified_at, created_by, modified_by)
VALUES ('6bcef94d-16f5-401b-a0d0-9461257572f6', '2d56f6d5-2dfd-4003-89d9-9e9ac6c145c9', 'TENANT', true, 0, NOW(), NOW(),
        null, null);
INSERT INTO tenants (id)
VALUES ('6bcef94d-16f5-401b-a0d0-9461257572f6');
INSERT INTO access_levels (id, user_id, level, active, version, created_at, modified_at, created_by, modified_by)
VALUES ('397cf3c5-f369-4783-9892-6fc781fd2b0d', '2d56f6d5-2dfd-4003-89d9-9e9ac6c145c9', 'OWNER', true, 0, NOW(), NOW(),
        null, null);
INSERT INTO owners (id)
VALUES ('397cf3c5-f369-4783-9892-6fc781fd2b0d');

INSERT INTO themes
(id, type)
VALUES (UUID(), 'light'),
       (UUID(), 'dark');

INSERT INTO timezones
(id, name)
VALUES (UUID(), 'Pacific/Midway'),
       (UUID(), 'Pacific/Honolulu'),
       (UUID(), 'America/Juneau'),
       (UUID(), 'America/Dawson'),
       (UUID(), 'America/Phoenix'),
       (UUID(), 'America/Tijuana'),
       (UUID(), 'America/Los_Angeles'),
       (UUID(), 'America/Boise'),
       (UUID(), 'America/Chihuahua'),
       (UUID(), 'America/Regina'),
       (UUID(), 'America/Mexico_City'),
       (UUID(), 'America/Belize'),
       (UUID(), 'America/Chicago'),
       (UUID(), 'America/Bogota'),
       (UUID(), 'America/Detroit'),
       (UUID(), 'America/Caracas'),
       (UUID(), 'America/Santiago'),
       (UUID(), 'America/Sao_Paulo'),
       (UUID(), 'America/Montevideo'),
       (UUID(), 'America/Argentina/Buenos_Aires'),
       (UUID(), 'America/St_Johns'),
       (UUID(), 'America/Godthab'),
       (UUID(), 'Atlantic/Cape_Verde'),
       (UUID(), 'Atlantic/Azores'),
       (UUID(), 'Etc/GMT'),
       (UUID(), 'Europe/London'),
       (UUID(), 'Europe/Dublin'),
       (UUID(), 'Europe/Lisbon'),
       (UUID(), 'Africa/Casablanca'),
       (UUID(), 'Atlantic/Canary'),
       (UUID(), 'Africa/Algiers'),
       (UUID(), 'Europe/Belgrade'),
       (UUID(), 'Europe/Sarajevo'),
       (UUID(), 'Europe/Brussels'),
       (UUID(), 'Europe/Amsterdam'),
       (UUID(), 'Africa/Harare'),
       (UUID(), 'Europe/Bucharest'),
       (UUID(), 'Africa/Cairo'),
       (UUID(), 'Europe/Helsinki'),
       (UUID(), 'Europe/Athens'),
       (UUID(), 'Asia/Jerusalem'),
       (UUID(), 'Europe/Moscow'),
       (UUID(), 'Asia/Kuwait'),
       (UUID(), 'Africa/Nairobi'),
       (UUID(), 'Asia/Baghdad'),
       (UUID(), 'Asia/Tehran'),
       (UUID(), 'Asia/Dubai'),
       (UUID(), 'Asia/Baku'),
       (UUID(), 'Asia/Kabul'),
       (UUID(), 'Asia/Yekaterinburg'),
       (UUID(), 'Asia/Karachi'),
       (UUID(), 'Asia/Kolkata'),
       (UUID(), 'Asia/Colombo'),
       (UUID(), 'Asia/Kathmandu'),
       (UUID(), 'Asia/Dhaka'),
       (UUID(), 'Asia/Almaty'),
       (UUID(), 'Asia/Rangoon'),
       (UUID(), 'Asia/Bangkok'),
       (UUID(), 'Asia/Krasnoyarsk'),
       (UUID(), 'Asia/Shanghai'),
       (UUID(), 'Asia/Kuala_Lumpur'),
       (UUID(), 'Asia/Taipei'),
       (UUID(), 'Australia/Perth'),
       (UUID(), 'Asia/Irkutsk'),
       (UUID(), 'Asia/Seoul'),
       (UUID(), 'Asia/Tokyo'),
       (UUID(), 'Asia/Yakutsk'),
       (UUID(), 'Australia/Darwin'),
       (UUID(), 'Australia/Adelaide'),
       (UUID(), 'Australia/Sydney'),
       (UUID(), 'Australia/Brisbane'),
       (UUID(), 'Australia/Hobart'),
       (UUID(), 'Asia/Vladivostok'),
       (UUID(), 'Pacific/Guam'),
       (UUID(), 'Asia/Magadan'),
       (UUID(), 'Asia/Kamchatka'),
       (UUID(), 'Pacific/Fiji'),
       (UUID(), 'Pacific/Auckland'),
       (UUID(), 'Pacific/Tongatapu');

INSERT INTO addresses (created_at, modified_at, version, number, zip, created_by, id, modified_by, city, country, street)
VALUES
    ('2023-01-01 10:00:00', '2023-01-01 10:00:00', 1, '123', '12-345', NULL, '550e8400-e29b-41d4-a716-446655440000', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-02 11:00:00', '2023-01-02 11:00:00', 1, '456', '67-890', NULL, '550e8400-e29b-41d4-a716-446655440005', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-03 12:00:00', '2023-01-03 12:00:00', 1, '789', '10-111', NULL, '550e8400-e29b-41d4-a716-446655440010', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '101', '12-131', NULL, '550e8400-e29b-41d4-a716-446655440015', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '103', '12-139', NULL, '550e8400-e29b-41d4-a716-446655440025', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-05 14:00:00', '2023-01-05 14:00:00', 1, '104', '14-151', NULL, '550e8400-e29b-41d4-a716-446655440020', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '105', '19-139', NULL, '550e8400-e29b-41d4-a716-446655440030', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '106', '19-142', NULL, '550e8400-e29b-41d4-a716-446655440035', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '107', '19-142', NULL, '550e8400-e29b-41d4-a716-446655440040', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '108', '19-142', NULL, '550e8400-e29b-41d4-a716-446655440045', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '109', '19-142', NULL, '550e8400-e29b-41d4-a716-446655440050', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '110', '19-142', NULL, '550e8400-e29b-41d4-a716-446655440055', NULL, 'Warszawa', 'Polska', 'Różana'),
    ('2023-01-04 13:00:00', '2023-01-04 13:00:00', 1, '111', '19-142', NULL, '550e8400-e29b-41d4-a716-446655440060', NULL, 'Warszawa', 'Polska', 'Różana');

INSERT INTO locals (margin_fee, rental_fee, size, state, created_at, modified_at, version, address_id, created_by, id, modified_by, owner_id, name, description)
VALUES
    (10.50, 1000.00, 50, 3, '2023-01-01 12:00:00', '2023-01-01 12:00:00', 1, '550e8400-e29b-41d4-a716-446655440000', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440002', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Uczta filozofów', 'Pięciu filozofów bije się o widelce?'),
    (12.00, 1200.00, 60, 2, '2023-01-02 13:00:00', '2023-01-02 13:00:00', 1, '550e8400-e29b-41d4-a716-446655440005', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440007', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Ciepły zakątek', 'Przytulne miejsce na nocleg'),
    (15.00, 1500.00, 70, 4, '2023-01-03 14:00:00', '2023-01-03 14:00:00', 1, '550e8400-e29b-41d4-a716-446655440010', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440012', null, null, 'Na Różanej', 'Przytulne miejsce na nocleg'),
    (20.00, 2000.00, 80, 1, '2023-01-04 15:00:00', '2023-01-04 15:00:00', 1, '550e8400-e29b-41d4-a716-446655440015', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440017', null, null, 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 5, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440020', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440022', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 5, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440025', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440025', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla emerytów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 5, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440030', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440028', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 5, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440035', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440031', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 2, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440040', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440032', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 2, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440045', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440033', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 2, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440050', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440034', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 2, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440055', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440035', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg'),
    (25.00, 2500.00, 90, 2, '2023-01-05 16:00:00', '2023-01-05 16:00:00', 1, '550e8400-e29b-41d4-a716-446655440060', '397cf3c5-f369-4783-9892-6fc781fd2b0d', '550e8400-e29b-41d4-a716-446655440036', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', 'Lokal idealny dla studentów', 'Przytulne miejsce na nocleg');

-- Rent 1
INSERT INTO rents (balance, end_date, start_date, created_at, modified_at, version, created_by, id, local_id, modified_by, owner_id, tenant_id)
VALUES (1000.00, '2024-06-23', '2024-01-01', '2023-01-01 12:00:0', '2023-01-01 12:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'a1111111-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440025', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '4b329d71-2a92-4e90-8f0b-f673e4f79529');
VALUES (1000.00, '2024-06-30', '2024-01-01', '2023-01-01 12:00:0', '2023-01-01 12:00:0', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'a1111111-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440022', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '4b329d71-2a92-4e90-8f0b-f673e4f79529');

-- Rent 2
INSERT INTO rents (balance, end_date, start_date, created_at, modified_at, version, created_by, id, local_id, modified_by, owner_id, tenant_id)
VALUES (1200.00, '2024-06-16', '2024-01-02', '2023-01-02 13:00:00', '2023-01-02 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'a2222222-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440028', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '4b329d71-2a92-4e90-8f0b-f673e4f79529');

-- Rent 3
INSERT INTO rents (balance, end_date, start_date, created_at, modified_at, version, created_by, id, local_id, modified_by, owner_id, tenant_id)
VALUES (1500.00, '2024-04-03', '2024-01-03', '2023-01-03 14:00:00', '2023-01-03 14:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'a3333333-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440031', null, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '4b329d71-2a92-4e90-8f0b-f673e4f79529');
-- Additional Fixed Fees for Rent 1
INSERT INTO fixed_fees (date, margin_fee, rental_fee, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    ('2024-01-01', 15.00, 95.00, '2023-01-01 12:40:00', '2023-01-01 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff1a1114-e29b-41d4-a716-446655440001', null, 'a1111111-e29b-41d4-a716-446655440000'),
    ('2024-02-01', 7.50, 47.50, '2023-01-01 12:50:00', '2023-01-01 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff1a1115-e29b-41d4-a716-446655440001', null, 'a1111111-e29b-41d4-a716-446655440000'),
    ('2024-03-01', 10.00, 67.00, '2023-01-01 13:00:00', '2023-01-01 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff1a1116-e29b-41d4-a716-446655440001', null, 'a1111111-e29b-41d4-a716-446655440000');

-- Additional Fixed Fees for Rent 2
INSERT INTO fixed_fees (date, margin_fee, rental_fee, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    ('2024-01-02', 18.00, 112.00, '2023-01-02 12:40:00', '2023-01-02 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff2a1114-e29b-41d4-a716-446655440002', null, 'a2222222-e29b-41d4-a716-446655440000'),
    ('2024-02-02', 9.00, 56.00, '2023-01-02 12:50:00', '2023-01-02 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff2a1115-e29b-41d4-a716-446655440002', null, 'a2222222-e29b-41d4-a716-446655440000'),
    ('2024-03-02', 12.00, 70.00, '2023-01-02 13:00:00', '2023-01-02 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff2a1116-e29b-41d4-a716-446655440002', null, 'a2222222-e29b-41d4-a716-446655440000');

-- Additional Fixed Fees for Rent 3
INSERT INTO fixed_fees (date, margin_fee, rental_fee, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    ('2024-04-03', 21.00, 119.00, '2023-01-03 12:40:00', '2023-01-03 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff3a1114-e29b-41d4-a716-446655440003', null, 'a3333333-e29b-41d4-a716-446655440000'),
    ('2024-05-03', 10.50, 64.50, '2023-01-03 12:50:00', '2023-01-03 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff3a1115-e29b-41d4-a716-446655440003', null, 'a3333333-e29b-41d4-a716-446655440000'),
    ('2024-06-03', 13.50, 78.50, '2023-01-03 13:00:00', '2023-01-03 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'ff3a1116-e29b-41d4-a716-446655440003', null, 'a3333333-e29b-41d4-a716-446655440000');

-- Additional fixed fees follow the same pattern for remaining rents...


-- Payments for Rent 1
INSERT INTO payments (amount, created_at, modified_at, version, created_by, id, modified_by, rent_id, date)
VALUES
    (300.00, '2023-01-10 12:10:00', '2023-01-10 12:10:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '659451d2-283b-4f45-b0d3-6b3d01ce1610', null, 'a1111111-e29b-41d4-a716-446655440000', '2024-01-08'),
    (400.00, '2023-01-15 12:20:00', '2023-01-15 12:20:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '1fb46985-bff4-492f-a403-6a7fada1c192', null, 'a1111111-e29b-41d4-a716-446655440000', '2024-01-16'),
    (300.00, '2023-01-20 12:30:00', '2023-01-20 12:30:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'a64e6501-68ed-4be0-a49b-37f05d5538ef', null, 'a1111111-e29b-41d4-a716-446655440000', '2024-01-23');

-- Payments for Rent 2
INSERT INTO payments (amount, created_at, modified_at, version, created_by, id, modified_by, rent_id, date)
VALUES
    (400.00, '2023-01-11 12:10:00', '2023-01-11 12:10:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '56aad039-f835-43b1-b99b-5d6cb54b0e7b', null, 'a2222222-e29b-41d4-a716-446655440000', '2024-01-11'),
    (400.00, '2023-01-16 12:20:00', '2023-01-16 12:20:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '43dd70c4-c85d-4b1c-b877-c1df995bef84', null, 'a2222222-e29b-41d4-a716-446655440000', '2024-01-16'),
    (400.00, '2023-01-21 12:30:00', '2023-01-21 12:30:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'f41fce24-0662-4d2f-8a15-3c3aa21b34f5', null, 'a2222222-e29b-41d4-a716-446655440000', '2024-01-21');

-- Payments for Rent 3
INSERT INTO payments (amount, created_at, modified_at, version, created_by, id, modified_by, rent_id, date)
VALUES
    (500.00, '2023-01-12 12:10:00', '2023-01-12 12:10:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '9dc038a5-bf01-4869-8e15-c9b1f0c0e884', null, 'a3333333-e29b-41d4-a716-446655440000', '2024-01-12'),
    (500.00, '2023-01-17 12:20:00', '2023-01-17 12:20:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '7d78be21-120b-47fa-bab3-e257039a8149', null, 'a3333333-e29b-41d4-a716-446655440000', '2024-01-17'),
    (500.00, '2023-01-22 12:30:00', '2023-01-22 12:30:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '8a38fdd6-a596-461e-a85e-ad022a73e76e', null, 'a3333333-e29b-41d4-a716-446655440000', '2024-01-22');

-- Additional payments follow the same pattern for remaining rents...
-- Additional Payments for Rent 1
INSERT INTO payments (amount, created_at, modified_at, version, created_by, id, modified_by, rent_id, date)
VALUES
    (310.00, '2023-01-25 12:40:00', '2023-01-25 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '25569df6-6cc8-4350-ac3e-5a04616d5d12', null, 'a1111111-e29b-41d4-a716-446655440000', '2024-01-25'),
    (410.00, '2023-01-30 12:50:00', '2023-01-30 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'c099836b-d620-4144-9ad4-1040023ba4f8', null, 'a1111111-e29b-41d4-a716-446655440000', '2024-01-30'),
    (310.00, '2023-02-05 13:00:00', '2023-02-05 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '994ab228-102c-4def-a696-9ab0aebf757b', null, 'a1111111-e29b-41d4-a716-446655440000', '2024-02-05');

-- Additional Payments for Rent 2
INSERT INTO payments (amount, created_at, modified_at, version, created_by, id, modified_by, rent_id, date)
VALUES
    (420.00, '2023-01-26 12:40:00', '2023-01-26 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '071b5f5b-3eb5-47b0-82c6-85b5ec49c63b', null, 'a2222222-e29b-41d4-a716-446655440000', '2024-01-26'),
    (420.00, '2023-01-31 12:50:00', '2023-01-31 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'f3781f64-1970-467d-828d-6f724be6cce5', null, 'a2222222-e29b-41d4-a716-446655440000', '2024-01-31'),
    (420.00, '2023-02-06 13:00:00', '2023-02-06 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '59f20709-cf92-476f-a4b3-0d9362aec916', null, 'a2222222-e29b-41d4-a716-446655440000', '2024-02-06');
-- Additional Payments for Rent 3
INSERT INTO payments (amount, created_at, modified_at, version, created_by, id, modified_by, rent_id, date)
VALUES
    (530.00, '2023-01-27 12:40:00', '2023-01-27 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'b78f92ad-3ec9-4270-86b2-ede94d2e7aa5', null, 'a3333333-e29b-41d4-a716-446655440000', '2024-01-27'),
    (530.00, '2023-02-01 12:50:00', '2023-02-01 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '679f1b4f-64f2-4f2f-b08e-0879516615fb', null, 'a3333333-e29b-41d4-a716-446655440000', '2024-02-01'),
    (530.00, '2023-02-07 13:00:00', '2023-02-07 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '84081b9e-41cb-4b33-ab38-2a3af6b5a780', null, 'a3333333-e29b-41d4-a716-446655440000', '2024-02-07');

-- Additional payments follow the same pattern for remaining rents...

-- Additional Variable Fees for Rent 1
INSERT INTO variable_fees (amount, date, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    (15.00, '2024-01-01', '2023-01-01 12:40:00', '2023-01-01 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'eca37199-fe8b-409e-9346-c3d798b9f3ad', null, 'a1111111-e29b-41d4-a716-446655440000'),
    (7.50, '2024-02-01', '2023-01-01 12:50:00', '2023-01-01 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '4796fb20-dcf8-4ad8-bd36-9db10b7fbc66', null, 'a1111111-e29b-41d4-a716-446655440000'),
    (10.00, '2024-03-01', '2023-01-01 13:00:00', '2023-01-01 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '1faf1d81-4716-40df-95fb-e2327493559b', null, 'a1111111-e29b-41d4-a716-446655440000');

-- Additional Variable Fees for Rent 2
INSERT INTO variable_fees (amount, date, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    (18.00, '2024-02-02', '2023-01-02 12:40:00', '2023-01-02 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '48ef2f1f-f1a1-462d-9537-d14ad551de4b', null, 'a2222222-e29b-41d4-a716-446655440000'),
    (9.00, '2024-03-02', '2023-01-02 12:50:00', '2023-01-02 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '10ea5949-b7be-4018-b41d-f21e7fdd55c1', null, 'a2222222-e29b-41d4-a716-446655440000'),
    (12.00, '2024-04-02', '2023-01-02 13:00:00', '2023-01-02 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '1e391d79-afb8-48d2-82cf-b55f12b3296b', null, 'a2222222-e29b-41d4-a716-446655440000');

-- Additional Variable Fees for Rent 3
INSERT INTO variable_fees (amount, date, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    (21.00, '2024-04-03', '2023-01-03 12:40:00', '2023-01-03 12:40:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', '10076d55-7cff-4648-9458-035347737ca1', null, 'a3333333-e29b-41d4-a716-446655440000'),
    (10.50, '2024-05-03', '2023-01-03 12:50:00', '2023-01-03 12:50:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'd6f388ff-1381-4aae-b73f-b624ecd73791', null, 'a3333333-e29b-41d4-a716-446655440000'),
    (13.50, '2024-06-03', '2023-01-03 13:00:00', '2023-01-03 13:00:00', 1, 'd42d399a-59cd-4895-a48c-4a3b2a9e46d1', 'c6e1ecaf-5545-4510-8387-65af92a0e716', null, 'a3333333-e29b-41d4-a716-446655440000');

-- Additional variable fees follow the same pattern for remaining rents...
-- Applications
INSERT INTO applications
(id, tenant_id, local_id, created_at, modified_at, version, created_by, modified_by)
VALUES
    ('a1d11111-e29b-41d4-a716-446655440000', '4b329d71-2a92-4e90-8f0b-f673e4f79529', '550e8400-e29b-41d4-a716-446655440032', '2024-01-01 10:00:00', '2024-01-01 10:00:00', 1, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '397cf3c5-f369-4783-9892-6fc781fd2b0d'),
    ('a2d22222-e29b-41d4-a716-446655440000', '4b329d71-2a92-4e90-8f0b-f673e4f79529', '550e8400-e29b-41d4-a716-446655440033', '2024-01-02 11:00:00', '2024-01-02 11:00:00', 1, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '397cf3c5-f369-4783-9892-6fc781fd2b0d'),
    ('a3d33333-e29b-41d4-a716-446655440000', '4b329d71-2a92-4e90-8f0b-f673e4f79529', '550e8400-e29b-41d4-a716-446655440034', '2024-01-03 12:00:00', '2024-01-03 12:00:00', 1, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '397cf3c5-f369-4783-9892-6fc781fd2b0d'),
    ('a4d44444-e29b-41d4-a716-446655440000', '4b329d71-2a92-4e90-8f0b-f673e4f79529', '550e8400-e29b-41d4-a716-446655440035', '2024-01-04 13:00:00', '2024-01-04 13:00:00', 1, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '397cf3c5-f369-4783-9892-6fc781fd2b0d'),
    ('a4d44446-e29b-41d4-a716-446655440000', '4b329d71-2a92-4e90-8f0b-f673e4f79529', '550e8400-e29b-41d4-a716-446655440036', '2024-01-04 13:00:00', '2024-01-04 13:00:00', 1, '397cf3c5-f369-4783-9892-6fc781fd2b0d', '397cf3c5-f369-4783-9892-6fc781fd2b0d');


INSERT INTO users (id, login, password, blocked, verified, login_attempts, version, language, created_at,
                          modified_at, created_by, modified_by, active)
VALUES ('e872ce90-734b-49a9-8949-dde4753b8864', 'admin2', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.',
        false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true);
INSERT INTO personal_data (user_id, email, temp_email, first_name, last_name)
VALUES ('e872ce90-734b-49a9-8949-dde4753b8864', 'admin2@mail.com', null, 'Admin', 'Admin');
INSERT INTO access_levels (id, user_id, level, active, version, created_at, modified_at, created_by, modified_by)
VALUES ('2dbe6d57-54ca-4662-96b4-149d72a8ab44', 'e872ce90-734b-49a9-8949-dde4753b8864', 'ADMINISTRATOR', true, 0, NOW(),
        NOW(), null, null);
INSERT INTO administrators (id)
VALUES ('2dbe6d57-54ca-4662-96b4-149d72a8ab44');

INSERT INTO users (id, login, password, blocked, verified, login_attempts, version, language, created_at,
                   modified_at, created_by, modified_by, active)
VALUES
    ('1a3c1633-e786-4442-9314-9101445202a5', 'lilia.malinowski', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('b92efb2f-fc9e-48ab-a4e3-8bbffbf0115f', 'martyna.przybysz', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('0aabaf48-7ddd-4ab8-aa80-7d61c2134d96', 'nadzieja.słowik', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('d33ba50f-01b7-49b5-8873-fbf03c0f73e0', 'wilfryd.michałek', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('1a5ca23e-d1b2-4798-bc5f-60b9269e0e49', 'wilhelmina.paszkowski', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('de3e07f6-a716-4425-bc76-e99c44ad3d6e', 'eleonora.piątkowski', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('6058a23a-2fa0-420c-8ade-31e6d59fc89e', 'emil.jaśkiewicz', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('94e7e03a-843d-466e-a2e6-1e72565a2f2a', 'artur.pilch', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('e96ec3fd-0a11-4a27-8564-4683822965db', 'oliwier.chmura', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('6e97f7b6-7660-4ef7-9320-1bfe82f295d4', 'gilbert.drabik', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('f1034937-d423-464a-8186-36737b7940d9', 'sylwia.gil', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('843221ef-121f-4f36-bc81-05a15349b1cd', 'maksymilian.rogala', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('9d3f2530-f0ec-478f-87ef-4ad07fa65a02', 'hugo.kaniewski', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true);

INSERT INTO personal_data (user_id, email, temp_email, first_name, last_name)
VALUES
    ('1a3c1633-e786-4442-9314-9101445202a5', '242396@edu.p.lodz.pl', null, 'Lilia', 'Malinowski'),
    ('b92efb2f-fc9e-48ab-a4e3-8bbffbf0115f', 'kozakonrad72@gmail.com', null, 'Martyna', 'Przybysz'),
    ('0aabaf48-7ddd-4ab8-aa80-7d61c2134d96', 'nadzieja.słowik@mail.com', null, 'Nadzieja', 'Słowik'),
    ('d33ba50f-01b7-49b5-8873-fbf03c0f73e0', 'wilfryd.michałek@mail.com', null, 'Wilfryd', 'Michałek'),
    ('1a5ca23e-d1b2-4798-bc5f-60b9269e0e49', 'wilhelmina.paszkowski@mail.com', null, 'Wilhelmina', 'Paszkowski'),
    ('de3e07f6-a716-4425-bc76-e99c44ad3d6e', 'eleonora.piątkowski@mail.com', null, 'Eleonora', 'Piątkowski'),
    ('6058a23a-2fa0-420c-8ade-31e6d59fc89e', 'emil.jaśkiewicz@mail.com', null, 'Emil', 'Jaśkiewicz'),
    ('94e7e03a-843d-466e-a2e6-1e72565a2f2a', 'artur.pilch@mail.com', null, 'Artur', 'Pilch'),
    ('e96ec3fd-0a11-4a27-8564-4683822965db', 'oliwier.chmura@mail.com', null, 'Oliwier', 'Chmura'),
    ('6e97f7b6-7660-4ef7-9320-1bfe82f295d4', 'gilbert.drabik@mail.com', null, 'Gilbert', 'Drabik'),
    ('f1034937-d423-464a-8186-36737b7940d9', '242352@edu.p.lodz.pl', null, 'Sylwia', 'Gil'),
    ('843221ef-121f-4f36-bc81-05a15349b1cd', 'maksymilian.rogala@mail.com', null, 'Maksymilian', 'Rogala'),
    ('9d3f2530-f0ec-478f-87ef-4ad07fa65a02', 'konradkoza@interia.eu', null, 'Hugo', 'Kaniewski');

INSERT INTO access_levels (id, user_id, level, active, version, created_at, modified_at, created_by, modified_by)
VALUES
    ('98059a16-1119-4b93-aaeb-247cd43e3845', '1a3c1633-e786-4442-9314-9101445202a5', 'OWNER', true, 0, NOW(), NOW(), null, null),
    ('9a262260-c6a3-448d-b1af-91645e4180e3', 'b92efb2f-fc9e-48ab-a4e3-8bbffbf0115f', 'OWNER', true, 0, NOW(), NOW(), null, null),
    ('0a9c494a-2698-4062-a2d7-c465c74f7176', '0aabaf48-7ddd-4ab8-aa80-7d61c2134d96', 'OWNER', true, 0, NOW(), NOW(), null, null),
    ('bb000ec1-4539-43ec-b16c-54542bcbb900', 'd33ba50f-01b7-49b5-8873-fbf03c0f73e0', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('0b5f6817-b6bc-4767-b013-4cd46085934a', '1a5ca23e-d1b2-4798-bc5f-60b9269e0e49', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('fd6edb90-9c11-47ef-bb3c-16579ba93054', 'de3e07f6-a716-4425-bc76-e99c44ad3d6e', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('eee524d1-6002-40ae-af80-9e6f2a6309cc', '6058a23a-2fa0-420c-8ade-31e6d59fc89e', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('3c0eb2aa-6051-4ff2-872b-074582388462', '94e7e03a-843d-466e-a2e6-1e72565a2f2a', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('d20ed189-a4cc-474a-ad74-565a1f3f494d', 'e96ec3fd-0a11-4a27-8564-4683822965db', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('2b66e0be-5852-410a-8f0a-a13644b3cd9b', '6e97f7b6-7660-4ef7-9320-1bfe82f295d4', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('f5d5967a-b2d1-46e0-8125-5a14e1f3f842', 'f1034937-d423-464a-8186-36737b7940d9', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('e5248ae1-bcb8-46ca-899f-bdcd567bc677', '843221ef-121f-4f36-bc81-05a15349b1cd', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('e53df750-6b6b-4f4d-8f11-6a617837e37b', '9d3f2530-f0ec-478f-87ef-4ad07fa65a02', 'TENANT', true, 0, NOW(), NOW(), null, null);

INSERT INTO owners (id)
VALUES
    ('98059a16-1119-4b93-aaeb-247cd43e3845'),
    ('9a262260-c6a3-448d-b1af-91645e4180e3'),
    ('0a9c494a-2698-4062-a2d7-c465c74f7176');

INSERT INTO tenants (id)
VALUES
    ('bb000ec1-4539-43ec-b16c-54542bcbb900'),
    ('0b5f6817-b6bc-4767-b013-4cd46085934a'),
    ('fd6edb90-9c11-47ef-bb3c-16579ba93054'),
    ('eee524d1-6002-40ae-af80-9e6f2a6309cc'),
    ('3c0eb2aa-6051-4ff2-872b-074582388462'),
    ('d20ed189-a4cc-474a-ad74-565a1f3f494d'),
    ('2b66e0be-5852-410a-8f0a-a13644b3cd9b'),
    ('f5d5967a-b2d1-46e0-8125-5a14e1f3f842'),
    ('e5248ae1-bcb8-46ca-899f-bdcd567bc677'),
    ('e53df750-6b6b-4f4d-8f11-6a617837e37b');

INSERT INTO addresses (created_at, modified_at, version, number, zip, created_by, id, modified_by, city, country, street)
VALUES
    (NOW(), NOW(), 0, '4191', '57-175', null, '16f6ca25-9263-4483-a815-0fe040395f33', null, 'Pionki', 'Polska', 'al. Ptak'),
    (NOW(), NOW(), 0, '14403', '14-235', null, 'e790908a-ddf2-4af6-9f6e-885e31b2367a', null, 'Otmuchów', 'Polska', 'al. Buczkowski'),
    (NOW(), NOW(), 0, '0512', '64-177', null, '694aa07d-92c3-44f0-a923-8ea686a9af6b', null, 'Lubień Kujawski', 'Polska', 'al. Buczkowski'),
    (NOW(), NOW(), 0, '2604', '29-124', null, 'b1f286a3-7c22-4ba7-8802-fa8c12eb6b82', null, 'Czechowice-Dziedzice', 'Polska', 'al. Górka'),
    (NOW(), NOW(), 0, '2652', '48-937', null, 'd0ec4f33-7ac6-4482-b617-e4e5f9f4a1ac', null, 'Legionowo', 'Polska', 'al. Czapla'),
    (NOW(), NOW(), 0, '47871', '00-340', null, '4b970726-70ca-4921-9da6-8cb2d32144f3', null, 'Mikołajki', 'Polska', 'al. Budzyński'),
    (NOW(), NOW(), 0, '5359', '45-671', null, 'bc9d1e18-69be-4d5a-8965-5a37fa71db3d', null, 'Wadowice', 'Polska', 'ul. Prus'),
    (NOW(), NOW(), 0, '5340', '29-452', null, 'e005c611-ca3b-459e-ac53-e398707e6184', null, 'Lublin', 'Polska', 'ul. Milewski'),
    (NOW(), NOW(), 0, '907', '86-059', null, '8d6cea94-6e3f-4b71-9804-045d6f0e18e0', null, 'Gniewkowo', 'Polska', 'al. Andrzejczak'),
    (NOW(), NOW(), 0, '12625', '42-955', null, '99fa7f04-13aa-410f-90ec-1b0f0afc9285', null, 'Jawor', 'Polska', 'ul. Kwiecień');

INSERT INTO locals (margin_fee, rental_fee, size, state, created_at, modified_at, version, address_id, created_by, id, modified_by, owner_id, name, description)
VALUES
    (473.00, 463.00, 50, 2, NOW(), NOW(), 1, '16f6ca25-9263-4483-a815-0fe040395f33', null, '035e16a3-4ba9-4797-9e79-bbba3490fe72', null, '0a9c494a-2698-4062-a2d7-c465c74f7176', 'Restauracja na rogu', 'Przestronna restauracja z nowoczesnym wystrojem, idealna na rodzinne obiady i spotkania biznesowe.'),
    (349.00, 111.00, 30, 2, NOW(), NOW(), 1, 'e790908a-ddf2-4af6-9f6e-885e31b2367a', null, '6b4e697e-0047-4d41-9a61-219f899ab07d', null, '0a9c494a-2698-4062-a2d7-c465c74f7176', 'Kawiarnia u Ani', 'Urokliwa kawiarnia serwująca pyszne ciasta i aromatyczną kawę. Idealne miejsce na spotkanie z przyjaciółmi.'),
    (280.00, 499.00, 28, 2, NOW(), NOW(), 1, '694aa07d-92c3-44f0-a923-8ea686a9af6b', null, 'b7aa7958-0cae-41eb-9e78-b2bb099bd69e', null, '9a262260-c6a3-448d-b1af-91645e4180e3', 'Kwiaciarnia Róża', 'Kwiaciarnia oferująca szeroki wybór świeżych kwiatów i bukietów na każdą okazję.'),
    (337.00, 172.00, 57, 2, NOW(), NOW(), 1, 'b1f286a3-7c22-4ba7-8802-fa8c12eb6b82', null, '5098af89-77dc-4f33-99d0-9a44b8684adf', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'Księgarnia Literacka', 'Księgarnia z bogatą ofertą książek różnych gatunków, organizująca regularne spotkania autorskie i warsztaty literackie.'),
    (228.00, 423.00, 41, 3, NOW(), NOW(), 1, 'd0ec4f33-7ac6-4482-b617-e4e5f9f4a1ac', null, '19defd3d-8cbb-47cd-a9bc-4e6316b0e1e2', null, '9a262260-c6a3-448d-b1af-91645e4180e3', 'Salon fryzjerski Glamour', 'Ekskluzywny salon fryzjerski oferujący pełen zakres usług fryzjerskich oraz zabiegi pielęgnacyjne.'),
    (312.00, 368.00, 21, 3, NOW(), NOW(), 1, '4b970726-70ca-4921-9da6-8cb2d32144f3', null, '7319f2a8-3845-4466-9237-5c38a0f577b3', null, '0a9c494a-2698-4062-a2d7-c465c74f7176', 'Butik Modna', 'Stylowy butik oferujący najnowsze kolekcje odzieży i akcesoriów dla kobiet ceniących sobie elegancję i modę.'),
    (450.00, 216.00, 102, 3, NOW(), NOW(), 1, 'bc9d1e18-69be-4d5a-8965-5a37fa71db3d', null, '9c277f68-71e4-4e6e-90bc-c7d226d6a07d', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'Studio fitness Forma', 'Nowoczesne studio fitness oferujące szeroki zakres zajęć grupowych oraz treningi personalne.'),
    (116.00, 189.00, 33, 2, NOW(), NOW(), 1, 'e005c611-ca3b-459e-ac53-e398707e6184', null, '1b19bb29-798a-42be-9450-7072e159342e', null, '9a262260-c6a3-448d-b1af-91645e4180e3', 'Galeria Sztuki Nowoczesnej', 'Galeria prezentująca prace współczesnych artystów, organizująca wystawy oraz warsztaty artystyczne.'),
    (123.00, 411.00, 72, 2, NOW(), NOW(), 1, '8d6cea94-6e3f-4b71-9804-045d6f0e18e0', null, '7d6ca85f-84d7-47fe-bfbf-3fbcf7eaa93c', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'Klub muzyczny Nocny Ptak', 'Popularny klub muzyczny z regularnymi koncertami na żywo i imprezami tematycznymi.'),
    (401.00, 159.00, 38, 3, NOW(), NOW(), 1, '99fa7f04-13aa-410f-90ec-1b0f0afc9285', null, '1a22b980-40aa-4e60-a97e-7d84d54ebd82', null, '0a9c494a-2698-4062-a2d7-c465c74f7176', 'Centrum Medyczne Zdrowie', 'Kompleksowe centrum medyczne oferujące szeroki zakres usług zdrowotnych, w tym konsultacje specjalistów, badania diagnostyczne i rehabilitację.');

INSERT INTO rents (balance, end_date, start_date, created_at, modified_at, version, created_by, id, local_id, modified_by, owner_id, tenant_id)
VALUES
    (0.00, '2019-09-22', '2019-06-17', NOW(), NOW(), 0, null, '2300d87f-e253-4c59-a650-c39b8195c8fd', '7d6ca85f-84d7-47fe-bfbf-3fbcf7eaa93c', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'f5d5967a-b2d1-46e0-8125-5a14e1f3f842'),
    (0.00, '2020-02-23', '2019-10-22', NOW(), NOW(), 0, null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c', '7d6ca85f-84d7-47fe-bfbf-3fbcf7eaa93c', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'fd6edb90-9c11-47ef-bb3c-16579ba93054'),

    (0.00, '2022-09-18', '2022-06-17', NOW(), NOW(), 0, null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f', '1a22b980-40aa-4e60-a97e-7d84d54ebd82', null, '0a9c494a-2698-4062-a2d7-c465c74f7176', '2b66e0be-5852-410a-8f0a-a13644b3cd9b'),

    (0.00, '2022-11-20', '2022-06-17', NOW(), NOW(), 0, null, '21b5e894-4715-4608-960d-9441f758b4f3', 'b7aa7958-0cae-41eb-9e78-b2bb099bd69e', null, '9a262260-c6a3-448d-b1af-91645e4180e3', '0b5f6817-b6bc-4767-b013-4cd46085934a'),

    (0.00, '2019-09-22', '2019-06-17', NOW(), NOW(), 0, null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031', '7d6ca85f-84d7-47fe-bfbf-3fbcf7eaa93c', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'fd6edb90-9c11-47ef-bb3c-16579ba93054'),
    (0.00, '2020-02-23', '2019-10-22', NOW(), NOW(), 0, null, 'edb129ba-3974-40da-98b3-d112e68ba19a', '7d6ca85f-84d7-47fe-bfbf-3fbcf7eaa93c', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'eee524d1-6002-40ae-af80-9e6f2a6309cc'),

    (0.00, '2019-10-20', '2019-06-17', NOW(), NOW(), 0, null, '70cb0657-f9d2-4aa7-9f09-a84825011326', '5098af89-77dc-4f33-99d0-9a44b8684adf', null, '98059a16-1119-4b93-aaeb-247cd43e3845', '2b66e0be-5852-410a-8f0a-a13644b3cd9b'),
    (0.00, '2020-03-22', '2019-11-20', NOW(), NOW(), 0, null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b', '5098af89-77dc-4f33-99d0-9a44b8684adf', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'eee524d1-6002-40ae-af80-9e6f2a6309cc'),

    (0.00, '2022-11-20', '2022-06-17', NOW(), NOW(), 0, null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b', '5098af89-77dc-4f33-99d0-9a44b8684adf', null, '98059a16-1119-4b93-aaeb-247cd43e3845', 'bb000ec1-4539-43ec-b16c-54542bcbb900'),

    (0.00, '2019-10-20', '2019-06-17', NOW(), NOW(), 0, null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74', '19defd3d-8cbb-47cd-a9bc-4e6316b0e1e2', null, '9a262260-c6a3-448d-b1af-91645e4180e3', 'd20ed189-a4cc-474a-ad74-565a1f3f494d'),
    (0.00, '2020-04-26', '2019-11-20', NOW(), NOW(), 0, null, '07e6f3de-c3d3-404a-93bf-116c59b76794', '19defd3d-8cbb-47cd-a9bc-4e6316b0e1e2', null, '9a262260-c6a3-448d-b1af-91645e4180e3', 'eee524d1-6002-40ae-af80-9e6f2a6309cc'),

    (0.00, '2019-10-20', '2019-06-17', NOW(), NOW(), 0, null, 'c9634491-d322-4283-aff5-52d6bb5d84da', 'b7aa7958-0cae-41eb-9e78-b2bb099bd69e', null, '9a262260-c6a3-448d-b1af-91645e4180e3', 'e53df750-6b6b-4f4d-8f11-6a617837e37b'),
    (0.00, '2020-04-26', '2019-12-20', NOW(), NOW(), 0, null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b', 'b7aa7958-0cae-41eb-9e78-b2bb099bd69e', null, '9a262260-c6a3-448d-b1af-91645e4180e3', '3c0eb2aa-6051-4ff2-872b-074582388462');


INSERT INTO payments (amount, date, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    (633.00, '2019-06-18', NOW(), NOW(), 0, null, 'ecd8b505-b555-4912-b169-458526e94b02', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (641.00, '2019-06-25', NOW(), NOW(), 0, null, '3e9bfbc6-80af-45db-a6e8-fbf6a808a286', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (627.00, '2019-07-02', NOW(), NOW(), 0, null, 'df5aecb9-7e22-4f05-827f-cc013edd8e92', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (635.00, '2019-07-09', NOW(), NOW(), 0, null, 'af0399ca-1131-4a1b-8c6f-60694f553710', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (641.00, '2019-07-16', NOW(), NOW(), 0, null, 'a76b3a9e-6665-41e3-b729-f55d11b5af96', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (637.00, '2019-07-23', NOW(), NOW(), 0, null, '11a228ed-6968-419d-8c8d-7e52cd4a371b', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (634.00, '2019-07-30', NOW(), NOW(), 0, null, '3443c373-86fc-43ff-b9cc-3469ac76fce6', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (636.00, '2019-08-06', NOW(), NOW(), 0, null, '5918f101-c9c4-4169-8b21-ff92bada79b1', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (627.00, '2019-08-13', NOW(), NOW(), 0, null, '27a6d3e5-4eca-4829-a3eb-b357a55df5cb', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (624.00, '2019-08-20', NOW(), NOW(), 0, null, '4258d32b-c39c-4154-8f6a-dd635a5fa297', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (633.00, '2019-08-27', NOW(), NOW(), 0, null, '87097733-83bd-4b08-9854-4cb5cbd5c48d', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (634.00, '2019-09-03', NOW(), NOW(), 0, null, '197fe356-9741-4219-95be-3f485f51e589', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (625.00, '2019-09-10', NOW(), NOW(), 0, null, '5af3c40e-627a-463c-aec3-b67b986edb54', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (626.00, '2019-09-17', NOW(), NOW(), 0, null, 'efab8bbb-ffe0-47d1-b7c9-b676379a8cf0', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (632.00, '2019-10-23', NOW(), NOW(), 0, null, 'eb376b09-21c9-47cc-b231-26424217a196', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (639.00, '2019-10-30', NOW(), NOW(), 0, null, '29b89777-0ee6-46e1-b007-95ea3f97a029', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (659.00, '2019-11-06', NOW(), NOW(), 0, null, '0ec78c72-0845-4c0e-a7f8-3f399ff477c0', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (659.00, '2019-11-13', NOW(), NOW(), 0, null, 'ccba2bff-c78a-4fb2-8dab-42f8611f9f9a', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (667.00, '2019-11-20', NOW(), NOW(), 0, null, '6566662d-d8d2-403c-bdab-e72e2220c87b', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (685.00, '2019-11-27', NOW(), NOW(), 0, null, '1090f2c6-6501-4db7-a566-c4226679136a', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (698.00, '2019-12-04', NOW(), NOW(), 0, null, 'bc1614f0-4d43-4f1d-ac6f-828d665a6b3e', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (714.00, '2019-12-11', NOW(), NOW(), 0, null, '5c4ee102-92f2-4d5b-b3e2-597e8e4f68d1', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (721.00, '2019-12-18', NOW(), NOW(), 0, null, 'cab6657b-16ff-44eb-b08f-ee8f7c7bf055', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (743.00, '2019-12-25', NOW(), NOW(), 0, null, '9d357f76-5e58-4b84-bcc1-b3d9fd4039a5', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (759.00, '2020-01-01', NOW(), NOW(), 0, null, '142347fa-8ef6-42e9-8ea3-8c1062ed6019', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (763.00, '2020-01-08', NOW(), NOW(), 0, null, '1f0c1fea-c054-4956-af77-fc11cca38f27', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (790.00, '2020-01-15', NOW(), NOW(), 0, null, '1497f1c5-398a-4d18-82f5-4891752f8593', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (797.00, '2020-01-22', NOW(), NOW(), 0, null, '70e372fb-db6c-4759-8f69-bcf6bc45ad3d', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (815.00, '2020-01-29', NOW(), NOW(), 0, null, '0588d0ab-09c5-4fe9-a359-e2e2199c2bdd', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (845.00, '2020-02-05', NOW(), NOW(), 0, null, '2d0dee96-6207-480f-8cb8-29135d960db9', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (849.00, '2020-02-12', NOW(), NOW(), 0, null, 'd59a24b2-4a2b-4552-a1d9-20ec41b28420', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (877.00, '2020-02-19', NOW(), NOW(), 0, null, '9c72c9bf-2c11-493d-8d04-5e6a2cdcea9e', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),

    (879.00, '2022-06-18', NOW(), NOW(), 0, null, '410d8d9c-6a59-46f4-b939-648b5ae0f99c', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (890.00, '2022-06-25', NOW(), NOW(), 0, null, '5e2f89d3-b6dc-4bff-b9dd-01539bac8d4d', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (933.00, '2022-07-02', NOW(), NOW(), 0, null, '9e1695b1-5390-4a81-b926-5555bd6a6b5e', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (927.00, '2022-07-09', NOW(), NOW(), 0, null, '1ae0c96d-1470-41e9-9dda-e246ba75a44d', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (936.00, '2022-07-16', NOW(), NOW(), 0, null, '5fbb6b28-75b4-4611-a480-484bb1ce192f', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (996.00, '2022-07-23', NOW(), NOW(), 0, null, '3779d494-7f02-4b26-b9a1-e284178839af', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (1024.00, '2022-07-30', NOW(), NOW(), 0, null, 'd16021ab-38ea-46bf-8859-357816544e8f', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (997.00, '2022-08-06', NOW(), NOW(), 0, null, '8d5d93a1-015f-4033-beed-5e54c05ddea2', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (995.00, '2022-08-13', NOW(), NOW(), 0, null, '14aa1c13-0991-4a62-8030-7a3bb46d3f58', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (1080.00, '2022-08-20', NOW(), NOW(), 0, null, '377674df-1022-4592-8ba6-14add897514b', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (1040.00, '2022-08-27', NOW(), NOW(), 0, null, '57f5e5b0-b297-4c3b-94c6-01ed97e70e07', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (1069.00, '2022-09-03', NOW(), NOW(), 0, null, 'aecddf80-ad28-4697-bcee-f6afb4947678', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (1100.00, '2022-09-10', NOW(), NOW(), 0, null, '48fcc94d-cacd-4eb6-bf8c-736c6696504b', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (1134.00, '2022-09-17', NOW(), NOW(), 0, null, '367f80d4-5d4b-4fdf-a887-9f0afce37c8d', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),

    (998.00, '2022-06-18', NOW(), NOW(), 0, null, '535ed449-9a17-4cc3-b6dd-2cdb1501e0ed', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1035.00, '2022-06-25', NOW(), NOW(), 0, null, '5324dd9d-17e9-43d3-b5b7-739b1d652e37', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1022.00, '2022-07-02', NOW(), NOW(), 0, null, 'ce16f344-b6a7-4fec-8535-b6ff7980f07d', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1033.00, '2022-07-09', NOW(), NOW(), 0, null, 'bbc31023-f181-49cf-817d-4053a265cd8e', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1049.00, '2022-07-16', NOW(), NOW(), 0, null, 'c765d1d3-f0e4-46eb-b8e9-f17c64123625', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1043.00, '2022-07-23', NOW(), NOW(), 0, null, 'f5fa5a9f-2089-40ae-a36e-26047a007c10', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1046.00, '2022-07-30', NOW(), NOW(), 0, null, '89f07034-bcd0-4d4e-9b08-38f603249a4e', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1057.00, '2022-08-06', NOW(), NOW(), 0, null, '7052fd39-9069-43d2-bc7e-9982f5e2547c', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1055.00, '2022-08-13', NOW(), NOW(), 0, null, '2e67d15c-ca48-486e-8925-d66a627384aa', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1085.00, '2022-08-20', NOW(), NOW(), 0, null, 'f1b20b57-e5f9-467a-be34-faba650722cc', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1104.00, '2022-08-27', NOW(), NOW(), 0, null, 'a5e9cb7a-c17c-477e-bff3-45406d35ea19', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1087.00, '2022-09-03', NOW(), NOW(), 0, null, 'cfe48e45-e687-4a10-b6e6-8685d9a98eda', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1119.00, '2022-09-10', NOW(), NOW(), 0, null, '2d7f11e3-175b-4428-8806-40472d5e8cab', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1113.00, '2022-09-17', NOW(), NOW(), 0, null, '56682cdb-4096-44ac-8f65-9dc8afaa584e', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1113.00, '2022-09-24', NOW(), NOW(), 0, null, 'ad6c1fce-b203-4add-b49d-5261ce950b94', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1154.00, '2022-10-01', NOW(), NOW(), 0, null, 'fab8ea30-6512-4f40-ac4a-9063d399fa43', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1163.00, '2022-10-08', NOW(), NOW(), 0, null, '9859ddfb-0182-4bba-921c-966a715efb15', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1178.00, '2022-10-15', NOW(), NOW(), 0, null, '12a95601-0d97-4318-b33e-0dad3012ebcd', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1195.00, '2022-10-22', NOW(), NOW(), 0, null, 'e4cab846-01f7-4164-9223-eb68f2dbb145', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1195.00, '2022-10-29', NOW(), NOW(), 0, null, 'ed7793b6-765f-4f52-9b3f-9924fee8c955', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1214.00, '2022-11-05', NOW(), NOW(), 0, null, 'c5644b44-da00-4d95-8cb0-140e432e18f3', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1186.00, '2022-11-12', NOW(), NOW(), 0, null, 'cf37c217-cbb2-4915-836e-640c5f9560d2', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (1238.00, '2022-11-19', NOW(), NOW(), 0, null, 'dd71f8fd-f814-4fd8-8da5-47925227f220', null, '21b5e894-4715-4608-960d-9441f758b4f3'),

    (889.00, '2019-06-18', NOW(), NOW(), 0, null, '909fef9b-3f89-4503-899e-e09413d86291', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (914.00, '2019-06-25', NOW(), NOW(), 0, null, 'cb0f4f1e-f163-4c86-9e80-0167604730f4', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (948.00, '2019-07-02', NOW(), NOW(), 0, null, '399965bd-58c5-4a12-8e54-388018c59add', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (953.00, '2019-07-09', NOW(), NOW(), 0, null, '980a772c-d349-4bde-b8db-9ff141d6df2d', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (961.00, '2019-07-16', NOW(), NOW(), 0, null, '615025ab-00fe-4e33-a457-183d918e9663', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (996.00, '2019-07-23', NOW(), NOW(), 0, null, '30e4a649-1058-41e4-8f82-0ca131d3a48c', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1030.00, '2019-07-30', NOW(), NOW(), 0, null, '06e018e0-ed86-4f4b-abeb-617261c003ba', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1072.00, '2019-08-06', NOW(), NOW(), 0, null, 'fef78461-0a70-425e-a21a-41d52bbd61d0', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1113.00, '2019-08-13', NOW(), NOW(), 0, null, 'c7f828b2-298c-438d-af72-0d643ce28d61', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1144.00, '2019-08-20', NOW(), NOW(), 0, null, 'd1087ed2-9fb1-498a-b467-ec763f5aec87', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1184.00, '2019-08-27', NOW(), NOW(), 0, null, '32e2488e-3b2f-4f1d-a02b-880d13a91509', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1213.00, '2019-09-03', NOW(), NOW(), 0, null, '3145634a-ac60-40f9-b320-e3185526a375', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1227.00, '2019-09-10', NOW(), NOW(), 0, null, 'f6a3444d-cf71-4299-9067-ee36c3662a50', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1263.00, '2019-09-17', NOW(), NOW(), 0, null, 'aea937aa-b050-4612-8b50-2b9e12e13d13', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (1321.00, '2019-10-23', NOW(), NOW(), 0, null, '12a1a690-ea93-4039-8fe9-a6fbb9d424ab', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1310.00, '2019-10-30', NOW(), NOW(), 0, null, '610ceb58-bb26-40d2-a565-d4e6e22c70eb', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1315.00, '2019-11-06', NOW(), NOW(), 0, null, 'de15440c-5dd4-4e5c-8d34-0f206e72ec18', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1318.00, '2019-11-13', NOW(), NOW(), 0, null, '35f09f23-ffa9-4744-a8a9-5b0d7c1ad589', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1321.00, '2019-11-20', NOW(), NOW(), 0, null, 'cf9431be-288a-4937-ab4c-419e188e145b', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1307.00, '2019-11-27', NOW(), NOW(), 0, null, 'ceb5d7c8-3d66-4cb6-87a7-258646915237', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1311.00, '2019-12-04', NOW(), NOW(), 0, null, '0fc0c66d-4694-47ca-b145-e67f46d72b65', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1328.00, '2019-12-11', NOW(), NOW(), 0, null, '5f589d7a-d18a-4b6c-931c-65ba6b573e64', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1332.00, '2019-12-18', NOW(), NOW(), 0, null, 'fedefd77-56c5-45a7-bf11-597ce04036ae', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1329.00, '2019-12-25', NOW(), NOW(), 0, null, 'f7733778-049b-4dc5-a88f-15d23b59c523', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1315.00, '2020-01-01', NOW(), NOW(), 0, null, 'cb93ef71-5e68-4414-aa22-33c257a2446d', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1326.00, '2020-01-08', NOW(), NOW(), 0, null, 'd1921d23-ef20-4cf2-8914-b747661e6816', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1307.00, '2020-01-15', NOW(), NOW(), 0, null, '7065268a-d669-456c-8bdc-122fac975c76', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1330.00, '2020-01-22', NOW(), NOW(), 0, null, '9b9c4bb2-d8e9-473f-8a5a-dc32b5a6226c', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1323.00, '2020-01-29', NOW(), NOW(), 0, null, '31c3b2b8-b85e-4be9-93c5-1880928bc60d', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1322.00, '2020-02-05', NOW(), NOW(), 0, null, '2315ebd8-46ee-4137-8259-036b62ac9e32', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1315.00, '2020-02-12', NOW(), NOW(), 0, null, '163af70a-f24e-49bb-8b70-22ad9000928c', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (1321.00, '2020-02-19', NOW(), NOW(), 0, null, '7463f1f7-8761-4b01-9d0f-66cb1d03b615', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),

    (777.00, '2019-06-18', NOW(), NOW(), 0, null, '45c1a576-b071-44d3-b4a5-3d1956f07dd7', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (771.00, '2019-06-25', NOW(), NOW(), 0, null, '3b0eee98-990c-4c44-b069-1a63bd938900', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (769.00, '2019-07-02', NOW(), NOW(), 0, null, '33f87ba4-f4a9-44e1-8563-10a5d8371c62', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (804.00, '2019-07-09', NOW(), NOW(), 0, null, 'b2a9d759-1a6d-4ebe-9d4a-35eb1b2d5ddf', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (824.00, '2019-07-16', NOW(), NOW(), 0, null, '70f7b2df-ea4c-4620-b181-6b17443ab38d', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (843.00, '2019-07-23', NOW(), NOW(), 0, null, 'daec6152-55f7-40b9-986f-5b47e9567d70', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (831.00, '2019-07-30', NOW(), NOW(), 0, null, 'fa4b27b3-2360-4bbc-a25e-ac608471ac9c', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (867.00, '2019-08-06', NOW(), NOW(), 0, null, '6188b4bd-da8a-4c5d-bc5d-de5f26cf9814', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (883.00, '2019-08-13', NOW(), NOW(), 0, null, 'afc870a4-b4f7-4f8a-876f-76fa911bbaf6', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (865.00, '2019-08-20', NOW(), NOW(), 0, null, 'b4abe8f8-dc7c-4876-9d57-b8c69748260d', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (899.00, '2019-08-27', NOW(), NOW(), 0, null, 'e853a5a5-2913-46da-b21e-7ac0a90838cc', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (918.00, '2019-09-03', NOW(), NOW(), 0, null, '902fff22-59e6-4027-bfa0-ffd4d3c30b54', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (927.00, '2019-09-10', NOW(), NOW(), 0, null, '0bf49c2f-0696-4ab6-90f8-d00d81e77d4d', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (911.00, '2019-09-17', NOW(), NOW(), 0, null, 'e5ddda0b-154f-4644-8c2a-3c90116716a8', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (941.00, '2019-09-24', NOW(), NOW(), 0, null, 'fadd9ed0-5d2d-4a6a-8940-b96e71fa9574', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (980.00, '2019-10-01', NOW(), NOW(), 0, null, 'f00989ab-2fe9-4317-beb7-64d502aa71ea', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (995.00, '2019-10-08', NOW(), NOW(), 0, null, '536428ea-11b0-4f50-82b2-00c448d2a3af', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (994.00, '2019-10-15', NOW(), NOW(), 0, null, '1d40f183-d001-4ba1-be3b-bad01d4ebb0f', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (1212.00, '2019-11-21', NOW(), NOW(), 0, null, 'd63abf77-f2a3-4581-a172-33315f487d1b', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1166.00, '2019-11-28', NOW(), NOW(), 0, null, 'dc8a707d-5b9b-4ca5-8641-809b733ef56d', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1206.00, '2019-12-05', NOW(), NOW(), 0, null, '505ed0ac-7efd-4765-9276-4a1a46a2349a', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1141.00, '2019-12-12', NOW(), NOW(), 0, null, 'f326c938-a0ca-4485-9ab1-938ff5dfacd7', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1204.00, '2019-12-19', NOW(), NOW(), 0, null, 'cd730be3-5e67-4966-b9fd-4b078a81206a', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1205.00, '2019-12-26', NOW(), NOW(), 0, null, 'dd23c1b1-2699-4b46-afa8-c4914048d012', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1141.00, '2020-01-02', NOW(), NOW(), 0, null, '2ae0d12b-2aa2-4213-96e8-0a87af3785f1', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1199.00, '2020-01-09', NOW(), NOW(), 0, null, 'ebc90ab3-7795-4937-ab59-b8b0653b1fa2', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1183.00, '2020-01-16', NOW(), NOW(), 0, null, 'ad36d53b-18c4-4c24-924d-f5632b3b2ce2', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1163.00, '2020-01-23', NOW(), NOW(), 0, null, '18ce6034-be2e-4efb-b311-81c28af3afe7', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1183.00, '2020-01-30', NOW(), NOW(), 0, null, '93ee1ddc-6458-496d-876e-de5da83f82e3', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1167.00, '2020-02-06', NOW(), NOW(), 0, null, 'ac1f098a-6dbf-4766-9dba-5a781fa2111a', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1153.00, '2020-02-13', NOW(), NOW(), 0, null, 'c3721df2-346a-43f6-90a7-085752036a34', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1222.00, '2020-02-20', NOW(), NOW(), 0, null, '7489ccac-9f91-41cf-ad51-6979d9311c31', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1221.00, '2020-02-27', NOW(), NOW(), 0, null, 'ac8c43ea-07fe-47c2-bd70-529184204d16', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1144.00, '2020-03-05', NOW(), NOW(), 0, null, 'b22353e9-8b40-4852-8a46-a209652742b3', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1172.00, '2020-03-12', NOW(), NOW(), 0, null, '7f2057d7-1aa8-4a58-a7c9-103a75d85e93', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (1184.00, '2020-03-19', NOW(), NOW(), 0, null, 'bc388ccc-457d-4329-a72d-07422c69c47b', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),

    (1222.00, '2022-06-18', NOW(), NOW(), 0, null, '56ba3342-0e30-46c7-bf27-254419a67bd0', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1204.00, '2022-06-25', NOW(), NOW(), 0, null, '2e49412d-41b8-4134-9aa4-0e46d5416a4d', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1140.00, '2022-07-02', NOW(), NOW(), 0, null, '3da113ba-15e7-4830-8d61-aa188ed7e2c5', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1166.00, '2022-07-09', NOW(), NOW(), 0, null, '23722827-c115-4726-b4bb-f042195b1ae3', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1146.00, '2022-07-16', NOW(), NOW(), 0, null, 'a5a6914b-84c9-4f9f-990f-f63dd9251777', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1183.00, '2022-07-23', NOW(), NOW(), 0, null, '51612734-d530-4f2b-9416-991df06805e5', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1169.00, '2022-07-30', NOW(), NOW(), 0, null, 'f9526270-9255-487f-a800-b174f20f8205', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1159.00, '2022-08-06', NOW(), NOW(), 0, null, '5117fc02-0bc7-44c9-89ef-9bc79a86e61a', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1197.00, '2022-08-13', NOW(), NOW(), 0, null, '19f21daa-32be-4756-a829-2062310d005b', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1212.00, '2022-08-20', NOW(), NOW(), 0, null, '922d5c75-2aa1-43a4-88d5-45ef37a95881', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1191.00, '2022-08-27', NOW(), NOW(), 0, null, '96f3015d-69eb-4de2-b26c-e6867fbcb8b6', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1229.00, '2022-09-03', NOW(), NOW(), 0, null, 'fd3dac3f-18d3-4178-b129-8bf93e142dc7', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1225.00, '2022-09-10', NOW(), NOW(), 0, null, '789ee66f-0274-4406-a4e5-3793269099fc', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1223.00, '2022-09-17', NOW(), NOW(), 0, null, 'c4f37665-a3c6-4c2f-8128-4cc8c464c893', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1170.00, '2022-09-24', NOW(), NOW(), 0, null, 'ec02ee2d-6ccd-4d57-b73e-dfb86cb4b155', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1197.00, '2022-10-01', NOW(), NOW(), 0, null, 'ea4c58a7-a1e4-4bb6-bc67-67ef0e505dc2', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1171.00, '2022-10-08', NOW(), NOW(), 0, null, '4120d7b3-a9a3-40ed-94cd-f33ca4bfcaac', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1209.00, '2022-10-15', NOW(), NOW(), 0, null, '666f38ed-dff3-4c6d-adbe-7985f1974750', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1206.00, '2022-10-22', NOW(), NOW(), 0, null, 'c549425c-0d05-4c2d-a772-31a980a1f0b5', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1223.00, '2022-10-29', NOW(), NOW(), 0, null, '7a202ed0-1023-4dfa-a84d-c318e4b62f35', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1205.00, '2022-11-05', NOW(), NOW(), 0, null, 'd5ed00bd-286b-415a-8f7f-f566c45318ac', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1184.00, '2022-11-12', NOW(), NOW(), 0, null, '8df77b71-670b-412f-97f0-2fd198195ad8', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (1161.00, '2022-11-19', NOW(), NOW(), 0, null, '3e6d5cb3-cb36-4696-803c-3bbc401ff2fc', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),

    (817.00, '2019-06-18', NOW(), NOW(), 0, null, 'cf31d4c2-d54f-467e-baf6-59e9398841fb', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (844.00, '2019-06-25', NOW(), NOW(), 0, null, '7e2d24d7-8637-4e31-8db9-2dd897aaeb13', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (874.00, '2019-07-02', NOW(), NOW(), 0, null, 'aad98989-3afc-4056-9c8d-fb77ade7b7d0', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (912.00, '2019-07-09', NOW(), NOW(), 0, null, '7884c481-bf63-4d44-86ba-f2381d96177a', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (935.00, '2019-07-16', NOW(), NOW(), 0, null, 'a95f875f-7de2-4bba-960a-c664556dd297', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (961.00, '2019-07-23', NOW(), NOW(), 0, null, '21b47232-bbbf-42cc-b973-a9e6bc5b8274', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (970.00, '2019-07-30', NOW(), NOW(), 0, null, '846aedd5-abbb-4427-914a-bff569329855', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (986.00, '2019-08-06', NOW(), NOW(), 0, null, '187e12d3-853a-4902-872f-71b719fb07bd', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1007.00, '2019-08-13', NOW(), NOW(), 0, null, '99f379cf-ab50-47be-8182-1f7bca6b82bf', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1038.00, '2019-08-20', NOW(), NOW(), 0, null, '0abaa33a-8fdf-4a69-b891-7d547584795a', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1076.00, '2019-08-27', NOW(), NOW(), 0, null, '0afde850-1139-4cc7-8901-dfe09c99079e', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1067.00, '2019-09-03', NOW(), NOW(), 0, null, '3aa42a54-3870-4fe1-98dc-1e091c915d0d', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1107.00, '2019-09-10', NOW(), NOW(), 0, null, '230276a9-8456-4249-b6a6-92386ad5ffc3', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1145.00, '2019-09-17', NOW(), NOW(), 0, null, '94bd4c82-52fa-46b3-ac9e-c884971ef8ac', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1148.00, '2019-09-24', NOW(), NOW(), 0, null, '3e39bab4-a64f-4ff2-91d7-8250aaca7844', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1180.00, '2019-10-01', NOW(), NOW(), 0, null, '6d07822a-2f84-4df0-a8c1-526b2a75b816', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1218.00, '2019-10-08', NOW(), NOW(), 0, null, '5f04c923-7a94-4582-9d1c-51f2d2499906', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1245.00, '2019-10-15', NOW(), NOW(), 0, null, 'ee77337b-d5ac-4751-a147-15459128f626', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (1425.00, '2019-11-21', NOW(), NOW(), 0, null, 'ce93ba8b-f967-4536-8119-698d15f6396b', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1393.00, '2019-11-28', NOW(), NOW(), 0, null, '6705a623-3633-475d-90ae-068f5f824f4b', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1456.00, '2019-12-05', NOW(), NOW(), 0, null, '1ef45a4f-621c-4d7d-a1e0-05e94b0b95ef', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1462.00, '2019-12-12', NOW(), NOW(), 0, null, '4d5d4bc4-293f-45df-a3c2-f0c468d7c11b', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1476.00, '2019-12-19', NOW(), NOW(), 0, null, 'dc2542f1-06d0-4513-9236-7bf4e4fb4451', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1489.00, '2019-12-26', NOW(), NOW(), 0, null, 'a17e1992-34e8-4c50-987d-22b4c21d6bda', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1503.00, '2020-01-02', NOW(), NOW(), 0, null, 'a42b5a08-92fd-4bba-90f8-87e7979028fa', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1518.00, '2020-01-09', NOW(), NOW(), 0, null, '32ca471c-9b1d-47b2-b2e1-f7449a8f4332', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1575.00, '2020-01-16', NOW(), NOW(), 0, null, '0ed83d2e-8e49-490c-a0f5-27b04a7c7b66', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1573.00, '2020-01-23', NOW(), NOW(), 0, null, '3738c63a-cecf-4964-beac-031de1fa5ed6', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1632.00, '2020-01-30', NOW(), NOW(), 0, null, 'a29cb8a6-d583-4fd9-86a6-9a2572a84b98', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1631.00, '2020-02-06', NOW(), NOW(), 0, null, '183657a0-dc8e-4398-95e4-1d68556bf1af', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1678.00, '2020-02-13', NOW(), NOW(), 0, null, 'f0e6ad48-fa99-4049-b158-c908331606db', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1725.00, '2020-02-20', NOW(), NOW(), 0, null, 'a02f3993-d6db-4557-93c8-06d03ec432fa', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1777.00, '2020-02-27', NOW(), NOW(), 0, null, '18dd3d98-9e24-4cca-a581-783c205e699b', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1802.00, '2020-03-05', NOW(), NOW(), 0, null, '1de6b25d-e627-4774-b38c-91f504989384', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1837.00, '2020-03-12', NOW(), NOW(), 0, null, '0db0cd0b-7698-43d2-b3c0-e8cc7b546d34', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1846.00, '2020-03-19', NOW(), NOW(), 0, null, '2d9c874d-1061-40ae-9b06-f2892bedafa2', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1887.00, '2020-03-26', NOW(), NOW(), 0, null, '6c890c61-2fd9-4bfa-81ca-6208c9396b4c', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1942.00, '2020-04-02', NOW(), NOW(), 0, null, '333f2b40-4714-48c6-bb5a-3897a1ca8f45', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1935.00, '2020-04-09', NOW(), NOW(), 0, null, 'd539c7d8-8f8b-427f-b77c-f8f7439d664a', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (1998.00, '2020-04-16', NOW(), NOW(), 0, null, 'baee38f2-475a-475f-b625-e0519b359b55', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (2026.00, '2020-04-23', NOW(), NOW(), 0, null, '49dceb2f-f7ee-466d-a5b5-8319a232b353', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),

    (1427.00, '2019-06-18', NOW(), NOW(), 0, null, '0b81e7a1-1859-4c4b-b1e1-2991d77d0837', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1479.00, '2019-06-25', NOW(), NOW(), 0, null, '9a7e6a24-d355-47c1-a10a-440bd52fc780', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1522.00, '2019-07-02', NOW(), NOW(), 0, null, '60e3290c-9b3f-4fb2-9d05-c3b739abef6c', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1579.00, '2019-07-09', NOW(), NOW(), 0, null, '0d754fe0-36a5-4be0-9bd9-b348a40b6f4a', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1583.00, '2019-07-16', NOW(), NOW(), 0, null, 'a7a76c5a-4a37-45ed-ae5b-8573257ab3d7', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1636.00, '2019-07-23', NOW(), NOW(), 0, null, 'fd0793d3-8590-4c21-a8e9-5a4ebea0abb7', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1637.00, '2019-07-30', NOW(), NOW(), 0, null, 'c0a230e7-f68d-42ea-bc6a-71a39316031f', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1670.00, '2019-08-06', NOW(), NOW(), 0, null, 'ef3eef42-aed1-44c6-a7c7-b6026ed1e0dd', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1708.00, '2019-08-13', NOW(), NOW(), 0, null, 'fb60aee5-80a2-485f-a0c7-2413e3270355', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1747.00, '2019-08-20', NOW(), NOW(), 0, null, '5541573b-988d-41fc-8e2a-8aded36fba3d', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1749.00, '2019-08-27', NOW(), NOW(), 0, null, 'd890063a-a380-47e3-bc0e-449fc96dd76b', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1855.00, '2019-09-03', NOW(), NOW(), 0, null, 'bbeb929f-5170-4828-94c6-cf6547f5cba9', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1880.00, '2019-09-10', NOW(), NOW(), 0, null, '443a47b8-06d2-48e8-a16d-f6ca085f6b33', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1913.00, '2019-09-17', NOW(), NOW(), 0, null, '326416c0-6042-431f-9b94-a14711dea267', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1939.00, '2019-09-24', NOW(), NOW(), 0, null, 'fa893f08-c320-4341-b1db-67dc797090e7', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (1935.00, '2019-10-01', NOW(), NOW(), 0, null, 'd3d71240-2b09-404e-977d-8951816ae77f', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (2031.00, '2019-10-08', NOW(), NOW(), 0, null, 'b537759f-6b68-4773-a978-a1bed8bff3cf', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (2118.00, '2019-10-15', NOW(), NOW(), 0, null, '06476ab1-6408-48a2-8752-45721d3d2576', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (2391.00, '2019-12-21', NOW(), NOW(), 0, null, 'be56666d-dec0-42af-84de-a45fde12bf08', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2425.00, '2019-12-28', NOW(), NOW(), 0, null, 'e7e781bc-f449-4373-8974-f5165a4c9117', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2433.00, '2020-01-04', NOW(), NOW(), 0, null, '22c85a62-02b7-44ca-b585-2b0464be5da7', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2516.00, '2020-01-11', NOW(), NOW(), 0, null, 'd2eeb52a-1619-426c-85ce-06433a0a62a4', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2654.00, '2020-01-18', NOW(), NOW(), 0, null, '645d026f-3c80-417f-a04b-3a9ba37c8c96', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2685.00, '2020-01-25', NOW(), NOW(), 0, null, 'b1fbed9e-6f1e-433f-ac72-b229918b3912', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2739.00, '2020-02-01', NOW(), NOW(), 0, null, '499ff4b7-3d4d-4371-a324-2e1d4546d054', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2832.00, '2020-02-08', NOW(), NOW(), 0, null, '26748bcd-526f-444f-97e4-f45a0f612290', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2847.00, '2020-02-15', NOW(), NOW(), 0, null, 'ac466e8d-dd8a-4fd8-9162-d2690d6f40e7', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2927.00, '2020-02-22', NOW(), NOW(), 0, null, '74941f7f-bee0-483a-bc30-bb78166cd71d', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2942.00, '2020-02-29', NOW(), NOW(), 0, null, '1cf26795-5cf3-4494-9262-aa616bf517d5', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (2957.00, '2020-03-07', NOW(), NOW(), 0, null, '6847d556-cb24-41e3-ac98-6bbac806f580', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (3175.00, '2020-03-14', NOW(), NOW(), 0, null, 'd1eb2b5a-d918-4fcf-b1b9-645cccbcbe89', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (3223.00, '2020-03-21', NOW(), NOW(), 0, null, '4a1d4931-36d3-491e-bd40-ac40ae1ea658', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (3228.00, '2020-03-28', NOW(), NOW(), 0, null, '093103f1-5dfc-44db-aef8-7d31eca9f1c5', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (3318.00, '2020-04-04', NOW(), NOW(), 0, null, '5f11a335-6f4a-4ca2-8ebf-055637f47b5f', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (3340.00, '2020-04-11', NOW(), NOW(), 0, null, 'b9078ccb-133e-4e62-8a10-3357eec2d9c6', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (3522.00, '2020-04-18', NOW(), NOW(), 0, null, 'dc4cfa56-5e0a-441c-8416-9a01e61a5b16', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (3606.00, '2020-04-25', NOW(), NOW(), 0, null, '1e29fa8b-dd80-47b4-8a8b-6dc3b243a32a', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b');


INSERT INTO fixed_fees (margin_fee, rental_fee, date, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    (123.00, 411.00, '2019-06-23', NOW(), NOW(), 0, null, '6e4235c9-9876-4479-ba1a-88cfa3310748', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-06-30', NOW(), NOW(), 0, null, '75edd330-e1ab-41e5-85ff-c182e17c6b2c', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-07-07', NOW(), NOW(), 0, null, 'b154790e-01dc-485a-806f-c170e1342c0c', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-07-14', NOW(), NOW(), 0, null, '442c0a91-fcb0-4022-a0a3-64e915da227e', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-07-21', NOW(), NOW(), 0, null, '7bf44d4f-45dd-4157-9931-5fb3078294b4', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-07-28', NOW(), NOW(), 0, null, 'b2a09fa2-4355-4a3b-83a1-c2c3223dd45b', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-08-04', NOW(), NOW(), 0, null, 'ce9bacd9-1a49-49cd-a4ba-02eca35580c7', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-08-11', NOW(), NOW(), 0, null, '1ddd3df6-2df6-4f20-adb7-80d0a2ca3762', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-08-18', NOW(), NOW(), 0, null, '99b5c683-a537-4b36-b87f-f10bf5ebac99', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-08-25', NOW(), NOW(), 0, null, '2c352e03-48eb-485e-ae5f-afae36032f6a', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-09-01', NOW(), NOW(), 0, null, '02b8acc9-5184-4d87-8a5f-300ffa7199c8', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-09-08', NOW(), NOW(), 0, null, '14c4786d-8f23-45b2-b976-2c13e8b4efdf', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-09-15', NOW(), NOW(), 0, null, '35da9b49-dfc7-4e9b-9ebd-bea6f68e2985', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-09-22', NOW(), NOW(), 0, null, '555bff6d-d1fc-4e27-bc97-a5e40e5550a1', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (123.00, 411.00, '2019-10-27', NOW(), NOW(), 0, null, '2a7a2ca5-949a-4b8c-9157-77fdeedd35e5', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 424.00, '2019-11-03', NOW(), NOW(), 0, null, '5e6101c5-2ee5-4243-84f7-0f8a31c1a798', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 436.00, '2019-11-10', NOW(), NOW(), 0, null, 'cbe815bf-58a7-4499-9182-cd4650772a29', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 441.00, '2019-11-17', NOW(), NOW(), 0, null, '20322417-b174-480b-b77c-4ab2e18c1cee', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 449.00, '2019-11-24', NOW(), NOW(), 0, null, 'c7d1dbe9-2f22-44cb-8d8b-dd4ab1a3ab9a', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 467.00, '2019-12-01', NOW(), NOW(), 0, null, 'b9ce1849-4539-4d52-9fbd-044c3d5c6b42', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 482.00, '2019-12-08', NOW(), NOW(), 0, null, 'bf36884c-408d-41f3-bbe4-8cabf7669478', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 497.00, '2019-12-15', NOW(), NOW(), 0, null, '2e811176-9e25-4710-9a8c-d1363397099a', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 508.00, '2019-12-22', NOW(), NOW(), 0, null, 'b91e3540-a70f-4616-aa49-2362f5edc3aa', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 518.00, '2019-12-29', NOW(), NOW(), 0, null, '31ed98b8-fa2c-42d1-9121-d4e3f98070c5', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 532.00, '2020-01-05', NOW(), NOW(), 0, null, 'e859e841-6880-41b4-958b-1b263f03da98', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 545.00, '2020-01-12', NOW(), NOW(), 0, null, 'cd282c2e-f2df-43d1-baf1-a0029ed31a13', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 563.00, '2020-01-19', NOW(), NOW(), 0, null, 'cc093cbf-ead6-4bad-b25f-5029f5ca20f9', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 586.00, '2020-01-26', NOW(), NOW(), 0, null, 'bc67af97-d249-48a9-913c-b8f5535a451c', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 602.00, '2020-02-02', NOW(), NOW(), 0, null, '87e1fdf2-88d6-4d33-892b-0f8bc19d4b30', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 615.00, '2020-02-09', NOW(), NOW(), 0, null, '5c6bbea4-63fa-4262-b8cc-057c2b0691ef', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 624.00, '2020-02-16', NOW(), NOW(), 0, null, 'b0b2c8ce-f1ed-43f4-ac56-a3ded43fbab8', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (123.00, 650.00, '2020-02-23', NOW(), NOW(), 0, null, '461ab94b-a223-4dee-934e-d7f1079c777d', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),

    (401.00, 159.00, '2022-06-19', NOW(), NOW(), 0, null, '77aeb5a6-61ca-47a0-b939-61ad92fd1029', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (415.00, 164.00, '2022-06-26', NOW(), NOW(), 0, null, '1a50d57a-e291-45bf-a328-d5fcebc54fad', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (426.00, 171.00, '2022-07-03', NOW(), NOW(), 0, null, '7bdf9f3d-68d9-4fa5-a039-3a56dfb24b71', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (434.00, 178.00, '2022-07-10', NOW(), NOW(), 0, null, '63f446c2-6154-4bef-89d1-32c1e91261e8', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (454.00, 180.00, '2022-07-17', NOW(), NOW(), 0, null, '278f71c4-dd77-4278-a87e-3c313e2716f0', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (461.00, 187.00, '2022-07-24', NOW(), NOW(), 0, null, '139ba8ca-a5a1-4681-8738-0139c7647f95', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (481.00, 192.00, '2022-07-31', NOW(), NOW(), 0, null, '891524c4-a504-41d4-a195-3685bda0a2af', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (497.00, 198.00, '2022-08-07', NOW(), NOW(), 0, null, '4fb764e3-13ee-4c31-89f6-0a57127425f3', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (507.00, 200.00, '2022-08-14', NOW(), NOW(), 0, null, 'f7442b11-ba40-4104-bd90-6ce0d89813de', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (527.00, 202.00, '2022-08-21', NOW(), NOW(), 0, null, '5aeafd3b-0287-4a00-ab0b-0b3599949f08', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (535.00, 205.00, '2022-08-28', NOW(), NOW(), 0, null, 'f9bdcd71-8ab8-4ebe-bdd2-69973850c560', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (550.00, 211.00, '2022-09-04', NOW(), NOW(), 0, null, 'f9d44427-5d9c-46e3-b8e7-a23df69eb37a', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (561.00, 217.00, '2022-09-11', NOW(), NOW(), 0, null, 'a075e38d-82c7-4747-b2e6-b1a1eba239b4', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (568.00, 223.00, '2022-09-18', NOW(), NOW(), 0, null, '11a75144-f22d-4299-b928-9dd3d3a29dc2', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),

    (280.00, 499.00, '2022-06-19', NOW(), NOW(), 0, null, 'b1458221-6df4-4401-85fd-234fd3b2bb3c', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (293.00, 499.00, '2022-06-26', NOW(), NOW(), 0, null, '57342502-5a66-4aa2-92a6-7e9337bab9b6', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (296.00, 499.00, '2022-07-03', NOW(), NOW(), 0, null, '481e60fe-765f-4f11-9313-22c2f7f14ed9', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (301.00, 499.00, '2022-07-10', NOW(), NOW(), 0, null, '5c3e4d32-a260-48f4-872b-4b00b5dec136', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (305.00, 499.00, '2022-07-17', NOW(), NOW(), 0, null, '013c4751-c8c2-4c4d-96c3-5dfb07226bb1', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (310.00, 499.00, '2022-07-24', NOW(), NOW(), 0, null, 'dfd646b8-4543-4b16-94fc-c28ba43a94aa', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (322.00, 499.00, '2022-07-31', NOW(), NOW(), 0, null, '81414573-12a9-49ec-adf1-1bf49a990c3b', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (336.00, 499.00, '2022-08-07', NOW(), NOW(), 0, null, 'db3250aa-c85a-4a53-9df7-e1f7231c299c', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (347.00, 499.00, '2022-08-14', NOW(), NOW(), 0, null, 'c4d155f9-7540-4f08-9315-91b8f933e6d4', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (355.00, 499.00, '2022-08-21', NOW(), NOW(), 0, null, 'dd2f9510-23ed-4096-859c-eb6be038c403', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (367.00, 499.00, '2022-08-28', NOW(), NOW(), 0, null, '89b100fe-a7ac-4768-b9d9-1786b2f27252', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (375.00, 499.00, '2022-09-04', NOW(), NOW(), 0, null, '01492117-be65-44cb-8707-4f27508ca5b2', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (384.00, 499.00, '2022-09-11', NOW(), NOW(), 0, null, '8ade2298-ca1c-4ab6-b588-83f4911c7b26', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (393.00, 499.00, '2022-09-18', NOW(), NOW(), 0, null, '07d1efe8-74c0-4246-a129-984e7aff2ce7', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (397.00, 499.00, '2022-09-25', NOW(), NOW(), 0, null, '2a5871c9-c8af-43e1-884d-369bf456cecd', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (412.00, 499.00, '2022-10-02', NOW(), NOW(), 0, null, '3800ae5e-e8f9-40f6-8b69-924a3a8737e5', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (426.00, 499.00, '2022-10-09', NOW(), NOW(), 0, null, '420511c7-2a0a-41d5-8021-46a66153ff7f', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (442.00, 499.00, '2022-10-16', NOW(), NOW(), 0, null, 'c50af338-cd02-44b9-bd22-f747e4397321', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (456.00, 499.00, '2022-10-23', NOW(), NOW(), 0, null, '9fd0ada7-4d7f-458c-84e6-4652cbe67ebd', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (463.00, 499.00, '2022-10-30', NOW(), NOW(), 0, null, 'b1ab1c97-af54-435b-8fc6-7c1bb5dc1abd', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (478.00, 499.00, '2022-11-06', NOW(), NOW(), 0, null, '55776e81-abf9-4291-b3c2-634ddb3df876', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (484.00, 499.00, '2022-11-13', NOW(), NOW(), 0, null, 'a1e8cb3b-9f65-452c-a7e8-7d99b5a8b6ce', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (504.00, 499.00, '2022-11-20', NOW(), NOW(), 0, null, 'c53d293e-31ee-40f6-8804-23fe431f2772', null, '21b5e894-4715-4608-960d-9441f758b4f3'),

    (123.00, 666.00, '2019-06-23', NOW(), NOW(), 0, null, 'ec3d1cbd-8615-4b21-9f70-0dba9bfc7847', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (124.00, 689.00, '2019-06-30', NOW(), NOW(), 0, null, 'c661ca24-17c1-4b3b-9202-c80d738ebd13', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (126.00, 715.00, '2019-07-07', NOW(), NOW(), 0, null, 'd17f0029-3558-425f-8d32-3204dcba5fd9', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (127.00, 724.00, '2019-07-14', NOW(), NOW(), 0, null, '95c12dca-f1d8-4257-b5fb-07aaba5b83f4', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (129.00, 734.00, '2019-07-21', NOW(), NOW(), 0, null, '6eed3900-ed85-4e64-a54d-3e728514bc84', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (132.00, 764.00, '2019-07-28', NOW(), NOW(), 0, null, '0bd31bce-aac1-4418-a449-3342b3602566', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (135.00, 798.00, '2019-08-04', NOW(), NOW(), 0, null, '2851feca-0420-423c-acb4-d1e80903131c', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (136.00, 833.00, '2019-08-11', NOW(), NOW(), 0, null, '0732b8b8-8df1-41e3-9560-f9fda601fd53', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (138.00, 869.00, '2019-08-18', NOW(), NOW(), 0, null, '7ce5bdc1-9d63-4a2c-86b5-3a3e1245b6eb', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (139.00, 908.00, '2019-08-25', NOW(), NOW(), 0, null, '3ce24b30-f1fe-47bf-b97d-bae5ec24cfe6', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (141.00, 949.00, '2019-09-01', NOW(), NOW(), 0, null, '2594140b-46c3-49e9-8cf5-b44cee293457', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (146.00, 966.00, '2019-09-08', NOW(), NOW(), 0, null, 'bf0b8db4-f8a2-4a3a-97f3-3373b8131c22', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (150.00, 983.00, '2019-09-15', NOW(), NOW(), 0, null, '363c5a22-766f-4041-83c4-6892ab349d93', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (156.00, 1013.00, '2019-09-22', NOW(), NOW(), 0, null, '2cc35a6d-f103-4425-90a6-67c0fdee1e88', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (161.00, 1031.00, '2019-10-27', NOW(), NOW(), 0, null, '39cff2fd-8cda-4a6d-a31c-58332ac0dcc0', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-11-03', NOW(), NOW(), 0, null, 'cda98f54-2ef9-412d-83bb-1c3c1b18918d', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-11-10', NOW(), NOW(), 0, null, 'e7e83919-74b9-4baa-b3ea-e13d4921be36', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-11-17', NOW(), NOW(), 0, null, 'cabebb45-c664-4161-9df1-d67cbadb5f9c', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-11-24', NOW(), NOW(), 0, null, '18e8a225-5209-40a4-a93f-37b37c930724', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-12-01', NOW(), NOW(), 0, null, 'b3cf5fea-a74a-4146-9677-61256ee36db8', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-12-08', NOW(), NOW(), 0, null, '6bf2bcfb-36eb-4f4b-8846-0f32b067d8d7', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-12-15', NOW(), NOW(), 0, null, '175966a4-87ce-428b-9884-f7d94dc4cbbe', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-12-22', NOW(), NOW(), 0, null, 'ac0b8220-12ca-4df6-948d-0a58750e6b92', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2019-12-29', NOW(), NOW(), 0, null, '0f1dda68-3976-4d8a-a5df-e4b85cf3b094', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-01-05', NOW(), NOW(), 0, null, 'acd902c5-dbf0-4d84-a79b-1a0a22035171', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-01-12', NOW(), NOW(), 0, null, 'd4aee997-272b-4eda-af6c-2cdae19e184f', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-01-19', NOW(), NOW(), 0, null, 'fd03c5ea-eda1-411c-b6b4-5f6759cc6e86', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-01-26', NOW(), NOW(), 0, null, '8eb2f08c-5ee4-4a38-ad91-8db64df33faa', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-02-02', NOW(), NOW(), 0, null, 'c9c32c6d-0039-49ab-90c9-3b1cbc06ca7f', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-02-09', NOW(), NOW(), 0, null, '36402919-e043-43eb-a23d-1587522a08d8', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-02-16', NOW(), NOW(), 0, null, 'd7d0089c-9ff8-47c8-8bbd-f491d9b54d2a', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (161.00, 1031.00, '2020-02-23', NOW(), NOW(), 0, null, '5bddb9a9-7aea-448a-9d56-0892bb122e83', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),

    (337.00, 172.00, '2019-06-23', NOW(), NOW(), 0, null, '51eedba7-2b73-437d-ace8-1a9732d78add', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (343.00, 172.00, '2019-06-30', NOW(), NOW(), 0, null, '92b70314-11fc-45ba-9a56-04222f3e45f7', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (354.00, 172.00, '2019-07-07', NOW(), NOW(), 0, null, '0c20678b-1f27-4a03-b415-cb15fd586d9c', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (359.00, 172.00, '2019-07-14', NOW(), NOW(), 0, null, 'd7737db9-25ae-4218-80a4-42c4185b65fb', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (364.00, 172.00, '2019-07-21', NOW(), NOW(), 0, null, 'a889bf34-d13d-480a-a433-9ed0b7cac127', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (377.00, 172.00, '2019-07-28', NOW(), NOW(), 0, null, 'd8444fae-74fd-4cbc-9c7a-7fa40800b532', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (390.00, 172.00, '2019-08-04', NOW(), NOW(), 0, null, '1987b219-b70e-4dd6-8064-476242060474', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (406.00, 172.00, '2019-08-11', NOW(), NOW(), 0, null, '066ffd81-9adc-48f4-9328-34cd262e3885', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (425.00, 172.00, '2019-08-18', NOW(), NOW(), 0, null, 'fe581ac8-5544-4e62-bee4-e9823518a53f', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (440.00, 172.00, '2019-08-25', NOW(), NOW(), 0, null, 'e75c0823-bf78-40db-a996-cead020a60b2', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (455.00, 172.00, '2019-09-01', NOW(), NOW(), 0, null, 'f5bee1ba-5d6e-4b70-9105-4940280947b8', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (473.00, 172.00, '2019-09-08', NOW(), NOW(), 0, null, 'e1edacbd-c3f5-4158-bde5-af293d9d3bf1', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (479.00, 172.00, '2019-09-15', NOW(), NOW(), 0, null, '7976a9db-640c-43c6-a904-9965f8afb737', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (485.00, 172.00, '2019-09-22', NOW(), NOW(), 0, null, 'd07679ac-d681-444b-a228-3d762fad5e98', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (507.00, 172.00, '2019-09-29', NOW(), NOW(), 0, null, '202269ba-5919-4a6d-adbc-48aedb934eb2', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (523.00, 172.00, '2019-10-06', NOW(), NOW(), 0, null, 'f96a8760-b5a5-444e-9bd9-1972c9ec6250', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (539.00, 172.00, '2019-10-13', NOW(), NOW(), 0, null, '7d348e59-f5c1-4d80-8c0f-ec74c57a0a3e', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (546.00, 172.00, '2019-10-20', NOW(), NOW(), 0, null, 'c5c45558-e473-4db2-8314-bdcdc6f1a938', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (563.00, 172.00, '2019-11-24', NOW(), NOW(), 0, null, 'da42c695-2d0a-4b37-9111-ddad5d5d47c1', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2019-12-01', NOW(), NOW(), 0, null, 'ff776846-cb43-48a3-a633-5375c2ca0eb5', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2019-12-08', NOW(), NOW(), 0, null, 'abd3d5f4-1ac4-4dca-b1d1-bd481fe9d365', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2019-12-15', NOW(), NOW(), 0, null, '87c88dbb-b31e-46b2-8bc3-0ea5ffb4bca2', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2019-12-22', NOW(), NOW(), 0, null, '41d99671-e2a1-41a8-b7f8-220c7ca5bfae', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2019-12-29', NOW(), NOW(), 0, null, '4c942aae-d094-424b-8e4e-91b8c186cfe7', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-01-05', NOW(), NOW(), 0, null, 'd83abad1-5fdd-41d8-ac16-8e49f85920a0', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-01-12', NOW(), NOW(), 0, null, '9a703fca-23e2-441c-813c-b9830eaa0dde', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-01-19', NOW(), NOW(), 0, null, '36252210-4cea-4f24-a5ed-b84bb5a6e543', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-01-26', NOW(), NOW(), 0, null, '05e95745-82d7-412b-b0a9-6aeb82b70960', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-02-02', NOW(), NOW(), 0, null, '093f9391-3858-42a1-8008-c1855ad605d1', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-02-09', NOW(), NOW(), 0, null, '053eaab4-4987-4009-bce8-cd34b5106120', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-02-16', NOW(), NOW(), 0, null, '3c095e67-1761-4ee0-8e9a-53bb422ef69d', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-02-23', NOW(), NOW(), 0, null, '005ddf79-9e20-4730-a994-6605d51197f2', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-03-01', NOW(), NOW(), 0, null, '8c3a71d8-aafe-4cc7-9b0c-81f2fbeb0c24', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-03-08', NOW(), NOW(), 0, null, 'aaba46e5-7781-491b-bf7b-64457d7ad9b0', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-03-15', NOW(), NOW(), 0, null, '646ae5db-6e62-47d7-baec-02877e21daef', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (563.00, 172.00, '2020-03-22', NOW(), NOW(), 0, null, '2da3620e-808f-471e-88f3-5f79f3d10f1a', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),

    (563.00, 172.00, '2022-06-19', NOW(), NOW(), 0, null, 'e7f9ca46-51b6-47a9-9526-ea816e565d14', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-06-26', NOW(), NOW(), 0, null, '0aa7fd5b-83cb-4a16-a37c-3b05687aa144', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-07-03', NOW(), NOW(), 0, null, 'e3cf97b3-1209-40ba-ade0-78bb093df9ec', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-07-10', NOW(), NOW(), 0, null, '0e6ad7ae-17f7-4aba-a880-0aa1b19d0b75', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-07-17', NOW(), NOW(), 0, null, '7d545be5-9d41-4093-af26-eb8ae9b6b187', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-07-24', NOW(), NOW(), 0, null, '258c8b10-763e-402f-8623-d7990c35e705', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-07-31', NOW(), NOW(), 0, null, '7727a4df-5fa2-4a26-a190-c5f44fb84112', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-08-07', NOW(), NOW(), 0, null, '47670a49-d7db-4526-9839-1c12fa2bd560', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-08-14', NOW(), NOW(), 0, null, '7d6faaf3-4f8c-4664-bfd2-1fa66eb83d96', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-08-21', NOW(), NOW(), 0, null, '3032b797-e478-48f4-bef9-d1fadef6e227', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-08-28', NOW(), NOW(), 0, null, '3bd366e9-1fdc-44ae-bb53-cf50d6cbf39c', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-09-04', NOW(), NOW(), 0, null, 'd55b01dd-daa5-43e7-8429-5b25ab7e8ef7', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-09-11', NOW(), NOW(), 0, null, '8ee32cf8-76fd-4abf-a1ea-47063c3c9fab', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-09-18', NOW(), NOW(), 0, null, 'c3ea7f10-2735-4e71-bbcf-b1f857a44587', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-09-25', NOW(), NOW(), 0, null, '27d3a491-689c-4b36-be5b-f88b43c2e65b', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-10-02', NOW(), NOW(), 0, null, '0f85415b-0434-4777-9cd2-38a4afc0ed58', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-10-09', NOW(), NOW(), 0, null, '21ad7de8-b3ce-4ea0-9ca9-854f4cbbd9df', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-10-16', NOW(), NOW(), 0, null, 'b0af170b-b329-4ae4-9825-ecb84d3c6c4c', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-10-23', NOW(), NOW(), 0, null, 'da1f8676-7249-4653-8ec3-c12faff0337c', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-10-30', NOW(), NOW(), 0, null, '2a1fec9b-c3ca-46db-8020-2e427fb00cb8', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-11-06', NOW(), NOW(), 0, null, '02db5abb-e160-46f4-8bc7-4bffa4c24933', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-11-13', NOW(), NOW(), 0, null, '8935162a-2fe1-47fc-8e60-6f8e156832c8', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (563.00, 172.00, '2022-11-20', NOW(), NOW(), 0, null, 'ea57bb2b-c056-4d2f-abdd-db96e7693cec', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),

    (228.00, 423.00, '2019-06-23', NOW(), NOW(), 0, null, '76743f3b-442a-4d57-8875-10eb1622bb53', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (238.00, 439.00, '2019-06-30', NOW(), NOW(), 0, null, '2308913a-5aec-48f0-ae69-a92890d2537c', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (242.00, 452.00, '2019-07-07', NOW(), NOW(), 0, null, 'cb961c9f-b139-42c0-9d04-218662b967eb', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (248.00, 467.00, '2019-07-14', NOW(), NOW(), 0, null, '63366b61-237f-45af-b099-d5b855029ad0', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (259.00, 480.00, '2019-07-21', NOW(), NOW(), 0, null, 'a9a478eb-52ff-4d71-8807-94c920d0cc51', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (263.00, 503.00, '2019-07-28', NOW(), NOW(), 0, null, '32727d66-2cdb-49b7-8e5f-45d31b33c2db', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (273.00, 521.00, '2019-08-04', NOW(), NOW(), 0, null, '0b5068d5-f347-48b2-8e6a-ae373fe3e46a', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (278.00, 531.00, '2019-08-11', NOW(), NOW(), 0, null, 'eaff65e8-2cb3-4230-b892-c1ad54ae290b', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (283.00, 539.00, '2019-08-18', NOW(), NOW(), 0, null, 'e75e9114-00bf-4e4a-b7aa-d1f215fe897f', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (296.00, 552.00, '2019-08-25', NOW(), NOW(), 0, null, 'b19ea02f-9155-4984-8f5f-2a24c777f400', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (303.00, 576.00, '2019-09-01', NOW(), NOW(), 0, null, '9afe9e69-0dfc-4cc9-87fa-2a062ae6a5be', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (315.00, 586.00, '2019-09-08', NOW(), NOW(), 0, null, 'a339a1bf-a6da-4ba7-be63-27e5cda94537', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (326.00, 604.00, '2019-09-15', NOW(), NOW(), 0, null, 'ba125de4-96c6-47fe-8d4f-22f0b9638f9b', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (338.00, 620.00, '2019-09-22', NOW(), NOW(), 0, null, 'c9ade46b-fde7-41ac-9603-c25057e2b6f6', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (342.00, 631.00, '2019-09-29', NOW(), NOW(), 0, null, '4f163d5e-aa40-4161-b5e0-46d669bc06a5', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (356.00, 645.00, '2019-10-06', NOW(), NOW(), 0, null, 'd1681725-302c-4a8a-a1fc-181b970d9743', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (373.00, 666.00, '2019-10-13', NOW(), NOW(), 0, null, '7c3a551a-3a52-416e-b5db-ad0752d2eae8', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (379.00, 683.00, '2019-10-20', NOW(), NOW(), 0, null, '77994854-c93a-441c-b79c-2e64effc8249', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (392.00, 691.00, '2019-11-24', NOW(), NOW(), 0, null, '05f57744-abf7-44db-beb8-6ec038313392', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 717.00, '2019-12-01', NOW(), NOW(), 0, null, '1c78b0c3-0004-4f6e-a506-b83e2f0ca40a', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 731.00, '2019-12-08', NOW(), NOW(), 0, null, '74ed9350-a5f3-44ac-bb23-985ddeb3129f', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 741.00, '2019-12-15', NOW(), NOW(), 0, null, 'e2237c49-7822-43b6-88ff-a274a33bf9f6', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 766.00, '2019-12-22', NOW(), NOW(), 0, null, 'a6f88d7c-828a-4874-b7c6-559d080a5ce6', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 788.00, '2019-12-29', NOW(), NOW(), 0, null, '38839304-b909-4461-bf81-03897bbb6bc9', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 811.00, '2020-01-05', NOW(), NOW(), 0, null, 'aeb4f1fb-ffee-4f85-b590-a56ee9ca743e', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 824.00, '2020-01-12', NOW(), NOW(), 0, null, '0f29782d-fea7-4abb-ac45-1395f7fa4ce0', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 845.00, '2020-01-19', NOW(), NOW(), 0, null, '5b8c7d6d-8370-4b12-9bbd-d78962fc5ed8', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 880.00, '2020-01-26', NOW(), NOW(), 0, null, 'f39d20f2-a032-4352-9b93-af9d5142e80f', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 900.00, '2020-02-02', NOW(), NOW(), 0, null, '30c86ae1-c443-4790-bd03-ef1d0aff1ef4', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 941.00, '2020-02-09', NOW(), NOW(), 0, null, '4c154570-5211-45b6-8647-ae6d3a74a0bc', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 976.00, '2020-02-16', NOW(), NOW(), 0, null, 'c951ef08-32b7-485e-8fac-a38f5cb2fe5f', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1018.00, '2020-02-23', NOW(), NOW(), 0, null, '0f69a8d5-2249-4132-be85-2128ad3281cd', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1066.00, '2020-03-01', NOW(), NOW(), 0, null, 'e00ba6a3-f174-4f8a-91a5-1d131c637351', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1077.00, '2020-03-08', NOW(), NOW(), 0, null, '4b61e2e0-9a93-4946-8bdc-fd713fc408ed', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1119.00, '2020-03-15', NOW(), NOW(), 0, null, 'b33878f7-3716-4fc5-bc1a-675b1e64f40e', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1163.00, '2020-03-22', NOW(), NOW(), 0, null, '1ce1ab3e-7213-4800-94c4-f2fd8155b747', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1203.00, '2020-03-29', NOW(), NOW(), 0, null, 'acdb229b-4f7c-4df9-a4e5-e7220f6f1e8a', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1217.00, '2020-04-05', NOW(), NOW(), 0, null, '5f3524cc-d0cc-4e4f-856c-aad58653ebf6', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1238.00, '2020-04-12', NOW(), NOW(), 0, null, 'd692df71-2331-47fc-8fd0-0ab68f581e21', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1276.00, '2020-04-19', NOW(), NOW(), 0, null, '37ccd56e-1169-418a-91fa-2d7af51fccd9', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (392.00, 1293.00, '2020-04-26', NOW(), NOW(), 0, null, '48b0be9d-c72a-4e27-b115-b0a7886c4481', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),

    (517.00, 499.00, '2019-06-23', NOW(), NOW(), 0, null, '1fbdd5dc-c77b-4ec8-85b1-f95fb6ea3cfd', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (536.00, 521.00, '2019-06-30', NOW(), NOW(), 0, null, '37303d90-7743-4f97-acf8-759ab56f82e9', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (561.00, 539.00, '2019-07-07', NOW(), NOW(), 0, null, '9df316f4-7de5-4526-be2b-db8fa1acf734', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (581.00, 551.00, '2019-07-14', NOW(), NOW(), 0, null, 'b9717e28-f475-45c9-92ac-61352be1c472', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (589.00, 564.00, '2019-07-21', NOW(), NOW(), 0, null, '6f59f9a4-dd92-4509-8825-ee6ff3277c50', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (609.00, 590.00, '2019-07-28', NOW(), NOW(), 0, null, 'b644eaaa-071e-4332-8d48-8c329daa9494', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (615.00, 618.00, '2019-08-04', NOW(), NOW(), 0, null, '05799ebd-796e-4125-a446-6580ddefd00f', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (636.00, 646.00, '2019-08-11', NOW(), NOW(), 0, null, '92c246c8-9cc2-400e-8d99-7b9a78835e76', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (646.00, 672.00, '2019-08-18', NOW(), NOW(), 0, null, '69866ae0-e00b-4318-8718-2afecd15882a', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (653.00, 683.00, '2019-08-25', NOW(), NOW(), 0, null, 'cb171a1f-ef3f-4750-ae79-dd03229b6d89', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (671.00, 692.00, '2019-09-01', NOW(), NOW(), 0, null, '7edb07f4-941a-4bf0-8c0c-73aae9f5866e', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (703.00, 705.00, '2019-09-08', NOW(), NOW(), 0, null, '5affad4e-264b-4223-be85-3e258139807c', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (721.00, 726.00, '2019-09-15', NOW(), NOW(), 0, null, 'f8cf4a21-09bf-46c0-99ac-4a045bfa1b15', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (736.00, 746.00, '2019-09-22', NOW(), NOW(), 0, null, 'a1812988-79f2-4e86-9a7f-b700d3999dc5', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (755.00, 771.00, '2019-09-29', NOW(), NOW(), 0, null, 'f361ab8e-55b3-4b9e-81d1-ec6d5174c339', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (770.00, 782.00, '2019-10-06', NOW(), NOW(), 0, null, 'b66316b0-c489-4a89-bb34-d0ccbb80c8a1', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (800.00, 805.00, '2019-10-13', NOW(), NOW(), 0, null, '1850878a-cadc-40b4-bcfe-24426ba84f5e', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (838.00, 827.00, '2019-10-20', NOW(), NOW(), 0, null, 'd0d2555a-f86a-42ba-9862-ac841d529a65', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (860.00, 847.00, '2019-12-22', NOW(), NOW(), 0, null, '38933041-0aba-4603-be5b-deada9fa88a9', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (879.00, 876.00, '2019-12-29', NOW(), NOW(), 0, null, '68ced3f2-3f6e-49d8-9601-c625b3bd4616', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (914.00, 890.00, '2020-01-05', NOW(), NOW(), 0, null, '8b061332-10b5-46ae-a043-336aac3fbd7b', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (956.00, 911.00, '2020-01-12', NOW(), NOW(), 0, null, 'fe23f07e-9e89-4dc2-ba1f-ae5addf5a56e', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1000.00, 939.00, '2020-01-19', NOW(), NOW(), 0, null, '0f9ad052-babd-4d0f-a68e-ee27dc94f4f9', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1035.00, 964.00, '2020-01-26', NOW(), NOW(), 0, null, '3d088317-742c-4647-b629-b9bbe60293f7', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1060.00, 1008.00, '2020-02-02', NOW(), NOW(), 0, null, '4ac80881-d826-4ab9-9920-642abca94a4c', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1081.00, 1020.00, '2020-02-09', NOW(), NOW(), 0, null, '8a05aeb1-25ac-42cf-a800-08724462279f', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1129.00, 1033.00, '2020-02-16', NOW(), NOW(), 0, null, '65b74757-b554-4876-8778-05b0ff05d576', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1143.00, 1050.00, '2020-02-23', NOW(), NOW(), 0, null, '7cdcff82-4439-4543-b9b0-7ef3b5d08e33', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1163.00, 1099.00, '2020-03-01', NOW(), NOW(), 0, null, '55ee758f-442d-461c-85c5-0d2542957cff', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1219.00, 1112.00, '2020-03-08', NOW(), NOW(), 0, null, '73192e05-8e27-4c5f-b593-1d3a189b75f7', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1279.00, 1149.00, '2020-03-15', NOW(), NOW(), 0, null, 'fcd12e60-005b-4296-8b42-41e02d88d184', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1341.00, 1178.00, '2020-03-22', NOW(), NOW(), 0, null, '460e683f-4516-4674-a612-8e642b8e0b85', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1390.00, 1199.00, '2020-03-29', NOW(), NOW(), 0, null, '0f99c735-d8c6-40f4-b263-a077d7662f65', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1419.00, 1219.00, '2020-04-05', NOW(), NOW(), 0, null, '14da9dbe-8834-4e3c-9bed-e5efb10519ee', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1442.00, 1263.00, '2020-04-12', NOW(), NOW(), 0, null, 'da031db4-2aa1-4433-88c5-bd31d91eb127', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1471.00, 1309.00, '2020-04-19', NOW(), NOW(), 0, null, '63d36b0f-9c67-4972-9888-c64a88f4aeec', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (1529.00, 1329.00, '2020-04-26', NOW(), NOW(), 0, null, '38f40214-3657-4a0b-add8-3d96a3c5703d', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b');


INSERT INTO variable_fees (amount, date, created_at, modified_at, version, created_by, id, modified_by, rent_id)
VALUES
    (99.00, '2019-06-17', NOW(), NOW(), 0, null, '1d6cf000-7aea-49cf-a3db-2f125b5e098c', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (107.00, '2019-06-24', NOW(), NOW(), 0, null, '68919358-2b32-4da5-ae95-72b45eb1c937', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (93.00, '2019-07-01', NOW(), NOW(), 0, null, '4c2c3303-7d98-4b0a-9ba0-5f3776238a6b', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (101.00, '2019-07-08', NOW(), NOW(), 0, null, 'cf9aba63-1312-483d-b453-a5780bea5921', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (107.00, '2019-07-15', NOW(), NOW(), 0, null, '9c9de474-d33c-4c74-8058-344a1b812cc8', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (103.00, '2019-07-22', NOW(), NOW(), 0, null, '062c1702-7fc9-478d-be3c-80f48c303256', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (100.00, '2019-07-29', NOW(), NOW(), 0, null, '55e1c696-b442-42f2-ab3d-6e45251cd670', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (102.00, '2019-08-05', NOW(), NOW(), 0, null, '7362dc1e-45ef-4c50-a70c-bf8ad1839eb5', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (93.00, '2019-08-12', NOW(), NOW(), 0, null, '8a6ad225-000b-402b-a46c-d8ccdf76029f', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (90.00, '2019-08-19', NOW(), NOW(), 0, null, '35f36e03-cd61-4e60-8998-179856627984', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (99.00, '2019-08-26', NOW(), NOW(), 0, null, 'ad625e63-f1e7-4c18-b7f4-712eccf82abe', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (100.00, '2019-09-02', NOW(), NOW(), 0, null, '64af7c78-3f8f-46fb-af82-7c17f17068dc', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (91.00, '2019-09-09', NOW(), NOW(), 0, null, '4b8193de-a390-4227-aa01-88c6b17c27fd', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (92.00, '2019-09-16', NOW(), NOW(), 0, null, '6dc1c2c6-e6cb-4bae-b594-b28e113b51f1', null, '2300d87f-e253-4c59-a650-c39b8195c8fd'),
    (98.00, '2019-10-22', NOW(), NOW(), 0, null, '64908b21-edbf-411d-a886-adb63f0b7827', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (92.00, '2019-10-29', NOW(), NOW(), 0, null, '1458eeef-894e-40a9-a6d2-e30a47d722b3', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (100.00, '2019-11-05', NOW(), NOW(), 0, null, '0264ec05-e0cb-46ce-9c7a-b18a182c43ba', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (95.00, '2019-11-12', NOW(), NOW(), 0, null, '0ec328da-bc93-4dd0-ad40-879d6a5af072', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (95.00, '2019-11-19', NOW(), NOW(), 0, null, '97929d43-fa2c-451d-80de-675e24ea6fcc', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (95.00, '2019-11-26', NOW(), NOW(), 0, null, '45e94062-69d4-4999-90f5-64ad8dc982ef', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (93.00, '2019-12-03', NOW(), NOW(), 0, null, 'f56edc0c-c026-47a1-b056-36b98d4c995c', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (94.00, '2019-12-10', NOW(), NOW(), 0, null, '50ba7542-b861-41d5-b517-1e66a8c7b9a7', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (90.00, '2019-12-17', NOW(), NOW(), 0, null, '405db792-1ce4-409a-8a69-dbeda2c25a78', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (102.00, '2019-12-24', NOW(), NOW(), 0, null, '9dd1e5f9-b581-4db0-85ee-c9c051729330', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (104.00, '2019-12-31', NOW(), NOW(), 0, null, '055dce42-0ae5-4097-9e3d-5f6863aa2936', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (95.00, '2020-01-07', NOW(), NOW(), 0, null, '467938aa-b378-4a8f-a5ff-6e0bfabcb811', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (104.00, '2020-01-14', NOW(), NOW(), 0, null, 'b9a4d30a-71a2-4fc0-8245-d0d11a5bfb88', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (88.00, '2020-01-21', NOW(), NOW(), 0, null, '31844521-46d8-4183-8f6f-d3baa8c749d4', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (90.00, '2020-01-28', NOW(), NOW(), 0, null, 'caa654aa-2811-41ee-916a-b0a46752dd94', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (107.00, '2020-02-04', NOW(), NOW(), 0, null, 'a2115915-f69c-43e3-830f-6e3f5fd41d6f', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (102.00, '2020-02-11', NOW(), NOW(), 0, null, 'd15433de-2993-450a-b000-3e1ae2904b79', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),
    (104.00, '2020-02-18', NOW(), NOW(), 0, null, '16ee6c5e-ae1a-4e7d-a42e-b799118fa4c0', null, 'abc6e0d0-a6d4-41c9-b191-0ccab5c1be5c'),

    (319.00, '2022-06-17', NOW(), NOW(), 0, null, '9f7c34f9-74d8-482f-9b2f-2ee1b88c560e', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (311.00, '2022-06-24', NOW(), NOW(), 0, null, '31369992-0991-456f-9b77-43ce87f1b77d', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (336.00, '2022-07-01', NOW(), NOW(), 0, null, '67abf372-fbf9-48e3-9b2f-bdc7171ae66f', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (315.00, '2022-07-08', NOW(), NOW(), 0, null, '31cd821b-fb1c-4125-a100-9fc8a281dd18', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (302.00, '2022-07-15', NOW(), NOW(), 0, null, 'f820ed7e-c4b4-47b2-b6b3-273bb7845cfd', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (348.00, '2022-07-22', NOW(), NOW(), 0, null, '421aff44-446e-468a-827d-fd3f9496cad6', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (351.00, '2022-07-29', NOW(), NOW(), 0, null, '76e5a879-d324-485c-aeef-1176bba55f4a', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (302.00, '2022-08-05', NOW(), NOW(), 0, null, '03c1b5f4-c419-4c3e-a489-d859e19be412', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (288.00, '2022-08-12', NOW(), NOW(), 0, null, 'f43c2d6a-3fc5-4e6d-9756-e11ffd17f5ca', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (351.00, '2022-08-19', NOW(), NOW(), 0, null, 'b1b8bc20-d9a5-4c44-a9a6-d30ca205453a', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (300.00, '2022-08-26', NOW(), NOW(), 0, null, '581335bd-1417-4053-9cf8-c44538090afe', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (308.00, '2022-09-02', NOW(), NOW(), 0, null, 'dc298eec-0f94-429c-92cf-44862bbfca3a', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (322.00, '2022-09-09', NOW(), NOW(), 0, null, 'c11d864b-e30c-4834-9f45-93abb194388b', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),
    (343.00, '2022-09-16', NOW(), NOW(), 0, null, '4e68c371-fe98-4537-888c-8cacb8085068', null, '40b48d44-34b6-4cd6-8582-ddc9d7144b3f'),

    (219.00, '2022-06-17', NOW(), NOW(), 0, null, '8684549f-06c1-48a7-a306-776222e6f634', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (243.00, '2022-06-24', NOW(), NOW(), 0, null, 'f7c7a2d2-5c6a-4952-b8b8-df5d92be51aa', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (227.00, '2022-07-01', NOW(), NOW(), 0, null, '23c3f803-a6fb-4ffa-b32a-e8ef0a94b6eb', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (233.00, '2022-07-08', NOW(), NOW(), 0, null, 'e7416371-1f00-4f49-a7b6-e66cce2c5202', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (245.00, '2022-07-15', NOW(), NOW(), 0, null, '294f8719-aabe-4bfb-9e5e-29b768e04d20', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (234.00, '2022-07-22', NOW(), NOW(), 0, null, '4922cb21-c2a2-4f3d-baab-f9ada3b11643', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (225.00, '2022-07-29', NOW(), NOW(), 0, null, '17dff167-a2a0-468b-875e-7b26d72eb3b7', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (222.00, '2022-08-05', NOW(), NOW(), 0, null, '2d4d3804-c5e4-4956-bd24-90addfd98d1d', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (209.00, '2022-08-12', NOW(), NOW(), 0, null, 'b6167806-15ae-492c-afec-156b4d269857', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (231.00, '2022-08-19', NOW(), NOW(), 0, null, '3101e4b1-fa2b-457c-801d-4463baaebc00', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (238.00, '2022-08-26', NOW(), NOW(), 0, null, '76520558-3b68-4e3e-9862-cd612adff617', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (213.00, '2022-09-02', NOW(), NOW(), 0, null, '055671cc-7973-4135-98cc-fec465360e70', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (236.00, '2022-09-09', NOW(), NOW(), 0, null, '642e1881-5b46-4053-a3cf-26ebad0f8b59', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (221.00, '2022-09-16', NOW(), NOW(), 0, null, 'b9831603-e85f-41e8-acae-d6526cef5909', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (217.00, '2022-09-23', NOW(), NOW(), 0, null, 'ff36bd0e-19fa-4f40-9d7c-2fc7198717de', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (243.00, '2022-09-30', NOW(), NOW(), 0, null, 'f4169812-b18a-47b2-b417-fb265509b574', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (238.00, '2022-10-07', NOW(), NOW(), 0, null, 'dbf8e348-fbf7-4e2b-8e91-7c8837d8e5d3', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (237.00, '2022-10-14', NOW(), NOW(), 0, null, '84ba635e-1af7-4897-a155-30102a3e5ea0', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (240.00, '2022-10-21', NOW(), NOW(), 0, null, 'db7e9085-e3af-4a9b-94ea-75ae293e4fe0', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (233.00, '2022-10-28', NOW(), NOW(), 0, null, 'a742092a-ce62-4436-bea7-691fd41074e6', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (237.00, '2022-11-04', NOW(), NOW(), 0, null, '495d92d8-decf-4795-9ee7-de32daee3a60', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (203.00, '2022-11-11', NOW(), NOW(), 0, null, 'cbad6925-61dc-4a00-84dd-249744db6296', null, '21b5e894-4715-4608-960d-9441f758b4f3'),
    (235.00, '2022-11-18', NOW(), NOW(), 0, null, 'd29e106f-a9ed-475a-b671-eb378eac095f', null, '21b5e894-4715-4608-960d-9441f758b4f3'),

    (100.00, '2019-06-17', NOW(), NOW(), 0, null, '8038040a-e743-4028-8bb8-1b21a7fb11aa', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (101.00, '2019-06-24', NOW(), NOW(), 0, null, '65f826e9-de40-4214-a73b-be9c3e44749e', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (107.00, '2019-07-01', NOW(), NOW(), 0, null, '7e484d83-14c0-4a24-8bcc-5a5cd6a9f118', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (102.00, '2019-07-08', NOW(), NOW(), 0, null, '1d170aeb-82bb-434c-874a-8ee4f0498f70', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (98.00, '2019-07-15', NOW(), NOW(), 0, null, 'fa2e4c88-0acf-481d-8065-48cafabf48cd', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (100.00, '2019-07-22', NOW(), NOW(), 0, null, '152da618-fffd-4a8f-b426-f3c559b8fa46', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (97.00, '2019-07-29', NOW(), NOW(), 0, null, 'c44481af-e5b4-4156-937d-59c7a4dc7ae4', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (103.00, '2019-08-05', NOW(), NOW(), 0, null, '20cddf81-eb3f-44e2-9bb7-ee3f367a0690', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (106.00, '2019-08-12', NOW(), NOW(), 0, null, 'aeb5d0ba-58fa-40ca-88af-58e2ea8169bc', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (97.00, '2019-08-19', NOW(), NOW(), 0, null, 'a7f205cb-a48d-4d3f-9133-20e4fc5212f5', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (94.00, '2019-08-26', NOW(), NOW(), 0, null, '80bf37cc-d6fb-443d-aa3b-3ba1b534d7ad', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (101.00, '2019-09-02', NOW(), NOW(), 0, null, '88bea453-6bb4-47d5-9b39-18c60735c582', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (94.00, '2019-09-09', NOW(), NOW(), 0, null, '3901bdc5-3d5b-4843-9b2b-c44f5a95aa64', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (94.00, '2019-09-16', NOW(), NOW(), 0, null, '51ff95ac-8743-450d-8c84-5e1ff25b8702', null, 'ee9eec2b-85e5-4608-9c13-b7f495b11031'),
    (129.00, '2019-10-22', NOW(), NOW(), 0, null, '0342fefc-49da-4a7e-90fd-77ddc8fcb4b5', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (118.00, '2019-10-29', NOW(), NOW(), 0, null, 'fde52fa1-49ab-452c-9233-0dcda0469eeb', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (123.00, '2019-11-05', NOW(), NOW(), 0, null, 'e38f81e8-23ec-4852-a89d-f59ae77d9de1', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (126.00, '2019-11-12', NOW(), NOW(), 0, null, 'db2ec049-6a30-4658-9d06-00a5afac8b16', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (129.00, '2019-11-19', NOW(), NOW(), 0, null, '716a3b59-5dc1-4382-bcbf-f35f41269feb', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (115.00, '2019-11-26', NOW(), NOW(), 0, null, 'f4f18a92-4872-4d6f-9643-081e131bca73', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (119.00, '2019-12-03', NOW(), NOW(), 0, null, '15ad2181-e211-4038-9c01-10d6f34ffec2', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (136.00, '2019-12-10', NOW(), NOW(), 0, null, 'a6e089be-aedc-43c2-a1a3-09433d0f56a9', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (140.00, '2019-12-17', NOW(), NOW(), 0, null, '20e22322-66b9-4338-b55a-27d647084333', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (137.00, '2019-12-24', NOW(), NOW(), 0, null, 'cad52e6d-90e9-42e6-ae2e-697f53022b5d', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (123.00, '2019-12-31', NOW(), NOW(), 0, null, '91960589-620f-451c-aef4-86a7425a3c79', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (134.00, '2020-01-07', NOW(), NOW(), 0, null, '24b5d119-fd27-4581-9cd5-1fd5b9ef6a8f', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (115.00, '2020-01-14', NOW(), NOW(), 0, null, '876ab42e-0885-48cc-aa5b-9d99073f45c2', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (138.00, '2020-01-21', NOW(), NOW(), 0, null, '6ef4b762-e4f4-4220-a4ae-a49294e43af2', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (131.00, '2020-01-28', NOW(), NOW(), 0, null, '763976f0-500d-4420-9820-df83f27d2042', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (130.00, '2020-02-04', NOW(), NOW(), 0, null, 'f5da21e3-524b-4fc9-b843-d52c05e2c8ca', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (123.00, '2020-02-11', NOW(), NOW(), 0, null, 'd074061c-7e1b-42f9-a4fa-27ea8c31ae1e', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),
    (129.00, '2020-02-18', NOW(), NOW(), 0, null, 'ce245060-bc2e-43fb-b358-975150cb6770', null, 'edb129ba-3974-40da-98b3-d112e68ba19a'),

    (268.00, '2019-06-17', NOW(), NOW(), 0, null, '709f805e-5364-4b27-bb21-925e3bca9db4', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (256.00, '2019-06-24', NOW(), NOW(), 0, null, '84b522dc-104e-43cc-a00f-e46edd99a847', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (243.00, '2019-07-01', NOW(), NOW(), 0, null, '913d82ea-5b84-4c0b-8d33-2e662bffbedf', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (273.00, '2019-07-08', NOW(), NOW(), 0, null, '4aeb547e-b109-4bc2-996f-0ffd9b6f379a', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (288.00, '2019-07-15', NOW(), NOW(), 0, null, 'c0cede17-ff64-45eb-a084-11de6ff9732a', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (294.00, '2019-07-22', NOW(), NOW(), 0, null, '7e3ec7af-e646-4369-8e43-03e771910db5', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (269.00, '2019-07-29', NOW(), NOW(), 0, null, 'fb4b905f-e335-4dbf-9547-67a58521be17', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (289.00, '2019-08-05', NOW(), NOW(), 0, null, '8376c01f-36b7-4494-944e-cf1e284632a4', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (286.00, '2019-08-12', NOW(), NOW(), 0, null, 'ed708a31-ddc4-43b7-867c-e3699ec69fca', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (253.00, '2019-08-19', NOW(), NOW(), 0, null, '6039e3db-3745-4ab6-b612-616b44b787aa', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (272.00, '2019-08-26', NOW(), NOW(), 0, null, 'd5434d94-0d6b-4382-828d-a30a35be94c4', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (273.00, '2019-09-02', NOW(), NOW(), 0, null, '9cb8d151-d68c-4e56-91d1-6e0edf71d12e', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (276.00, '2019-09-09', NOW(), NOW(), 0, null, '43d89d74-7bbf-4dba-a94b-3058982b1363', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (254.00, '2019-09-16', NOW(), NOW(), 0, null, '66a104e6-9ee6-4a6e-9c1e-fc6a49994aeb', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (262.00, '2019-09-23', NOW(), NOW(), 0, null, 'bf98b37b-aba1-47e9-82e7-08c557224d6d', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (285.00, '2019-09-30', NOW(), NOW(), 0, null, '47b304c9-da9d-49ad-a116-673fe158ba4d', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (284.00, '2019-10-07', NOW(), NOW(), 0, null, '5a0e223b-6181-48ea-ba8c-08664b966f42', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (276.00, '2019-10-14', NOW(), NOW(), 0, null, '106153f1-caea-48a8-b011-209423f66aef', null, '70cb0657-f9d2-4aa7-9f09-a84825011326'),
    (477.00, '2019-11-20', NOW(), NOW(), 0, null, '047fa6e4-601e-4bdf-9491-5bca978cc0bd', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (431.00, '2019-11-27', NOW(), NOW(), 0, null, '0629d04f-a98b-42a8-81ca-27e8a0aee6ff', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (471.00, '2019-12-04', NOW(), NOW(), 0, null, 'bde77098-03ae-4b2d-948e-3ab50253102f', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (406.00, '2019-12-11', NOW(), NOW(), 0, null, '13c882a3-44e7-4297-9221-b529f4d728bc', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (469.00, '2019-12-18', NOW(), NOW(), 0, null, 'fd30462f-47de-42bf-b5e3-3a00df567dc4', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (470.00, '2019-12-25', NOW(), NOW(), 0, null, 'd815345e-e583-41f9-a18a-8c105f59e9dd', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (406.00, '2020-01-01', NOW(), NOW(), 0, null, '881748af-dc00-47dc-9ab6-2d08c9c667e6', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (464.00, '2020-01-08', NOW(), NOW(), 0, null, 'de526170-5f8e-4347-b4cb-268130fe2d58', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (448.00, '2020-01-15', NOW(), NOW(), 0, null, 'a05c1e2c-419c-4135-8adf-4607c432aec5', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (428.00, '2020-01-22', NOW(), NOW(), 0, null, '9985f9b6-0d36-4d5a-82a5-e6e908c8b762', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (448.00, '2020-01-29', NOW(), NOW(), 0, null, '1f7cdd1c-b48f-42ae-8b11-8ff04bda29b4', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (432.00, '2020-02-05', NOW(), NOW(), 0, null, '6932f9b9-5bfb-4553-8459-354f4b9c86fa', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (418.00, '2020-02-12', NOW(), NOW(), 0, null, 'a2e4a276-e891-4061-a7c6-07253463f55a', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (487.00, '2020-02-19', NOW(), NOW(), 0, null, '225cf5d7-4251-4fce-b157-a02a3f20291c', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (486.00, '2020-02-26', NOW(), NOW(), 0, null, 'd0ea49db-747c-4b06-ae30-3a4b6a4adb0e', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (409.00, '2020-03-04', NOW(), NOW(), 0, null, '31fa02ef-0ca9-4661-8a48-acca813693f3', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (437.00, '2020-03-11', NOW(), NOW(), 0, null, '4d7e1b85-6922-42cc-a7a7-54feeaa46d46', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),
    (449.00, '2020-03-18', NOW(), NOW(), 0, null, 'dc6461d5-bcd7-4beb-b4d7-960eaf3eba43', null, '670e3eb0-e34d-43c8-bc0b-4d25dac6cf9b'),

    (487.00, '2022-06-17', NOW(), NOW(), 0, null, 'fea085a3-9e99-4fed-a090-178dd284130a', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (469.00, '2022-06-24', NOW(), NOW(), 0, null, '9cb082ac-5477-433f-930d-f0aaf35e99b0', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (405.00, '2022-07-01', NOW(), NOW(), 0, null, 'e6c79313-3f13-4091-bce6-799406a9ac08', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (431.00, '2022-07-08', NOW(), NOW(), 0, null, 'ced2d3a4-669c-4cb5-a57b-38f057ecca30', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (411.00, '2022-07-15', NOW(), NOW(), 0, null, '5e18986f-926c-4ebf-9c67-4cc29791079c', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (448.00, '2022-07-22', NOW(), NOW(), 0, null, 'd1cfbc46-5008-498b-92c4-11df650ad4f9', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (434.00, '2022-07-29', NOW(), NOW(), 0, null, 'ea81678f-6683-45e2-91fa-ee4bf96551e0', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (424.00, '2022-08-05', NOW(), NOW(), 0, null, '92aecacf-dc66-48e5-99b1-44dcae62dab8', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (462.00, '2022-08-12', NOW(), NOW(), 0, null, 'f1b6b326-437f-4f06-8a83-de0754e0583e', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (477.00, '2022-08-19', NOW(), NOW(), 0, null, '4822d673-685e-449c-b4bf-74d802bde5a1', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (456.00, '2022-08-26', NOW(), NOW(), 0, null, 'f62d69f2-adb3-44f5-ae31-b09eb62e57b1', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (494.00, '2022-09-02', NOW(), NOW(), 0, null, '87bf6b08-3727-4122-848e-221638655d3b', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (490.00, '2022-09-09', NOW(), NOW(), 0, null, 'a12283ca-b096-43b5-8a5a-fabab0624111', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (488.00, '2022-09-16', NOW(), NOW(), 0, null, '1a4c818d-7142-4946-b77e-e539d662fa80', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (435.00, '2022-09-23', NOW(), NOW(), 0, null, '347485bb-bc64-4046-9f07-edb09329e45f', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (462.00, '2022-09-30', NOW(), NOW(), 0, null, '4137f8aa-8d54-4d8e-a92c-6028e56ae2a9', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (436.00, '2022-10-07', NOW(), NOW(), 0, null, '8f5b04a4-1a59-4167-b14d-99e7e85b38ca', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (474.00, '2022-10-14', NOW(), NOW(), 0, null, 'dba7ca7c-3c1b-4ba8-af7b-702670185db7', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (471.00, '2022-10-21', NOW(), NOW(), 0, null, '5e6e64bf-4305-48b0-b17c-b425f0d69a8e', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (488.00, '2022-10-28', NOW(), NOW(), 0, null, 'b411748d-277e-490d-817d-9fba948edc7c', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (470.00, '2022-11-04', NOW(), NOW(), 0, null, '28374875-cd40-4ecd-9a75-affd4ec36927', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (449.00, '2022-11-11', NOW(), NOW(), 0, null, '0a2cf944-7917-427d-bd72-99c9509da440', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),
    (426.00, '2022-11-18', NOW(), NOW(), 0, null, '0cca2153-545b-4462-847c-e96328a2974b', null, 'f1dfa545-cf58-4974-bafb-f0e459025a7b'),

    (166.00, '2019-06-17', NOW(), NOW(), 0, null, '2b554167-49c7-4065-8852-e228e84c5e28', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (167.00, '2019-06-24', NOW(), NOW(), 0, null, 'ad641b0c-3616-40d3-8676-d2cd23a61ec9', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (180.00, '2019-07-01', NOW(), NOW(), 0, null, 'fded6b8f-9ec9-419a-aad2-4b0a23706503', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (197.00, '2019-07-08', NOW(), NOW(), 0, null, '2955d2ac-c982-4682-aa8d-b296d10f55f2', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (196.00, '2019-07-15', NOW(), NOW(), 0, null, '876e5990-c8a3-49c3-bf11-6d89e6f04645', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (195.00, '2019-07-22', NOW(), NOW(), 0, null, '409a9ad4-f260-48dc-9bcc-d7518467d2a2', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (176.00, '2019-07-29', NOW(), NOW(), 0, null, 'e78e22fd-b6ab-4ee7-8181-974c021189b2', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (177.00, '2019-08-05', NOW(), NOW(), 0, null, 'bbaa07b6-d5f6-4266-9119-76b405e601f6', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (185.00, '2019-08-12', NOW(), NOW(), 0, null, '1bd107f8-0c18-4154-9874-97005f8a96dc', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (190.00, '2019-08-19', NOW(), NOW(), 0, null, '2e55aeb2-d418-4774-9618-86a8d5323f46', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (197.00, '2019-08-26', NOW(), NOW(), 0, null, 'd31d0aad-fea7-471c-a620-28faf293d17f', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (166.00, '2019-09-02', NOW(), NOW(), 0, null, 'a560a1b6-62e5-4d5a-ab99-30f986aa247c', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (177.00, '2019-09-09', NOW(), NOW(), 0, null, '670f25d9-bb18-459d-98dc-18dd41342581', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (187.00, '2019-09-16', NOW(), NOW(), 0, null, 'b5292b39-1568-4ceb-b318-d915c4afbf7b', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (175.00, '2019-09-23', NOW(), NOW(), 0, null, 'f76841a8-9bed-4fc9-a0d9-ad9efb4296de', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (179.00, '2019-09-30', NOW(), NOW(), 0, null, '56a17a98-4b6d-4dac-a811-d926505cd28d', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (179.00, '2019-10-07', NOW(), NOW(), 0, null, '7452e80b-831c-4299-a703-f4546710542c', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (183.00, '2019-10-14', NOW(), NOW(), 0, null, '3e240489-9573-4420-b908-17bff0515ac8', null, '36df4f32-a2a9-4d08-a947-b39d6ac7eb74'),
    (342.00, '2019-11-20', NOW(), NOW(), 0, null, 'c74b9fb2-c3dc-4a65-bf89-83809842b345', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (284.00, '2019-11-27', NOW(), NOW(), 0, null, '83cf2264-6be3-43a8-ab10-ec0e3ac070a0', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (333.00, '2019-12-04', NOW(), NOW(), 0, null, '7fea8684-3f07-4ee5-ae26-6ab4457efa64', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (329.00, '2019-12-11', NOW(), NOW(), 0, null, '5ae0cd49-f287-46f0-b703-a4e873e6af9c', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (318.00, '2019-12-18', NOW(), NOW(), 0, null, '72689c4b-9517-48b9-92c5-d7f395db906b', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (309.00, '2019-12-25', NOW(), NOW(), 0, null, '7f2015a1-9f30-4b3a-86ce-1e02940c9a21', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (300.00, '2020-01-01', NOW(), NOW(), 0, null, '0a3634a5-2122-4f13-b38e-7c5aeb28d6d6', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (302.00, '2020-01-08', NOW(), NOW(), 0, null, '576133cb-a361-4f5d-8eda-82750138d27a', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (338.00, '2020-01-15', NOW(), NOW(), 0, null, 'dbec79cb-526d-4b8f-9f94-fd6049638c87', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (301.00, '2020-01-22', NOW(), NOW(), 0, null, '90a328bb-3682-4d05-91c8-29a3a8e3df93', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (340.00, '2020-01-29', NOW(), NOW(), 0, null, '764324af-2087-476a-991e-aa93c2bd29f3', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (298.00, '2020-02-05', NOW(), NOW(), 0, null, '4bdfdd6e-186f-47bc-8646-2b42c6b7e2f2', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (310.00, '2020-02-12', NOW(), NOW(), 0, null, 'd54357b5-1538-4472-b90b-057db2c45320', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (315.00, '2020-02-19', NOW(), NOW(), 0, null, '83709150-9887-4217-aae4-778493083d5e', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (319.00, '2020-02-26', NOW(), NOW(), 0, null, '745ead66-30a6-41fa-b303-c34e69c2093e', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (333.00, '2020-03-04', NOW(), NOW(), 0, null, '647e0cf1-3c45-4618-954e-2c5d889b0db3', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (326.00, '2020-03-11', NOW(), NOW(), 0, null, '5f238a4e-6f49-493b-99fa-1a83c793fe05', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (291.00, '2020-03-18', NOW(), NOW(), 0, null, '145618b8-b501-442d-bca8-34603567c9b6', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (292.00, '2020-03-25', NOW(), NOW(), 0, null, '235f0819-34ac-4c5f-a488-c0aa59578987', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (333.00, '2020-04-01', NOW(), NOW(), 0, null, '3445ff27-ca6a-4320-bdf9-0bc246b02d4e', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (305.00, '2020-04-08', NOW(), NOW(), 0, null, 'd3142dd4-acb0-4a98-be2e-9a5c7b954d0e', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (330.00, '2020-04-15', NOW(), NOW(), 0, null, '401f8c0b-d8a4-4a30-9684-02f9c131b354', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),
    (341.00, '2020-04-22', NOW(), NOW(), 0, null, '5265410f-b503-4b92-9dc4-d525af31f4b3', null, '07e6f3de-c3d3-404a-93bf-116c59b76794'),

    (411.00, '2019-06-17', NOW(), NOW(), 0, null, '27300d15-e080-4cfa-a52b-b2b91de376c2', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (422.00, '2019-06-24', NOW(), NOW(), 0, null, 'e8559fdd-871c-4b84-bf10-6ce3469a6de9', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (422.00, '2019-07-01', NOW(), NOW(), 0, null, '1c67db8f-db64-4997-ad80-47b9f4470e21', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (447.00, '2019-07-08', NOW(), NOW(), 0, null, 'f84e3e6a-02c9-4a94-b5b7-d897baa202de', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (430.00, '2019-07-15', NOW(), NOW(), 0, null, 'db975d6b-e77d-4815-bcc0-308b4ed247ce', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (437.00, '2019-07-22', NOW(), NOW(), 0, null, '663d3758-da94-4fb2-853d-a297e7239685', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (404.00, '2019-07-29', NOW(), NOW(), 0, null, '739da693-656a-4f6f-bbe3-ea715155650b', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (388.00, '2019-08-05', NOW(), NOW(), 0, null, 'a004290d-8c06-41eb-8d37-d794c80a9fa9', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (390.00, '2019-08-12', NOW(), NOW(), 0, null, '5862f0fa-cfb6-4d9c-b3ec-31b745c3813e', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (411.00, '2019-08-19', NOW(), NOW(), 0, null, '1b2d2953-1feb-4e13-ab35-cb3d3895d474', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (386.00, '2019-08-26', NOW(), NOW(), 0, null, '8b213705-c645-496c-aa83-dc57d67961d5', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (447.00, '2019-09-02', NOW(), NOW(), 0, null, '7ad4e325-626b-439a-9460-62975cce6814', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (433.00, '2019-09-09', NOW(), NOW(), 0, null, '68ce0b37-0c3a-4b35-a350-b73b7e0d0f03', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (431.00, '2019-09-16', NOW(), NOW(), 0, null, 'd974849f-9852-40cb-9124-20a7c46e683a', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (413.00, '2019-09-23', NOW(), NOW(), 0, null, 'a5630c0f-d214-4a23-bbbb-62e84a7cd6a1', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (383.00, '2019-09-30', NOW(), NOW(), 0, null, 'ddc10710-09e3-48ea-bc64-4e2a77b7102a', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (426.00, '2019-10-07', NOW(), NOW(), 0, null, 'c645b6e8-9db3-4c51-8b80-810923b9aaf6', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (453.00, '2019-10-14', NOW(), NOW(), 0, null, 'd0612c39-ce39-4117-aff7-2f4e22341028', null, 'c9634491-d322-4283-aff5-52d6bb5d84da'),
    (684.00, '2019-12-20', NOW(), NOW(), 0, null, 'de65adf0-25df-4852-b87a-ec81217ec3ac', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (670.00, '2019-12-27', NOW(), NOW(), 0, null, 'dd7f693a-1860-4010-a3bb-124219c7591d', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (629.00, '2020-01-03', NOW(), NOW(), 0, null, '373f13d2-2a2f-494b-a815-cd01740395c9', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (649.00, '2020-01-10', NOW(), NOW(), 0, null, '3f003fa9-6e83-40a7-98c0-0015a692cce5', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (715.00, '2020-01-17', NOW(), NOW(), 0, null, '1c0962ef-0d31-4114-bbce-c4f59db67306', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (686.00, '2020-01-24', NOW(), NOW(), 0, null, '18b499a3-e94c-4d5a-a447-277116b488a0', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (671.00, '2020-01-31', NOW(), NOW(), 0, null, 'c337446f-0b50-4980-8c32-86bc005279a4', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (731.00, '2020-02-07', NOW(), NOW(), 0, null, '4c943c7d-e5a4-4ca6-9ecd-617cd27354c9', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (685.00, '2020-02-14', NOW(), NOW(), 0, null, '97f9d270-6bf6-4bee-82b5-332502cf2120', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (734.00, '2020-02-21', NOW(), NOW(), 0, null, '51a95e55-8fb5-4ee1-b8b4-64c5a076a22f', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (680.00, '2020-02-28', NOW(), NOW(), 0, null, '84502e3d-81e5-4ad9-b84d-3984568a4ae9', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (626.00, '2020-03-06', NOW(), NOW(), 0, null, 'abd35878-6f54-4749-ae7b-5459d7ebbcb1', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (747.00, '2020-03-13', NOW(), NOW(), 0, null, '32b34326-8709-4d27-b775-6b315c3213fd', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (704.00, '2020-03-20', NOW(), NOW(), 0, null, '015c4c8c-0406-4f76-8568-57be000f271e', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (639.00, '2020-03-27', NOW(), NOW(), 0, null, '1c657d25-340a-494c-aa4f-5d18151acdbf', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (680.00, '2020-04-03', NOW(), NOW(), 0, null, '94740098-0ef6-431c-932f-1749557fd94c', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (635.00, '2020-04-10', NOW(), NOW(), 0, null, '225f4fc1-21f9-4177-92e4-62dc85167124', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (742.00, '2020-04-17', NOW(), NOW(), 0, null, 'f4356b9d-89e4-48fd-9d9b-ad3ee205a7f3', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b'),
    (748.00, '2020-04-24', NOW(), NOW(), 0, null, '6515288d-4f26-4c90-81e3-5cff71214f61', null, 'c5eb570e-4d68-4778-b7db-34fcaad6e30b');

INSERT INTO users (id, login, password, blocked, verified, login_attempts, version, language, created_at,
                   modified_at, created_by, modified_by, active)
VALUES
    ('78bbdc5a-fd28-419f-bba2-32b76bfddb1a', 'waleria.bartkowiak', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('5262ad35-5d8d-4ad9-9a45-d87e90f44eff', 'ruta.zdunek', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('2a5cce0b-f816-46b1-9c7a-d69ebcd8a801', 'anna.tomczyk', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('cc5ee6f9-b703-4263-9d7f-250098c167ac', 'nikola.sikora', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('1a3cbf8f-7ad2-4b57-a651-867dcaccb0a7', 'józefina.florek', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('4335a835-d839-427c-8b75-06032dfcdce7', 'dionizy.mucha', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('47e68c4b-5819-4a62-9824-a72e476c4cce', 'lidia.piechota', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('e6f5fd10-c0d5-4818-bfc1-2d649555bde0', 'beatrycze.gołąb', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('01f95f95-03b7-4f41-bb62-8a4f1dabd810', 'elwira.radomski', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true),
    ('d5ee5c92-0560-458b-8915-79cf5d9913a9', 'teresa.stolarski', '$2a$12$bOPVAvWOC2f9gJoF37IeE.N9Ij15GfWeVlvHzDPTOJk66NimJMJ4.', false, true, 0, 1, 'PL', NOW(), NOW(), null, null, true);

INSERT INTO personal_data (user_id, email, temp_email, first_name, last_name)
VALUES
    ('78bbdc5a-fd28-419f-bba2-32b76bfddb1a', 'waleria.bartkowiak@mail.com', null, 'Waleria', 'Bartkowiak'),
    ('5262ad35-5d8d-4ad9-9a45-d87e90f44eff', 'ruta.zdunek@mail.com', null, 'Ruta', 'Zdunek'),
    ('2a5cce0b-f816-46b1-9c7a-d69ebcd8a801', 'anna.tomczyk@mail.com', null, 'Anna', 'Tomczyk'),
    ('cc5ee6f9-b703-4263-9d7f-250098c167ac', 'nikola.sikora@mail.com', null, 'Nikola', 'Sikora'),
    ('1a3cbf8f-7ad2-4b57-a651-867dcaccb0a7', 'józefina.florek@mail.com', null, 'Józefina', 'Florek'),
    ('4335a835-d839-427c-8b75-06032dfcdce7', 'dionizy.mucha@mail.com', null, 'Dionizy', 'Mucha'),
    ('47e68c4b-5819-4a62-9824-a72e476c4cce', 'lidia.piechota@mail.com', null, 'Lidia', 'Piechota'),
    ('e6f5fd10-c0d5-4818-bfc1-2d649555bde0', 'beatrycze.gołąb@mail.com', null, 'Beatrycze', 'Gołąb'),
    ('01f95f95-03b7-4f41-bb62-8a4f1dabd810', 'elwira.radomski@mail.com', null, 'Elwira', 'Radomski'),
    ('d5ee5c92-0560-458b-8915-79cf5d9913a9', 'teresa.stolarski@mail.com', null, 'Teresa', 'Stolarski');

INSERT INTO access_levels (id, user_id, level, active, version, created_at, modified_at, created_by, modified_by)
VALUES
    ('caa64c15-17e7-4330-9798-fba991ac8ae4', '78bbdc5a-fd28-419f-bba2-32b76bfddb1a', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('5b1623a5-b5ac-4fbe-9466-45d96ab770ab', '5262ad35-5d8d-4ad9-9a45-d87e90f44eff', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('84c6b8d0-4d32-4361-a52f-edd2a7305a88', '2a5cce0b-f816-46b1-9c7a-d69ebcd8a801', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('1ae3472e-026b-4242-8196-13b83bc1bf7d', 'cc5ee6f9-b703-4263-9d7f-250098c167ac', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('8d8459d5-6c27-4795-aa37-0f2f9db673b8', '1a3cbf8f-7ad2-4b57-a651-867dcaccb0a7', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('9c98f143-2b67-4d7c-a9d5-cd09baf12380', '4335a835-d839-427c-8b75-06032dfcdce7', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('bc7e081e-8260-47b8-b635-06c156b87114', '47e68c4b-5819-4a62-9824-a72e476c4cce', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('57000cb2-f33a-47e4-9581-f5dfe9a1d2b9', 'e6f5fd10-c0d5-4818-bfc1-2d649555bde0', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('96cfd9d7-8eb4-4691-8069-18640cec62d8', '01f95f95-03b7-4f41-bb62-8a4f1dabd810', 'TENANT', true, 0, NOW(), NOW(), null, null),
    ('db5f8e35-b05d-4264-b472-63b77f885c3b', 'd5ee5c92-0560-458b-8915-79cf5d9913a9', 'TENANT', true, 0, NOW(), NOW(), null, null);

INSERT INTO tenants (id)
VALUES
    ('caa64c15-17e7-4330-9798-fba991ac8ae4'),
    ('5b1623a5-b5ac-4fbe-9466-45d96ab770ab'),
    ('84c6b8d0-4d32-4361-a52f-edd2a7305a88'),
    ('1ae3472e-026b-4242-8196-13b83bc1bf7d'),
    ('8d8459d5-6c27-4795-aa37-0f2f9db673b8'),
    ('9c98f143-2b67-4d7c-a9d5-cd09baf12380'),
    ('bc7e081e-8260-47b8-b635-06c156b87114'),
    ('57000cb2-f33a-47e4-9581-f5dfe9a1d2b9'),
    ('96cfd9d7-8eb4-4691-8069-18640cec62d8'),
    ('db5f8e35-b05d-4264-b472-63b77f885c3b');

INSERT INTO role_requests (id, tenant_id, request_date, created_at, modified_at, version, created_by, modified_by)
VALUES
    ('fbd0053f-26e3-4f05-a96b-66c996e0d972', 'caa64c15-17e7-4330-9798-fba991ac8ae4', NOW(), NOW(), NOW(), 0, null, null),
    ('922a6b08-5c42-4c81-af89-98af73a4b805', '5b1623a5-b5ac-4fbe-9466-45d96ab770ab', NOW(), NOW(), NOW(), 0, null, null),
    ('dcd26273-f391-4951-b652-905aabcd6f2b', '84c6b8d0-4d32-4361-a52f-edd2a7305a88', NOW(), NOW(), NOW(), 0, null, null),
    ('e1e2215f-7c13-461b-a965-5b34c8f9785f', '1ae3472e-026b-4242-8196-13b83bc1bf7d', NOW(), NOW(), NOW(), 0, null, null),
    ('521703ac-eedf-4a71-9bb6-a12463c4f662', '8d8459d5-6c27-4795-aa37-0f2f9db673b8', NOW(), NOW(), NOW(), 0, null, null),
    ('b081fe6e-f479-4679-8707-7305051ff9a6', '9c98f143-2b67-4d7c-a9d5-cd09baf12380', NOW(), NOW(), NOW(), 0, null, null),
    ('34fa13c0-a224-4ce7-8b38-ee2a2f65c0ad', 'bc7e081e-8260-47b8-b635-06c156b87114', NOW(), NOW(), NOW(), 0, null, null),
    ('a19fb3e2-8cfc-4c75-891d-86b4fd9a1d05', '57000cb2-f33a-47e4-9581-f5dfe9a1d2b9', NOW(), NOW(), NOW(), 0, null, null),
    ('37010334-5090-4737-8027-05a074f5fb9b', '96cfd9d7-8eb4-4691-8069-18640cec62d8', NOW(), NOW(), NOW(), 0, null, null),
    ('cd4e7219-ff16-4cf5-935d-0eaf2ca9718b', 'db5f8e35-b05d-4264-b472-63b77f885c3b', NOW(), NOW(), NOW(), 0, null, null);
