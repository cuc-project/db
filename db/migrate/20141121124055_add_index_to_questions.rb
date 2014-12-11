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
