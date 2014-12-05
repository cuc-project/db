class AddIndexToQuestions < ActiveRecord::Migration
  def change
    execute %q{
      drop index if exists questions_text_search_idx;
      create index questions_text_search_idx on questions using
        gin(
          (
            to_tsvector('simple', coalesce("questions"."text"::text, '')) ||
            to_tsvector('simple', coalesce("questions"."answer"::text, '')) ||
            to_tsvector('simple', coalesce("questions"."comment"::text, ''))
          )
        );
      }
  end
end
# def change
#   # => Create gin index for materialized view
#   execute %q{
#     drop index if exists admin_clients_search_idx;
#     create index admin_clients_search_idx ON clients
#     using gin( (to_tsvector('simple', coalesce("clients"."id"::text, '')) ||
#     to_tsvector('simple', coalesce("clients"."name"::text, '')) ||
#     to_tsvector('simple', coalesce("clients"."email"::text, '')) ) );
#   }
# end