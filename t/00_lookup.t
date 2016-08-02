use Test::Simple tests => 7;

use Business::IBAN::NL::BIC;

my $bic = Business::IBAN::NL::BIC->new;
ok ( defined ( $bic ) && ref $bic eq 'Business::IBAN::NL::BIC', 'object initialisation' );

ok ( $bic->bic ( 'NL12INGB01234567890' ) eq 'INGBNL2A', 'BIC lookup of Dutch account' );
ok ( $bic->name ( 'NL12INGB01234567890' ) =~ /ING Bank/i, 'name lookup of Dutch account' );

ok ( ! defined $bic->bic ( 'XX12INGB01234567890' ), 'BIC lookup of invalid (foreign) account' );
ok ( ! defined $bic->name ( 'XX12INGB01234567890' ), 'name lookup of invalid (foreign) account' );

ok ( ! defined $bic->bic ( 'NL12INVA01234567890' ), 'BIC lookup of invalid (Dutch) account' );
ok ( ! defined $bic->name ( 'NL12INVA01234567890' ), 'name lookup of invalid (Dutch) account' );
