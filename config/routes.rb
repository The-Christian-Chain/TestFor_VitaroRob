Rails.application.routes.draw do
  #######################
  ###   Basic Pages   ###
  #######################

  root to: 'pages#home'

  get 'home',               as: "home",         to:"pages#home"
  get 'about-us',           as: "about",        to:"pages#about"    
  get 'contact-us',         as: "contact",      to:"pages#contact"     
  get 'faq',                as: "faq",          to:"pages#faq"
  get 'media-kit',          as: "media",        to:"pages#media"      
  get 'privacy-policy',     as: "privacy",      to:"pages#privacy"          
  get 'sitemap',            as: "sitemap",      to:"pages#sitemap"    
  get 'social',             as: "social",       to:"pages#social"  
  get 'terms-of-use',       as: "terms",        to:"pages#terms"        

  ######################
  ###    Settings    ###
  ######################

  get     'admin/settings',       as: 'setting',          to: 'settings#show'
  get     'admin/settings/edit',  as: 'edit_setting',     to: 'settings#edit'
  patch   'admin/settings',                                to: 'settings#update'
  put     'admin/settings/:id',                            to: 'settings#update'

  ######################
  ###    Profiles    ###
  ######################

  get     'create/user_name',                    as: 'create_user_name',   to: 'profiles#user_name'
  get     'create/profile',                     as: 'create_profile',     to: 'profiles#create_profile'
  get     'cancel_walkthrough',                 as: 'cancel_walkthrough', to: 'profiles#cancel_walkthrough'

  get     'profiles',                           as: 'profile',            to: 'profiles#index'
  get     'members',                            as: 'members_list',       to: 'profiles#index'
  post    'profiles',                                                     to: 'profiles#create'
  get     'member/:user_name/edit/',             as: 'edit_profile_page',  to: 'profiles#edit'
  get     'member/:user_name/',                  as: 'member_profile',     to: 'profiles#show'
  get     'member/:user_name/:page/sort/',       as: 'pledge_sort_year',   to: 'profiles#show'
  get     'member/:user_name/:page',             as: 'member_profile_page',to: 'profiles#show'
  
  put     'profiles/:id',                                                 to: 'profiles#update'
  patch   'profiles/',                                                    to: 'profiles#update'
  patch   'profiles/:id/:status',               as: 'member_status',      to: 'profiles#status'
  delete  'profiles/:id',                                                 to: 'profiles#destroy'

  ######################
  ###    Members     ###
  ######################

  devise_for :members, 
              controllers: {
                ##Specific Controller##                
                sessions: 'members/sessions',
                registrations:  'members/registrations'
              },
              path: '', path_names: { 
                  sign_in:      'login', 
                  sign_out:     'logout', 
                  sign_up:      'register',
                  edit:         ':user_name/account/edit'
              }

  ######################
  ###      Blog      ###
  ######################

  get     '/blog',                        as: 'blog',               to: 'blogs#index'
  post    '/blog',                        as: 'blog_search',        to: 'blogs#search'
  get     '/blog/settings',               as: 'blog_settings',      to: 'blogs#show'
  get     '/blog/edit',                   as: 'edit_blog',          to: 'blogs#edit'
  patch   '/blog/',                                                 to: 'blogs#update'
  put     '/blog/',                                                 to: 'blogs#update'

  get     '/blog/list',                   as: 'post_list',          to: 'blogs#list'
  get     '/blog/section/:section',       as: "section",            to: 'blogs#index'
  get     '/blog/category/:category',     as: "category",           to: 'blogs#index'
  get     '/blog/tag/:tag',               as: "tag",                to: 'blogs#index'
  get     '/blog/author/:author',         as: "author",             to: 'blogs#index'  
  get     '/posts',                       as: 'posts',              to: 'posts#index'
  get     '/post',                        as: 'posts2',             to: 'posts#index'

  post    '/posts',                                                 to: 'posts#create'
  get     '/blog/post/new',               as: 'new_post',           to: 'posts#new'
  get     '/blog/:id/edit',               as: 'edit_post',          to: 'posts#edit'
  get     '/blog/:id',                    as: 'post',               to: 'posts#show'
    
  patch   '/blog/:id',                                              to: 'posts#update'
  put     '/blog/:id',                                              to: 'posts#update'
  post    '/blog/:id',                                              to: 'posts#toggle_delete'
  delete  '/blog/:id',                                              to: 'posts#destroy'
  
  ##End of Routes File
end