create extension if not exists pgcrypto;

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  client text not null,
  category text not null,
  video_url text not null,
  created_at timestamptz not null default now()
);

alter table public.projects enable row level security;

create policy "Anyone can view published projects" on public.projects
for select to anon, authenticated using (true);

create policy "Signed-in admin can add projects" on public.projects
for insert to authenticated with check (true);

create policy "Signed-in admin can edit projects" on public.projects
for update to authenticated using (true) with check (true);

create policy "Signed-in admin can delete projects" on public.projects
for delete to authenticated using (true);

insert into storage.buckets (id, name, public)
values ('videos', 'videos', true)
on conflict (id) do update set public = true;

create policy "Anyone can watch public videos" on storage.objects
for select to anon, authenticated using (bucket_id = 'videos');

create policy "Signed-in admin can upload videos" on storage.objects
for insert to authenticated with check (bucket_id = 'videos');

create policy "Signed-in admin can update videos" on storage.objects
for update to authenticated using (bucket_id = 'videos') with check (bucket_id = 'videos');

create policy "Signed-in admin can delete videos" on storage.objects
for delete to authenticated using (bucket_id = 'videos');
