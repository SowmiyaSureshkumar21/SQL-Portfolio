-- Platform: DataLemur
-- Company: Tesla
-- Difficulty: Easy
-- Topic: Filtering, NULL Handling
-- Question: Unfinished Parts

SELECT part,
       assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;