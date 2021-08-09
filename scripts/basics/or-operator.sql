
# If both A and B are not NULL, the OR operator returns 1 (true) if either A or B is non-zero

SELECT
  1 OR 1,
  1 OR 0,
  0 OR 1,
  NULL OR 1,
  1 OR NULL,
  NULL OR 0,
  0 OR NULL,
  NULL OR NULL;

# `OR` and `AND` are short-circuit operators

SELECT 1 = 1 OR 100 / 0; # 1
SELECT 1 / 0 OR 1 = 1; # NULL OR 1 = 1

# Operator precedence

SELECT
  1 OR 0 AND 0 OR 1 # (1 OR (1 AND 0)) OR 1 - how it really works


