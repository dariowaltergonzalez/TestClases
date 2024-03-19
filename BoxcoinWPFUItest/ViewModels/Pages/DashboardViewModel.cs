// This Source Code Form is subject to the terms of the MIT License.
// If a copy of the MIT was not distributed with this file, You can obtain one at https://opensource.org/licenses/MIT.
// Copyright (C) Leszek Pomianowski and WPF UI Contributors.
// All Rights Reserved.

using Model;
using System.Security.Cryptography.X509Certificates;

namespace BoxcoinWPFUItest.ViewModels.Pages
{
    public partial class DashboardViewModel : ObservableObject
    {
        [ObservableProperty]
        private int _counter = 0;

        [ObservableProperty]
        private List<usuarios> _usuarios = new List<usuarios>();

        [ObservableProperty]
        private string _nombre = "prueba";

        [RelayCommand]
        private void OnCounterIncrement()
        {
            Counter++;

            Model.Consultas db = new Model.Consultas();
            Usuarios = db.ConsultarUsuarios();

            
        }

        [RelayCommand]
        private void OnAgregarNuevo()
        {
            Counter++;
            usuarios usuario = new usuarios();
            usuario.nombre = Nombre;
            Model.Consultas db = new Model.Consultas();
            db.GuardarUsuario(usuario);

            OnCounterIncrement();

        }


    }
}
