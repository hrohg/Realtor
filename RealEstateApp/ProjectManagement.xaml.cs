using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for ProjectManagement.xaml
	/// </summary>
	public partial class ProjectManagement : Window
	{


		public ObservableCollection<Project> Projects
		{
			get { return (ObservableCollection<Project>)GetValue(ProjectsProperty); }
			set { SetValue(ProjectsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Projects.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ProjectsProperty =
			DependencyProperty.Register("Projects", typeof(ObservableCollection<Project>), typeof(ProjectManagement), new UIPropertyMetadata(null, OnProjectsChanged));

		private static void OnProjectsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			ProjectManagement form = d as ProjectManagement;
			if (form != null)
			{
				form.Projects = (ObservableCollection<Project>)e.NewValue;
			}
		}


		public ProjectManagement()
		{
			InitializeComponent();
		}

		private void dgProjects_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			Project project = e.Row.Item as Project;
			if (project == null || string.IsNullOrEmpty(project.Name))
			{
				e.Cancel = true;
				return;
			}

			if (project.ProjectID > 0)
			{
				if (!Session.Inst.BEManager.UpdateProject(project))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddProject(project))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as Project;
			if (bt == null) return;

			if (Session.Inst.BEManager.DeleteProject(bt))
			{
				LoadProjects();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void ProjectManagement_OnLoaded(object sender, RoutedEventArgs e)
		{
			LoadProjects();
		}

		private void LoadProjects()
		{
			Projects = new ObservableCollection<Project>(Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode).OrderBy(s => s.Name));
		}

		private void projectManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
