enum MenuPopup {
  FILTRO, EDITAR, DELETE, FIXOS, PREVISTOS,
}

Map<MenuPopup, String> enumToMenuItem = {
  MenuPopup.FILTRO: 'Filtrar',
  MenuPopup.EDITAR: 'Editar',
  MenuPopup.DELETE: 'Excluir',
  MenuPopup.FIXOS: 'Fixos Gerais',
  MenuPopup.PREVISTOS: 'Previsto Gerais',
};

Map<MenuPopup, String> enumToMenuItemNotFound = {
  MenuPopup.FIXOS: 'Fixos Gerais',
  MenuPopup.PREVISTOS: 'Previsto Gerais',
};

Map<String, MenuPopup> menuItemsToEnum = {
  'Filtrar': MenuPopup.FILTRO,
  'Editar': MenuPopup.EDITAR,
  'Excluir': MenuPopup.DELETE,
  'Fixos Gerais': MenuPopup.FIXOS,
  'Previsto Gerais': MenuPopup.PREVISTOS,
};