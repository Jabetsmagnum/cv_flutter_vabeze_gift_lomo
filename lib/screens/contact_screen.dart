import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const String _email = 'gjabets@gmail.com';
  static const String _phone = '0824460383';
  static const String _linkedinUrl = 'https://www.linkedin.com/in/gift-yabeze';
  static const String _githubUrl = 'https://github.com/gjabets';

  Future<void> _launchExternalUrl(BuildContext context, String urlString) async {
    final uri = Uri.parse(urlString);
    try {
      final success = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Impossible d\'ouvrir le lien : $urlString'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur : $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _copy(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copié !'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Carte d'introduction
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              padding: const EdgeInsets.all(22.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primaryContainer.withAlpha(200),
                    colorScheme.surface,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: colorScheme.primary,
                    child: const Icon(
                      Icons.contact_phone_rounded,
                      size: 38,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Restons en contact',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Retrouvez ci-dessous l\'ensemble de mes coordonnées directes et mes profils professionnels.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Coordonnées directes
          _buildCategoryTitle(context, 'Coordonnées directes'),
          const SizedBox(height: 12),

          _buildContactCard(
            context,
            title: 'Adresse E-mail',
            value: _email,
            actionLabel: 'Envoyer un e-mail',
            icon: Icons.email_rounded,
            color: Colors.redAccent,
            onTap: () => _launchExternalUrl(context, 'mailto:$_email?subject=Contact%20depuis%20l\'application%20CV'),
            onCopy: () => _copy(context, _email, 'E-mail'),
          ),
          const SizedBox(height: 14),

          _buildContactCard(
            context,
            title: 'Téléphone',
            value: _phone,
            actionLabel: 'Passer un appel',
            icon: Icons.phone_rounded,
            color: Colors.green,
            onTap: () => _launchExternalUrl(context, 'tel:$_phone'),
            onCopy: () => _copy(context, _phone, 'Numéro'),
          ),
          const SizedBox(height: 24),

          // Réseaux & Profils
          _buildCategoryTitle(context, 'Réseaux & Plateformes'),
          const SizedBox(height: 12),

          _buildContactCard(
            context,
            title: 'LinkedIn',
            value: 'linkedin.com/in/gift-yabeze',
            actionLabel: 'Consulter le profil',
            icon: Icons.business_rounded,
            color: const Color(0xFF0077B5),
            onTap: () => _launchExternalUrl(context, _linkedinUrl),
            onCopy: () => _copy(context, _linkedinUrl, 'Lien LinkedIn'),
          ),
          const SizedBox(height: 14),

          _buildContactCard(
            context,
            title: 'GitHub',
            value: 'github.com/gjabets',
            actionLabel: 'Explorer les dépôts',
            icon: Icons.code_rounded,
            color: const Color(0xFF24292E),
            onTap: () => _launchExternalUrl(context, _githubUrl),
            onCopy: () => _copy(context, _githubUrl, 'Lien GitHub'),
          ),
          const SizedBox(height: 14),

          // Localisation
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.amber.withAlpha(25),
                    child: const Icon(Icons.location_on_rounded, color: Colors.amber, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Localisation',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.outline,
                          ),
                        ),
                        Text(
                          'Kinshasa, RDC',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
        letterSpacing: 0.3,
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required String title,
    required String value,
    required String actionLabel,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required VoidCallback onCopy,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: color.withAlpha(25),
                    child: Icon(icon, color: color, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          value,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy_rounded, size: 20),
                    tooltip: 'Copier',
                    onPressed: onCopy,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonalIcon(
                  onPressed: onTap,
                  icon: const Icon(Icons.open_in_new_rounded, size: 16),
                  label: Text(actionLabel),
                  style: FilledButton.styleFrom(
                    backgroundColor: color.withAlpha(25),
                    foregroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
