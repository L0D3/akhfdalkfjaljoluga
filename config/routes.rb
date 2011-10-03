PatverV1::Application.routes.draw do 
  get "sessions/new"

  root :to => 'patents#index'
  resources :patent_protocols do
    collection do
      get :pdf_patentprotocols_tabelle
    end
  end
  resources :bills do
    collection do
     get :pdf_rechnung
      get :pdf_bill_tabelle
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
      get :pdf_patentliste
      get :editsubmissions
      put :updatesubmissions
    end
  end
end
