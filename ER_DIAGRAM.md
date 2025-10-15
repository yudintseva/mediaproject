# ER Diagram — MediaProject (Mermaid)

```mermaid
erDiagram
  USERS ||--|| PROFILES : "has_one"
  USERS ||--o{ POSTS : "has_many"
  USERS ||--o{ COMMENTS : "has_many"
  USERS ||--o{ LIKES : "has_many"
  PROFILES }o--|| USERS : "belongs_to"
  CATEGORIES ||--o{ POSTS : "has_many"
  POSTS }o--|| USERS : "belongs_to"
  POSTS }o--|| CATEGORIES : "belongs_to"
  POSTS ||--o{ ATTACHMENTS : "has_many"
  POSTS ||--o{ COMMENTS : "has_many"
  POSTS ||--o{ LIKES : "has_many"
  COMMENTS }o--|| USERS : "belongs_to"
  COMMENTS }o--|| POSTS : "belongs_to"
  COMMENTS }o--o{ COMMENTS : "self parent_id (optional)"
  LIKES }o--|| USERS : "belongs_to"
  LIKES }o--|| POSTS : "belongs_to"

