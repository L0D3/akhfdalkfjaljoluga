PatverV1::Application.routes.draw do 
  get "sessions/new"

  root :to => 'patents#index'
  resources :patent_protocols
  resources :bills do
    collection do
     get :pdf_rechnung
    end
  end
  resources :fees
  resources :users do
    collection do
      get :edit_individually
      put :update_individually
    end
  end
  resources :patents do
    collection do
      get :pdf_patent_tabelle
      get :pdf_anfrage_eu
      get :pdf_anfrage_de
      get :pdf_erinnerung1_de
      get :pdf_erinnerung1_eu
      get :pdf_erinnerung2_de
      get :pdf_erinnerung2_eu
      get :pdf_rechnung_de
      get :pdf_rechnung_eu
      get :pdf_patentübersicht
      get :pdf_patentliste
      get :edit_submissions
      put :update_submissions
    end
  end
end
