# Interro


## Concepts

1. Quiz
2. Quiz variant
3. Question bank
4. Question
5. Question variant
6. Question type
7. User Answers
8. Question answer


### Quiz

One collection of questions taken from the Question bank. A quiz can be taken by a user. A quiz can have a time limit, a number of questions, and a passing score.

#### Properties
| Name         | Type         | Description                                        |
| ------------ | ------------ | -------------------------------------------------- |
| id           | `string`     | Unique identifier                                  |
| context      | `string`     | Context of the quiz (Course, Year, Semester...)    |
| name         | `string`     | Name of the quiz displayed in the quiz list        |
| title        | `string`     | Title of the quiz displayed in the quiz page       |
| description  | `string`     | Description of the quiz                            |
| timeLimit    | `number`     | Time limit in minutes                              |
| keywords     | `string[]`   | Keywords to search the quiz                        |
| difficulty   | `number`     | Difficulty level of the quiz                       |
| passingScore | `number`     | Passing score in percentage                        |
| value        | `number`     | Value of the quiz (points)                         |
| questions    | `Question[]` | List of questions ids in the quiz                  |
| createdAt    | `Date`       | Date of creation                                   |
| updatedAt    | `Date`       | Date of last update                                |
| intro        | `string`     | Introduction text (html) displayed before the quiz |
| outro        | `string`     | Outro text (html) displayed after the quiz         |
| remarks      | `string`     | Remarks about the quiz for later updates           |

#### Features

- Create/Edit form
- Paper output
- Inline form
- Grading
- Feedback
- Randomization and shuffling with space optimisation for paper.
- Result output
- Import/Export (XML, JSON, Cloze, GIFT, Moodle XML, QTI)
- Automatic total (and score) calculation
- Inline question (not from the bank)

### Quiz variant

A variant of a quiz. A quiz can have multiple variants. A variant can have a different set of questions, a different time limit, a different passing score, or a different value.

#### Properties

| Name    | Type     | Description                       |
| ------- | -------- | --------------------------------- |
| id      | `string` | Unique identifier                 |
| quiz_id | `Quiz`   | Quiz to which the variant belongs |

Plus any property of the `Quiz` object.

### Question bank

A collection of questions. A question bank can be used to create quizzes. A question bank can be shared between multiple quizzes.

### Question

A question is a statement or a problem that can be answered by a user. A question can have multiple variants. A question can have a type.

#### Properties

| Name      | Type           | Description                                                  |
| --------- | -------------- | ------------------------------------------------------------ |
| id        | `string`       | Unique identifier                                            |
| context   | `string`       | Context of the question (Course, Year, Semester...)          |
| name      | `string`       | Name of the question displayed in the question list          |
| wording   | `string`       | Wording of the question (HTML)                               |
| type_id   | `QuestionType` | Type of the question                                         |
| value     | `number`       | Value of the question (points)                               |
| weight    | `number`       | Default weight of the question. Can be overriden by the quiz |
| answers   | `Answer[]`     | List of answers to the question                              |
| createdAt | `Date`         | Date of creation                                             |
| updatedAt | `Date`         | Date of last update                                          |
| remarks   | `string`       | Remarks about the question for later updates                 |
| details   | `string`       | Introduction text (html) displayed before the question       |
| footer    | `string`       | Footer text (html) displayed after the question              |

### Question variant

A variant of a question. A question can have multiple variants. A variant can have a different wording, a different set of answers, or a different value.

#### Properties

| Name        | Type       | Description                           |
| ----------- | ---------- | ------------------------------------- |
| id          | `string`   | Unique identifier                     |
| question_id | `Question` | Question to which the variant belongs |

Plus any property of the `Question` object.

### Question type

A type of question. A question can have a type. A type can have a name and a description.

#### Properties

| Name        | Type     | Description                      |
| ----------- | -------- | -------------------------------- |
| id          | `string` | Unique identifier                |
| name        | `string` | Name of the question type        |
| description | `string` | Description of the question type |

#### Features
- Create/Edit form
- Paper output
- Inline form
- Grading
- Feedback
- Randomization
- Result output
- Import/Export (XML, JSON, Cloze, GIFT, Moodle XML, QTI)
- Convert to/from other types

#### Typical types
- Multiple choice
- True or false
- Fill in the blank
- Short answer
- Long answer
- Matching
- Ranking
- Multiple response
- Hotspot (click on image)
- Essay
- File upload
- Code
- Math
- Cloze
- Likert scale
